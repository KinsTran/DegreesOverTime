# server.R
library(dplyr)
library(shiny)
library(plotly)

<<<<<<< HEAD
#setwd('C:/Users/Wendy/Google Drive/UW/2016-17/INFO201/DegreesOverTime')
=======
>>>>>>> f9f3e67f20eab1a71470ceb0f74199402cd108c9
source('./scripts/byrace.R')

shinyServer(function(input, output) { 
  output$race <- renderPlotly({
    return(BuildGraph(input$year))
  })
  
  #output$gender <- renderPlot({
  #  return(genderPlot())
  #})
  #   
  # output$degrees 
  
})