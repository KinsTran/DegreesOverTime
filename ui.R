# ui.R
library(shiny)
library(plotly)
library(shinythemes)

shinyUI(
  navbarPage(
    theme = shinytheme("yeti"),
    "Bachelor Degrees Over Time",
    tabPanel("Intro",
             titlePanel("Introduction")
               # Intro - Probably take it from the Project Proposal we wrote
               # Include citations (?) for where we got our data set
             ),
    tabPanel("Race",
             titlePanel("Bachelor Degrees by Race"),
             sidebarLayout(
               sidebarPanel(
                 width = 2,
                 radioButtons(inputId = "year",
                              label = "Select the School Year",
                              choices = c("2013-15 (All)", "2013-14", "2014-15")),
                 # selectInput(inputId = "races",
                 #             label = "Select Race to Filter Down to",
                 #             choices = c("All", "White" = "W", "Black" = "B", "Hispanic" = "H", "Asian" = "A", "Pacific Islander" = "PI", 
                 #                         "American Indian/Alaska Native" = "AIAN", "Two or More Races" = "TMR", "Non Resident Alien" = "NRA"))
                 selectInput(inputId = "races",
                             label = "Select Race to Filter Down to",
                             choices = c("All" = "Total", "White", "Black", "Hispanic", "Asian", "Pacific Islander" = "PI", 
                                         "American Indian/Alaska Native" = "American Indian Alaska Native", "Two or More Races", "Non Resident Alien"))
               ), 
               mainPanel(
                  plotlyOutput("race")
                )
             )
             
   )
   ,
   tabPanel("Gender",
            titlePanel("Bachelor Degrees by Gender"),
            sidebarLayout(
              sidebarPanel(width = 2,
                           checkboxGroupInput("genders", label = "Gender and School Year to Display",
                           choices = list("Females 2013-2014" = "F1", "Males 2013-2014" = "M1", "Females 2014-2015" = "F2", "Males 2014-2015" = "M2"),
                           selected = list("F1", "M1", "F2", "M2"))
              ),
              mainPanel( # Plan: Add option to toggle majors by groups: Ex: STEM, Social sciences, Humanities, etc.
                plotlyOutput("gender")
              )
            )
   )
  #,
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
