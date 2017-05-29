# server.R
library(dplyr)
library(shiny)
library(plotly)

setwd('C:/Users/Wendy/Google Drive/UW/2016-17/INFO201/DegreesOverTime')
source('./scripts/byrace.R')

shinyServer(function(input, output) { 
  output$race <- renderPlotly({
    return(BuildGraph())
  })
  # output$gender
  #   
  # output$degrees 
  
})