#ggmap#
library(httr)
library(ggplot2)
library(ggmap)
library(leaflet)
library(devtools)
library(taRifx)
library(sp)
library(plyr)
library(reshape2)
library(taRifx.geo)
library(shiny)
library(RCurl)
library(RJSONIO)
library(dplyr)
library(stringr)
sampleb<-GET("https://gbfs.citibikenyc.com/gbfs/en/station_information.json")
resultb<-content(sampleb)
sname<-vector(length=664)
slat<-vector(length=664)
slon<-vector(length=664)
for(i in 1:length(resultb$data$stations))
{ sname[i]<-resultb$data$stations[[i]]$name
  slat[i]<-resultb$data$stations[[i]]$lat
  slon[i]<-resultb$data$stations[[i]]$lon}
position<-data.frame(slon,slat)
#Stations status#
status<-readRDS("C:/Users/Owner/Desktop/ADS/Project2/1pm.RData")
nuba<-vector(length=664)
nubd<-vector(length=664)
nuda<-vector(length=664)
nudd<-vector(length=664)
for(i in 1:664)
{ nuba[i]<-status$data$stations[[i]]$num_bikes_available
nubd[i]<-status$data$stations[[i]]$num_bikes_disabled
nuda[i]<-status$data$stations[[i]]$num_docks_available
nudd[i]<-status$data$stations[[i]]$num_docks_disabled }


#Bikeicons#
Bikeicons<-icons(iconUrl=ifelse(nuba==0|nuda==0,"C:/Users/Owner/Desktop/ADS/Project2/No.png","C:/Users/Owner/Desktop/ADS/Project2/092-512.png"),iconWidth=20,iconHeight=20)

#Nearest 3 points#
Nearest3<-function(xlat,xlon,slat,slon,nuba,nuda)
{ 
  distance<-vector(length=length(slat))
  for(i in 1:length(slat))
  { if((nuba[i]!=0)&(nuda[i]!=0))
    {distance[i]<-sqrt((xlat-slat[i])^2+(xlon-slon[i])^2)}
    else
    {distance[i]<-1000000}}
  rdis<-rank(distance)
  p1<-c(slat[rdis==1],slon[rdis==1],nuba[rdis==1],nuda[rdis==1])
  p2<-c(slat[rdis==2],slon[rdis==2],nuba[rdis==2],nuda[rdis==2])
  p3<-c(slat[rdis==3],slon[rdis==3],nuba[rdis==3],nuda[rdis==3])
  return(list(p1=p1,p2=p2,p3=p3))
  }



#decodeLine#
decodeLine <- function(encoded){
  require(bitops)
  
  vlen <- nchar(encoded)
  vindex <- 0
  varray <- NULL
  vlat <- 0
  vlng <- 0
  
  while(vindex < vlen){
    vb <- NULL
    vshift <- 0
    vresult <- 0
    repeat{
      if(vindex + 1 <= vlen){
        vindex <- vindex + 1
        vb <- as.integer(charToRaw(substr(encoded, vindex, vindex))) - 63  
      }
      
      vresult <- bitOr(vresult, bitShiftL(bitAnd(vb, 31), vshift))
      vshift <- vshift + 5
      # print(vb)
      if(vb < 32) break
    }
    
    dlat <- ifelse(
      bitAnd(vresult, 1)
      , -(bitShiftR(vresult, 1)+1)
      , bitShiftR(vresult, 1)
    )
    vlat <- vlat + dlat
    
    vshift <- 0
    vresult <- 0
    repeat{
      if(vindex + 1 <= vlen) {
        vindex <- vindex+1
        vb <- as.integer(charToRaw(substr(encoded, vindex, vindex))) - 63        
      }
      
      vresult <- bitOr(vresult, bitShiftL(bitAnd(vb, 31), vshift))
      vshift <- vshift + 5
      if(vb < 32) break
    }
    
    dlng <- ifelse(
      bitAnd(vresult, 1)
      , -(bitShiftR(vresult, 1)+1)
      , bitShiftR(vresult, 1)
    )
    vlng <- vlng + dlng
    
    varray <- rbind(varray, c(vlat * 1e-5, vlng * 1e-5))
  }
  coords <- data.frame(varray)
  names(coords) <- c("lat", "lon")
  coords
}
#url2#
url2 <- function(ori_lat,ori_lng,des_lat,des_lng,return.call = "json", sensor = "false") {
  root <- "http://maps.google.com/maps/api/directions/"
  u <- paste(root, return.call, "?origin=", ori_lat,"+",ori_lng,"&destination=",des_lat,"+",des_lng,"&sensor=", sensor, sep = "")
  return(URLencode(u))
}
#geoRoute#
geoRoute <- function(ori_lat,ori_lng,des_lat,des_lng) {
  #if(verbose) cat(address,"\n")
  u <- url2(ori_lat,ori_lng,des_lat,des_lng)
  doc <- getURL(u)
  x <- fromJSON(doc,simplify = FALSE)
  if(x$status=="OK") {
    route <- x$route[[1]]$overview_polyline$points
    return(route)
    Sys.sleep(0.5)
  } else {
    return(NA)
  }
}


#georoute#
rlat <- 40.75
rlon <- -73.973
glat <- 40.76
glon<- -73.98
r1<-Nearest3(rlat,rlon,slat,slon,nuba,nuda)
g1<-Nearest3(glat,glon,slat,slon,nuba,nuda)
slat1<-c(r1$p1[1],r1$p2[1],r1$p3[1],g1$p1[1],g1$p2[1],g1$p3[1])
slon1<-c(r1$p1[2],r1$p2[2],r1$p3[2],g1$p1[2],g1$p2[2],g1$p3[2])
nuba1<-c(r1$p1[3],r1$p2[3],r1$p3[3],g1$p1[3],g1$p2[3],g1$p3[3])
nuda1<-c(r1$p1[4],r1$p2[4],r1$p3[4],g1$p1[4],g1$p2[4],g1$p3[4])
position1<-data.frame(slon1,slat1)
poly <- geoRoute(r1$p1[1],r1$p1[2],g1$p2[1],g1$p2[2])
llatlon <- decodeLine(poly)
Bikeicons1<-icons(iconUrl="C:/Users/Owner/Desktop/ADS/Project2/092-512.png",iconWidth=20,iconHeight=20)

#Google Api time#
Api_key<-"AIzaSyA0UYIWqZLCE-IBl5x1mrhZJ8wdRh5yVcM"
wed_add<-sprintf("https://maps.googleapis.com/maps/api/distancematrix/json?origins=%s,%s&destinations=%s,%s&mode=bicycling&key=%s",r1$p1[1],r1$p1[2],g1$p1[1],g1$p1[2],Api_key)
Route<-fromJSON(wed_add)
Distances<-Route$rows[[1]]$elements[[1]]$distance$text
Times<-Route$rows[[1]]$elements[[1]]$duration$text

#leaflet#
leaflet(data=position) %>%
  addTiles(
    urlTemplate = "https://api.mapbox.com/styles/v1/mapbox/streets-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jvenp6eiIsImEiOiJjaXUxcDM0YjcwY2M1MnRxdGgyYmpmejJ5In0.RIFdcxZWeT9E1AALqa8cvA",
    attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
    )%>%addMarkers(~slon,~slat,icon=Bikeicons,popup=~paste(as.character(nuba)," bikes available, ",as.character(nuda),"docks available"))%>%
   setView(lng = -73.97, lat = 40.75, zoom = 13)

#leaflet-Nearest#
leaflet(data=position1)%>%
  addTiles(
    urlTemplate = "https://api.mapbox.com/styles/v1/mapbox/streets-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jvenp6eiIsImEiOiJjaXUxcDM0YjcwY2M1MnRxdGgyYmpmejJ5In0.RIFdcxZWeT9E1AALqa8cvA",
    attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
  )%>%addMarkers(rlon,rlat,popup="Start")%>%addMarkers(glon,glat,popup="End")%>%
  addMarkers(~slon1,~slat1,icon=Bikeicons1,popup=~paste(as.character(nuba1)," bikes available, ",as.character(nuda1),"docks available"))%>%
  addPolylines(lng=llatlon$lon,lat=llatlon$lat,color="blue",popup=sprintf("Time=%s, Distance=%s",Times,Distances))%>%
  setView(lng = -73.97, lat = 40.75, zoom = 13)

#leaflet-Nearest-overlap,server part#
#leafletProxy("map") %>%
#  clearMarkers() %>%
#  addMarkers(rlon,rlat,popup="Start")%>%addMarkers(glon,glat,popup="End")%>%
#  addMarkers(data=position1,~slon1,~slat1,icon=Bikeicons1,popup=~paste(as.character(nuba1)," bikes available, ",as.character(nuda1),"docks available"))%>%
#  addPolylines(lng=llatlon$lon,lat=llatlon$lat,color="blue",popup=sprintf("Time=%s, Distance=%s",Times,Distances))%>%
#  setView(lng = -73.97, lat = 40.75, zoom = 13)


#mid-point,georoute#
rlat <- 40.75
rlon <- -73.973
glat <- 40.76
glon<- -73.98
mid_lat<-(rlat+glat)/2
mid_lon<-(rlon+glon)/2
r1<-Nearest3(rlat,rlon,slat,slon,nuba,nuda)
g1<-Nearest3(glat,glon,slat,slon,nuba,nuda)
mid1<-Nearest3(mid_lat,mid_lon,slat,slon,nuba,nuda)
slat2<-c(r1$p1[1],r1$p2[1],r1$p3[1],g1$p1[1],g1$p2[1],g1$p3[1])
slon2<-c(r1$p1[2],r1$p2[2],r1$p3[2],g1$p1[2],g1$p2[2],g1$p3[2])
nuba2<-c(r1$p1[3],r1$p2[3],r1$p3[3],g1$p1[3],g1$p2[3],g1$p3[3])
nuda2<-c(r1$p1[4],r1$p2[4],r1$p3[4],g1$p1[4],g1$p2[4],g1$p3[4])
position2<-data.frame(slon2,slat2)
poly1<- geoRoute(r1$p1[1],r1$p1[2],mid1$p1[1],mid1$p1[2])
poly2 <- geoRoute(mid1$p1[1],mid1$p1[2],g1$p2[1],g1$p2[2])
llatlon1 <- decodeLine(poly1)
llatlon2 <- decodeLine(poly2)
Midicon<-icons(iconUrl="C:/Users/Owner/Desktop/ADS/Project2/129538-simple-red-square-icon-signs-z-roadsign20.png",iconWidth=50,iconHeight=50)

#mid Api#
wed_add1<-sprintf("https://maps.googleapis.com/maps/api/distancematrix/json?origins=%s,%s&destinations=%s,%s&mode=bicycling&key=%s",r1$p1[1],r1$p1[2],mid1$p1[1],mid1$p1[2],Api_key)
Route1<-fromJSON(wed_add1)
Distances1<-Route1$rows[[1]]$elements[[1]]$distance$text
Times1<-Route1$rows[[1]]$elements[[1]]$duration$text
wed_add2<-sprintf("https://maps.googleapis.com/maps/api/distancematrix/json?origins=%s,%s&destinations=%s,%s&mode=bicycling&key=%s",mid1$p1[1],mid1$p1[2],g1$p2[1],g1$p2[2],Api_key)
Route2<-fromJSON(wed_add2)
Distances2<-Route2$rows[[1]]$elements[[1]]$distance$text
Times2<-Route2$rows[[1]]$elements[[1]]$duration$text

#leaflet-Mid-Nearest#
leaflet(data=position2)%>%
  addTiles(
    urlTemplate = "https://api.mapbox.com/styles/v1/mapbox/streets-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoia3Jvenp6eiIsImEiOiJjaXUxcDM0YjcwY2M1MnRxdGgyYmpmejJ5In0.RIFdcxZWeT9E1AALqa8cvA",
    attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
  )%>%addMarkers(rlon,rlat,popup="Start")%>%addMarkers(mid1$p1[2],mid1$p1[1],icon=Midicon,popup="Mid")%>%addMarkers(glon,glat,popup="End")%>%
  addMarkers(~slon2,~slat2,icon=Bikeicons1,popup=~paste(as.character(nuba2)," bikes available, ",as.character(nuda2),"docks available"))%>%
  addPolylines(lng=llatlon1$lon,lat=llatlon1$lat,color="blue",popup=sprintf("Time=%s, Distance=%s",Times1,Distances1))%>%
  addPolylines(lng=llatlon2$lon,lat=llatlon2$lat,color="red",popup=sprintf("Time=%s, Distance=%s",Times2,Distances2))%>%
  setView(lng = -73.97, lat = 40.75, zoom = 13)



#LRM#
#map<-Leaflet$new()
#for(i in 1:664)
#{ if((slat[i]!=0)&(slon[i]!=0))
#    {map$marker(c(slat[i],slon[i]),bindPopup=paste(as.character(nuba[i])," bikes available, ",as.character(nuda[i]),"docks available"))}
#  if((slat[i]==0)|(slon[i]==0))
#    {dat<-c(slat[i],slon[i])
#     dat<-transform(dat,color="red")
#     map$marker(c(dat,bindPopup=paste(as.character(nuba[i])," bikes available, ",as.character(nuda[i]),"docks available")))}
#}
#map$setView(c(40.75,-73.97), 13)
#mywaypoints = list(c(slat[1], slon[1]), c(slat[40], slon[40]))
#map$addAssets(
#  css = "http://www.liedman.net/leaflet-routing-machine/dist/leaflet-routing-machine.css",
#  jshead = "http://www.liedman.net/leaflet-routing-machine/dist/leaflet-routing-machine.min.js"
#)

#routingTemplate = "
#<script>
#var mywaypoints = %s
#L.Routing.control({
#waypoints: [
#L.latLng.apply(null, mywaypoints[0]),
#L.latLng.apply(null, mywaypoints[1])
#]
#}).addTo(map);
#</script>"

#icon_Template = "
#<script>
#var leafIcon = L.icon({
#iconUrl: 'C:/Users/Owner/Desktop/ADS/Project2/No.png',
#iconWidth = 20, iconHeight = 40,
#iconAnchorX = 22, iconAnchorY = 70
#});
#</script>"
#map$setTemplate(
#  afterScript = sprintf(routingTemplate, RJSONIO::toJSON(mywaypoints)))
