# ui.R
library(shiny)
library(plotly)
library(shinythemes)

shinyUI(
  navbarPage(
    theme = shinytheme("yeti"),
    "Bachelor Degrees Over Time",
    tabPanel("Intro",
             titlePanel("Postsecondary Education in the United States"),
               # Intro - Probably take it from the Project Proposal we wrote
               # Include citations (?) for where we got our data set
             mainPanel(
               h3("As current college students..."),
               p("We often wonder about the diversity of those pursuing postsecondary education - primarily the ones 
                 aiming for their bachelor's degree. Thus we obtained a couple ", a("data sets", href = "https://nces.ed.gov/fastfacts/display.asp?id=37"),
                 " from the National Center for Education Statistics, or NCES for short. The NCES is a federal entity that is responsible for the collection 
                 and analysis of  data that relates to education, and is underneath the Department of Education and the Institute of Education Sciences, 
                 or the IES. The IES is responsible for providing scientific evidence to direct public policy on education, including doing work such as 
                 providing data like our dataset, conducting surveys, and funding new education techniques."),
               p("With a focus for prospective and current college students, we'll be using the data sets we obtained to look at trends for popular majors, 
                 potentially through a span of time. This will also include an analysis based on races, gender, and the degrees themselves.There are so many 
                 students who come into college not knowing what they want to do, so providing them with a list and how many people have pursued them in the 
                 past can really help them out. It also assists students by showing them just how competitive their field of choice is, giving them a good 
                 idea of how hard they will have to work to get into the major they choose."),
               p("To address these concerns, each page strives to tackle each issue raised."),
               h6("Wendy Liang, Kinsley Tran, Fatih Ridha, Calvin Chan", align = "right"),
               h6("INFO 201 AB", align = "right")
             )
             ),
    tabPanel("Race",
             titlePanel("Bachelor Degrees by Race"),
             p("This visualization not only allows for a selection of what school year(s) to display, but also the race that the user wants to have the 
               graph filter down to. Although there is not a significant difference between the two school years, there is definitely a difference 
               between the amount of postsecondary students for each race. When it comes to majority vs minority, it is apparent that the majority of 
               students are White with Pacific Islanders as the minority in the US. Regardless, Business seems to be a popular major across all races, 
               with Health majors following behind"),
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
            p("This panel illustrates the differences in degree choices by men and women from 2013 to 2015. Majors were sorted into categories depending 
              upon UW's closest equivalent (", a("Link", href = "https://www.washington.edu/students/gencat/degree_programsTOC.html"), "), or another source 
              if not applicable. Many STEM related majors, such as Computer Science and Engineering, are dominated by males, although the Health sector is 
              predominantly occupied by women, to a far greater extent than many of the other Science majors combined. In the Arts, females have a much 
              larger population than males, save for a few majors such as Business and History, as well as in other majors such as Education and Psychology."),
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
            p("This Chart displays the popularity of every industry field in each year, from 1970 to 2014. Our goal was to show how the demands for each field alters year by year. Just select a year on the drop down menu to observe the popularity of different industry in that particular year!"),
            sidebarLayout(
              sidebarPanel(width = 2,
                           selectInput(inputId = "historys",
                                       label = "Select Year",
                                       choices = c("1970-71","1975-76","1980-81","1985-86","1990-91","1995-96","2000-01","2004-05","2005-06","2006-07"
                                                   ,"2007-08","2008-09","2009-10","2010-11","2011-12","2012-13","2013-14","2014-15"))
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
