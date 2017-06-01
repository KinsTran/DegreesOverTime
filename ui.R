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
                 selectInput(inputId = "races",
                             label = "Select Race to Filter Down to",
                             choices = c("All" = "Total", "White", "Black", "Hispanic", "Asian", "Pacific Islander", 
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
            p("This panel illustrates the differences in degree choices by men and women from 2013 to 2015. Majors were sorted into categories depending upon UW's closest equivalent (", a("Link", href = "https://www.washington.edu/students/gencat/degree_programsTOC.html"), "), or another source if not applicable. Many STEM related majors, such as Computer Science and Engineering, are dominated by males, although the Health sector is predominantly occupied by women, to a far greater extent than many of the other Science majors combined. In the Arts, females have a much larger population than males, save for a few majors such as Business and History, as well as in other majors such as Education and Psychology."),
            sidebarLayout(
              sidebarPanel(
                 width = 2,
                 checkboxGroupInput("genders", label = "Gender and School Year to Display",
                   choices = list("Females 2013-2014" = "F1", "Males 2013-2014" = "M1", "Females 2014-2015" = "F2", "Males 2014-2015" = "M2"),
                   selected = list("F1", "M1", "F2", "M2")),
                 checkboxGroupInput("majors", label = "Types of Majors to Display", 
                    choices = list("Science" = "Science", "Arts" = "Arts", "Other" = "Other"),
                    selected = list("Science"))
              ),
              mainPanel(
                plotlyOutput("gender")
              )
            )
   ),
   tabPanel("History",
            titlePanel("Bachelor Degrees Popularity in Each Year"),
            sidebarLayout(
              sidebarPanel(width = 2,
                           selectInput(inputId = "history",
                                       label = "Select Year",
                                       choices = c("1970","1975","1980","1985","1990","1995","2000","2004","2005","2006"
                                                   ,"2007","2008","2009","2010","2011","2012","2013","2014"))
              ),
              mainPanel( # Plan: Add option to toggle majors by groups: Ex: STEM, Social sciences, Humanities, etc.
                plotlyOutput("history")
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
