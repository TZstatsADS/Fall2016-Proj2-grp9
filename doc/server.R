#Server#
shinyServer(function(input, output) {
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles(
        urlTemplate = "https://api.mapbox.com/v4/mapbox.streets/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoiZnJhcG9sZW9uIiwiYSI6ImNpa3Q0cXB5bTAwMXh2Zm0zczY1YTNkd2IifQ.rjnjTyXhXymaeYG6r2pclQ",
        attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%
      setView(lng = -73.97, lat = 40.75, zoom = 13)
  })
  
#Stations status (TimeRange)#
  Sstatus<-reactive({
   status<-data_Time[[input$TimeRange]]
   nuba<-status$Num_bikes_available
   nuda<-status$Num_dock_available
   slat_a<-slat[nuba!=0&nuda!=0]
   slon_a<-slon[nuba!=0&nuda!=0]
   sname_a<-sname[nuba!=0&nuda!=0]
   nuba_a<-nuba[nuba!=0&nuda!=0]
   nuda_a<-nuda[nuba!=0&nuda!=0]
   slat_u<-slat[nuba==0|nuda==0]
   slon_u<-slon[nuba==0|nuda==0]
   sname_u<-sname[nuba==0|nuda==0]
   nuba_u<-nuba[nuba==0|nuda==0]
   nuda_u<-nuda[nuba==0|nuda==0]
   S_a<-data.frame(slat_a,slon_a,sname_a,nuba_a,nuda_a)
   S_u<-data.frame(slat_u,slon_u,sname_u,nuda_u,nuda_u)
   return(list(S_a=S_a,S_u=S_u))})


#Initial plots#
observe({
  leafletProxy("map") %>%
  clearMarkers() %>%
  addMarkers(data=Sstatus()[["S_a"]],~Sstatus()[["S_a"]]$slon_a,~Sstatus()[["S_a"]]$slat_a,icon=Bikeicons1,popup=~paste("Name: ",Sstatus()[["S_a"]]$sname_a,"<br>",as.character(Sstatus()[["S_a"]]$nuba_a)," bikes available, ",as.character(Sstatus()[["S_a"]]$nuda_a),"docks available"))%>%
  addMarkers(data=Sstatus()[["S_u"]],~Sstatus()[["S_u"]]$slon_u,~Sstatus()[["S_u"]]$slat_u,icon=Bikeicons2,popup=~paste("Name: ",Sstatus()[["S_u"]]$sname_u,"<br>",as.character(Sstatus()[["S_u"]]$nuba_u)," bikes available, ",as.character(Sstatus()[["S_u"]]$nuda_u),"docks available"))
})
#2 addresses part#
observe(
{
  if(input$submit[1]>0)
  {
  add_origin<-geocode(input$address1)
  add_destination<-geocode(input$address2)
  rlat<-add_origin[2]
  rlon<-add_origin[1]
  glat<-add_destination[2]
  glon<-add_destination[1]
  r1<-Nearest3(rlat,rlon,slat,slon,Sstatus()[["S_a"]]$nuba,Sstatus()[["S_a"]]$nuda,sname)
  g1<-Nearest3(glat,glon,slat,slon,Sstatus()[["S_a"]]$nuba,Sstatus()[["S_a"]]$nuda,sname)
  slat1<-c(r1$p1[1],r1$p2[1],r1$p3[1],g1$p1[1],g1$p2[1],g1$p3[1])
  slon1<-c(r1$p1[2],r1$p2[2],r1$p3[2],g1$p1[2],g1$p2[2],g1$p3[2])
  nuba1<-c(r1$p1[3],r1$p2[3],r1$p3[3],g1$p1[3],g1$p2[3],g1$p3[3])
  nuda1<-c(r1$p1[4],r1$p2[4],r1$p3[4],g1$p1[4],g1$p2[4],g1$p3[4])
  sname1<-c(r1$p1[5],r1$p2[5],r1$p3[5],g1$p1[5],g1$p2[5],g1$p3[5])
position1<-data.frame(slon1,slat1)
leafletProxy("map")%>%
  clearMarkers() %>%
  addMarkers(rlon,rlat,popup="Start")%>%addMarkers(glon,glat,popup="End")%>%
  addMarkers(data=position1,~slon1,~slat1,icon=Bikeicons1,popup=~paste("Name: ",sname1,"<br>",as.character(nuba1)," bikes available, ",as.character(nuda1),"docks available"))
}})
#Click event#
click<-reactive({
event1<-input$map_marker_click
if (is.null(event1))
{return()}
event2<-input$map_marker_click
if (is.null(event1))
{return()}
ulat <- event1$lat
ulon <- event1$lng
vlat<-event2$lat
vlon<-event2$lng
u<-data.frame(ulat,ulon)
v<-data.frame(vlat,vlon)
return(list(u=u,v=v))
})

#One Stop or not#
observe({
if(input$OneStop=="FALSE")
{ 
#Google Api#
  wed_add<-sprintf("https://maps.googleapis.com/maps/api/distancematrix/json?origins=%f,%f&destinations=%f,%f&mode=bicycling&key=%s",click()[["u"]]$ulat,click()[["u"]]$ulon,click()[["v"]]$vlat,click()[["v"]]$vlon,Api_key)
  Route<-fromJSON(wed_add,simplify = FALSE)
  Distances<-Route$rows[[1]]$elements[[1]]$distance$text
  Times<-Route$rows[[1]]$elements[[1]]$duration$text 
  poly <- geoRoute(click()[["v"]]$vlat,click()[["v"]]$vlon,click()[["u"]]$ulat,click()[["u"]]$ulon)
  llatlon <- decodeLine(poly)
  leafletProxy("map") %>%
    clearShapes() %>%
    addPolylines(lng=llatlon$lon,lat=llatlon$lat,color="blue",popup=sprintf("Time=%s, Distance=%s",Times,Distances))
}
if(input$OneStop=="TRUE")
{ 
  mid_lat<-(click()[["u"]]$ulat+click()[["v"]]$vlat)/2
  mid_lon<-(click()[["u"]]$ulon+click()[["v"]]$vlon)/2
  mid1<-Nearest3(mid_lat,mid_lon,slat,slon,Sstatus[["S_a"]]$nuba,Sstatus[["S_a"]]$nuda,sname)
  poly1<- geoRoute(click()[["u"]]$ulat,click()[["u"]]$ulon,mid1$p1[1],mid1$p1[2])
  poly2 <- geoRoute(mid1$p1[1],mid1$p1[2],click()[["v"]]$vlat,click()[["v"]]$vlon)
  llatlon1 <- decodeLine(poly1)
  llatlon2 <- decodeLine(poly2)
 #Google Api#
  wed_add1<-sprintf("https://maps.googleapis.com/maps/api/distancematrix/json?origins=%f,%f&destinations=%f,%f&mode=bicycling&key=%s",click()[["u"]]$ulat,click()[["u"]]$ulon,mid1$p1[1],mid1$p1[2],Api_key)
  Route1<-fromJSON(wed_add1,simplify = FALSE)
  Distances1<-Route1$rows[[1]]$elements[[1]]$distance$text
  Times1<-Route1$rows[[1]]$elements[[1]]$duration$text
  wed_add2<-sprintf("https://maps.googleapis.com/maps/api/distancematrix/json?origins=%f,%f&destinations=%f,%f&mode=bicycling&key=%s",mid1$p1[1],mid1$p1[2],click()[["v"]]$vlat,click()[["v"]]$vlon,Api_key)
  Route2<-fromJSON(wed_add2,simplify = FALSE)
  Distances2<-Route2$rows[[1]]$elements[[1]]$distance$text
  Times2<-Route2$rows[[1]]$elements[[1]]$duration$text
  leafletProxy("map") %>% clearShapes() %>%
  addMarkers(mid1$p1[2],mid1$p1[1],popup=paste("Mid, ","<br>","Name: ",mid1$p1[5],"<br>",as.character(mid1$p1[3])," bikes available, ",as.character(mid1$p1[4]),"docks available"))%>%
  addPolylines(lng=llatlon1$lon,lat=llatlon1$lat,color="blue",popup=sprintf("Time=%s, Distance=%s",Times1,Distances1))%>%
  addPolylines(lng=llatlon2$lon,lat=llatlon2$lat,color="red",popup=sprintf("Time=%s, Distance=%s",Times2,Distances2))
}})
})