library(shiny)

# if (!require("DT")) install.packages('leaflet')
library(leaflet)
# leaflet is a JavaScript library for interactive maps

# if (!require("DT")) install.packages('DT')
library(DT)
# DT create javascript table


# I made some modification to the former r script based on what our app will look like.
# you can read the script along with the Shiny App of group 6 to understand functions. 


# options should be defined before shinyUI
# we have 16 time ranges, from 6am to 10pm. break = 1 hour.
TimeRange <- c(
  "6:00-7:00"=1,
  "7:00-8:00"=2, "8:00-9:00"=3, "9:00-10:00"=4, 
  "10:00-11:00"=5 , "11:00-12:00"=6, "12:00-13:00"=7 ,
  "13:00-14:00"=8 , "14:00-15:00"=9, "15:00-16:00"=10 ,
  "16:00-17:00"=11 , "17:00-18:00"=12 , "18:00-19:00"=13 ,
  "19:00-20:00"=14 , "20:00-21:00"=15, "21:00-22:00"=16,
  "22:00-23:00"=17
)




# shinyUI

# 1.navbarPage(): creat a page to show all tab panels.
# 2.id: If provided, you can use input$id in your server logic to determine which of the current tabs is active. 
# The value will correspond to the value argument that is passed to tabPanel.
# 3.tabpanel(): Create a tab panel


shinyUI(navbarPage("Citi Bike", id="nav",
                   ##### first map
                   #"Toilet Map" is the name of the first map.
                   tabPanel("Citi Bike Map",
                            # div() :HTML Builder Functions,return objects that can be rendered as HTML
                            div(class="outer",
                                
                                tags$head(
                                  # Include our custom CSS
                                  includeCSS("styles.css"),
                                  includeScript("gomap.js")
                                ),
                                
                                leafletOutput("map", width="100%", height="100%"),
                                
                                # Shiny versions prior to 0.11 should use class="modal" instead.
                                absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                                              draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
                                              width = 330, height = "auto",
                                              # h3() is the title for the first map.
                                              h3("Citi Bike Route"),
                                              
                                              
                                              ### 1. first option: time range
                                              # after choosing time range
                                              # the map should show the avaibility for all bike stations in this period of time
                                              selectInput("TimeRange", "Time Range of the day", TimeRange,selected =1),                                            
                                            
                                              ### 2. second option: Current location
                                              textInput("address1", "Your Location", value = NA, width = NULL, placeholder = NULL),
                                
                                              
                                              ### 3. third option: Location for the destination
                                              textInput("address2", "Destination", value = NA, width = NULL, placeholder = NULL),
                                              actionButton("submit","Submit",icon = icon("refresh")),
                                              # submit is used later in server.r in the renderPlot() function. input$submit .
                                              
                                              # addMarkers(~long, ~lat, popup = ~as.character(mag)) or use icon =... ? to be tested
                                              
                                              # additional option: let the user to decide to show estimated time.
                                              # the time can be shown in text part, which is a little different from group6.
                                              helpText("Check to show no stop or one stop"),
                                              #actionButton("submit","Show estimated time"),
                                              checkboxInput("NoStop","NoStop"),
                                              checkboxInput("OneStop", "OneStop")
                                              
                                ),
                                # end of the first absolutePanel.
                                
                                ## used for the additional option:"add estimated time". need to be completed.
                                # absolutePanel(): Creates a panel whose contents are absolutely positioned.
                                
                                absolutePanel(id="graphstuff",class = "panel panel-default", fixed=TRUE,
                                              draggable = TRUE, top=60,left=10,right="auto", bottom="auto",width=1,
                                              height=1, style="opacity:0",
                                              div(style="padding: 8px; border-bottom: 1px solid #CCC; background: #FFFFEE;"),
                                              #h2("Crime around this Restroom"),
                                              h6(textOutput("totalcrime")),
                                              plotOutput("circ_plot",height=200)
                                )
                            ) # end of dev()
                            
                   ),
                   ##### end of the first map
                   
                   
                   ##### add second map  (if had time)  #####  
                   tabPanel("Heatmap",
                            sidebarLayout(position="right",                            
                                          sidebarPanel(
                                            conditionalPanel(condition="input.ccpanel==1",
                                                             helpText("We display the heap map of citi bike stations")
                                            )
                                            
                                          ),
                                          mainPanel(
                                            tabsetPanel(type="pill",id="ccpanel",
                                                        
                                                        tabPanel("Basic Information",br(),tags$div(class="descrip_text",
                                                                                                   textOutput("heat_text")), br(),
                                                                 chartOutput("baseMap", "leaflet"),
                                                                 #leafletOutput("baseMap"),
                                                                 tags$style('.leaflet {width: 930px;height:580px}'),
                                                                 tags$head(tags$script(src="https://leaflet.github.io/Leaflet.heat/dist/leaflet-heat.js")),
                                                                 uiOutput('heatMap'),value=1)
                                            ))
                            )),
                   
                   ##### third part: description of the project.
                   
                   # keep it. insert markdown script.
                   tabPanel("About Our Project", includeMarkdown("AboutThisProject.md")),
                   conditionalPanel("false", icon("crosshair"))
))


############# variables need to be defined or calculated
# styles.css
# gomap.js  
# these two can be found in the app.file. need to be modified ? No idea.

# map
# TimeRange: defined before start UI
# address1
# address2

# AboutThisProject.md : Markdown file to intro our project. easiest part, which has been down.




