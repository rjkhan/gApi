library(shiny)


shinyUI(fluidPage(
  
  titlePanel("Hello Shiny!"),
  
  sidebarLayout(
    
    sidebarPanel(
      textInput(inputId = "caption",
                label = "Search:",
                value = "",
                placeholder = "Enter a name of place kfc etc"),
      actionButton("goButton", "Go!")
    ),
    
    mainPanel(
      h3(textOutput("caption", container = span)),
      plotOutput("plot")
      # tableOutput("view")
    )
  )
))