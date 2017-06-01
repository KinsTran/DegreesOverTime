# server.R
library(dplyr)
library(shiny)
library(plotly)

source('./scripts/byrace.R')
source('./scripts/byGender.R')
source('./scripts/byfields.R')
source('./scripts/graduate.R')


shinyServer(function(input, output) { 
  output$race <- renderPlotly({
    return(RacesChart(input$year, input$races))
  })
  
   output$gender <- renderPlotly({
     return(GenderChart(input$genders, input$majors))
   })
     
   output$history <- renderPlotly({
     return(FieldsChart(input$historys))
   })
   
   output$graduate <- renderPlotly({
     return(GradChart(input$level, input$field))
   })
   
  # output$degrees 
  
})