
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(geocodeApi)
library(plotly)
shinyServer(function(input, output) {
  library(geocodeApi)
  randomVals <- eventReactive(input$goButton, {
    print(length(input$caption))
    if(input$caption == "")
      id <<- showNotification(paste("Enter something to Search"), duration = 3, closeButton = TRUE, type = "error")
    else
    {
      if(!is.null(id)) removeNotification(id)
      input$caption
    }
  })
  
  # # Show the first "n" observations ----
  # output$view <- renderTable({
  #   library(geocodeApi)
  #   library(plotly)
  #   result <- search_place("kfc")
  #   Animals <- result$country
  #   rate <- result$rating
  #   country <- result$country
  #   data <- data.frame(Animals, rate, country)
  #   
  #   plot_ly(data, x = ~country, y = ~result$rating, type = 'bar', name = 'rate' ) %>%
  #     
  #     layout(yaxis = list(title = 'rating' , dtick = 0.5), barmode = 'stack')
  # })
  
  output$plot <- renderPlot({
    # print(randomVals())
      library(geocodeApi)
      library(plotly)
      result <- search_place(randomVals())
      Animals <- result$country
      rate <- result$rating
      country <- result$country
      data <- data.frame(Animals, rate, country)

      plot_ly(data, x = ~country, y = ~result$rating, type = 'bar', name = 'rate' ) %>%
      layout(yaxis = list(title = 'rating' , dtick = 0.5), barmode = 'stack')
    # hist(randomVals())
  })
  
})
