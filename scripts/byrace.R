# library(dplyr)
# library(plotly)

all.years <- read.csv("data/Bach_Degrees_By_Race.csv", header = TRUE, stringsAsFactors = FALSE)
first.years <- read.csv("data/Bach_Degrees_By_Race_13_14.csv", header = TRUE, stringsAsFactors = FALSE)
second.years <- read.csv("data/Bach_Degrees_By_Race_14_15.csv", header = TRUE, stringsAsFactors = FALSE)

# Cleans up the column names
colnames(all.years) <- gsub("\\.", " ", colnames(all.years))
colnames(all.years) <- gsub("X", "", colnames(all.years))
colnames(first.years) <- gsub("\\.", " ", colnames(first.years))
colnames(first.years) <- gsub("X", "", colnames(first.years))
colnames(second.years) <- gsub("\\.", " ", colnames(second.years))
colnames(second.years) <- gsub("X", "", colnames(second.years))

RacesChart <- function(year, races) {
  
  majors <- first.years[2:37, 'Field of study']
  
  # if(races == "All") {
  #   col1 <- '2013 14 Total'
  #   col2 <- '2014 15 Total'
  # } else if(races == "W") {
  #   col1 <- '2013 14 White'
  #   col2 <- '2014 15 White'
  # } else if(races == "B") {
  #   col1 <- '2013 14 Black'
  #   col2 <- '2014 15 Black'
  # } else if(races == "H") {
  #   col1 <- '2013 14 Hispanic'
  #   col2 <- '2014 15 Hispanic'
  # } else if(races == "A") {
  #   col1 <- '2013 14 Asian' 
  #   col2 <- '2014 15 Asian'
  # } else if(races == "PI") {
  #   col1 <- '2013 14 Pacific Islander'
  #   col2 <- '2014 15 Pacific Islander'
  # } else if(races == "AIAN") {
  #   col1 <- '2013 14 American Indian Alaska Native'
  #   col2 <- '2014 15 American Indian Alaska Native'
  # } else if(races == "TMR") {
  #   col1 <- '2013 14 Two or More Races'
  #   col2 <- '2014 15 Two or More Races'
  # } else {
  #   col1 <- '2013 14 Non Resident Alien'
  #   col2 <- '2014 15 Non Resident Alien'
  # }
  
  col1 <- paste0('2013 14 ', races)
  col2 <- paste0('2014 15 ', races)
  
  if(year == "2013-15 (All)") {
    amounts1 <- first.years[2:37, col1]
    label1 <- '2013-14 Majors'
    amounts2 <- second.years[2:37, col2]
    label2 <- '2014-15 Majors'
  } else if(year == "2013-14") {
    amounts1 <- first.years[2:37, col1]
    label1 <- '2013-14 Majors'
  } else {
    amounts1 <- second.years[2:37, col2]
    label1 <- '2014-15 Majors'
  }

  
  p <- plot_ly(
    x = ~majors,
    y = ~amounts1,
    type = "bar",
    name = label1,
    width = 1500,
    height = 700) %>%
    layout(xaxis = list(title = 'Majors', tickangle = 45),
           yaxis = list(title = 'Amount'), 
           barmode = 'group',
           autosize = F,
           margin = list(b = 300, r = 200, t = 50))
  
  if(year == "2013-15 (All)") {
    p <- p %>%
      add_trace(y = ~amounts2, 
                name = label2)     
  }
  
  return(p)
}