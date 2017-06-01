# server.R
library(dplyr)
library(shiny)
library(plotly)

source('./scripts/byrace.R')
source('./scripts/byGender.R')

shinyServer(function(input, output) { 
  output$race <- renderPlotly({
    return(BuildGraph(input$year, input$races))
  })
  
   output$gender <- renderPlotly({
     return(GenderChart(input$genders))
   })
     
  # output$degrees 
  
})