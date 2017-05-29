# ui.R
library(shiny)
library(plotly)
library(shinythemes)

shinyUI(
  navbarPage(
    theme = shinytheme("yeti"),
    "Bachelor Degrees Over Time",
    tabPanel("Race",
             titlePanel("Bachelor Degrees by Race"),
             # sidebarLayout(
             #   sidebarPanel(
             #     
             #   )
             # ),
             
      mainPanel(
        plotlyOutput("race")
      )
  )
  # ,
  # tabPanel("Gender",
  #          titlePanel("Bachelor Degrees by Gender"),
  #          sidebarLayout(
  #            sidebarPanel(
  #              
  #            )
  #          ),
  #          
  #          mainPanel(
  #            plotlyOutput("gender")
  #          )
  # ),
  # tabPanel("Degrees",
  #          titlePanel("Higher Degrees"),
  #          sidebarLayout(
  #            sidebarPanel(
  #              
  #            )
  #          ),
  #          
  #          mainPanel(
  #            plotlyOutput("degrees")
  #          )
  # )
))
