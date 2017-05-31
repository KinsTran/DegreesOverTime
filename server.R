# server.R
library(dplyr)
library(shiny)
library(plotly)
library(ggplot2)

source('./scripts/byrace.R')
source('./scripts/byGender.R')

shinyServer(function(input, output) { 
  output$race <- renderPlotly({
    return(BuildGraph(input$year))
  })
  
  # output$gender <- renderPlot({
  #   return(GenderChart(input$genders))
  # })
     
  # output$degrees 
  
})