# server.R
library(dplyr)
library(shiny)
library(plotly)

source('./scripts/byrace.R')
source('./scripts/byGender.R')
source('./scripts/byfields.R')


shinyServer(function(input, output) { 
  output$race <- renderPlotly({
    return(RacesChart(input$year, input$races))
  })
  
   output$gender <- renderPlotly({
     return(GenderChart(input$genders))
   })
     
   output$history <- renderPlotly({
     return(GenderChart(input$history))
   })
  # output$degrees 
  
})