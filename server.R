# server.R
library(dplyr)
library(shiny)
library(plotly)

source('./scripts/byrace.R')

shinyServer(function(input, output) { 
  output$race <- renderPlotly({
    return(BuildGraph())
  })
  #output$gender <- renderPlot({
  #  return(genderPlot())
  #})
  #   
  # output$degrees 
  
})