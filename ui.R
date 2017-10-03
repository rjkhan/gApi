library(shiny)
library(leaflet)

shinyUI(fluidPage(
  
  titlePanel("GeoCoding Api"),
  
  sidebarLayout(
    
    sidebarPanel(
      numericInput("lat", "latitude", value=58.410, min = -180, max = 180, step = 0.001),
      numericInput("lng", "longitude", value=15.621, min = -180, max = 180, step = 0.001),
      actionButton("goButton", "Go!")
    ),
    
    mainPanel(
      leafletOutput("mymap"),
       tableOutput("view")
    )
  )
))