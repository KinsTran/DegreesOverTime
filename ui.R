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
             sidebarLayout(
               sidebarPanel(
                 width = 2,
                 radioButtons(inputId = "year",
                              label = "Select the School Year",
                              choices = c("2013-15 (All)", "2013-14", "2014-15")),
                 selectInput(inputId = "races",
                             label = "Select Race to Filter Down to",
                             choices = c("All", "White" = "W", "Black" = "B", "Hispanic" = "H", "Asian" = "A", "Pacific Islander" = "PI", 
                                         "American Indian/Alaska Native" = "AIAN", "Two or More Races" = "TMR", "Non Resident Alien" = "NRA"))
               ), 
               mainPanel(
                  plotlyOutput("race")
                )
             )
             
   )#,
  #  tabPanel("Gender",
  #           titlePanel("Bachelor Degrees by Gender"),
  #           sidebarLayout(
  #             sidebarPanel(
  #               checkboxGroupInput("checkGroup", label = "Gender and School Year to Display", 
  #                                  choices = list("Females 2013-2014" = "F1", "Males 2013-2014" = "M1", "Females 2014-2015" = "F2", "Males 2014-2015" = "M2"),
  #                                  selected = "F1", "M1", "F2", "M2")
  #             )
  #           ),
  #           mainPanel( # Plan: Add option to toggle majors by groups: Ex: STEM, Social sciences, Humanities, etc.
  #             plotOutput("gender")
  #           )
  #  ),
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
