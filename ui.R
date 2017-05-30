# ui.R
library(shiny)
library(plotly)
library(shinythemes)

df <- read.csv("data/Bach_Degrees_By_Race.csv", header = TRUE, stringsAsFactors = FALSE)

shinyUI(
  navbarPage(
    theme = shinytheme("yeti"),
    "Bachelor Degrees Over Time",
    tabPanel("Race",
             titlePanel("Bachelor Degrees by Race"),
             sidebarLayout(
               sidebarPanel(
                 width = 2,
                 radioButtons(inputId = "year",
                              label = "Select the School Year",
                              choices = c("2013-14", "2014-15"))
                 # selectInput(inputId = "races",
                 #             label = "Select Race to Filter Down to",
                 #             choices = df[1, 2:19])
               ), 
               mainPanel(
                  plotlyOutput("race")
                )
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
  #            plotOutput("gender")
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
