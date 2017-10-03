
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(geocodeApi)
require(leaflet)

shinyServer(function(input, output) {
  library(geocodeApi)
  randomVals <- eventReactive(input$goButton, {
    print("go")
  })
  
  
  
  output$mymap <- renderLeaflet({

      result <<- search_by_latlng(input$lat,input$lng)
      if(length(result) != 5)
      {
        return ()
      }
      Sys.sleep(2)

      m <- leaflet(options = leafletOptions(minZoom = -1, maxZoom = 18))
      m <- addTiles(m)
      m <- addMarkers(m,lng = result$lng, lat = result$lat , popup = result$address)
      m
  })
  
  output$view <- renderTable({
    result
    # DT::datatable(iris, options = list(lengthMenu = c(5, 30, 50), pageLength = 5))
  })
  
})
