# ui.R
library(shiny)
library(plotly)

shinyUI(fluidPage(
  titlePanel("Bachelor Degrees Over Time"),
  
  sidebarLayout(
    sidebarPanel(

    ),
    
    mainPanel(
      plotlyOutput("")
    )
  )                        
))
