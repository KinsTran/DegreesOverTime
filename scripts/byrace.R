# library(dplyr)
# library(plotly)

all.years <- read.csv("data/Bach_Degrees_By_Race.csv", header = TRUE, stringsAsFactors = FALSE)
first.years <- read.csv("data/Bach_Degrees_By_Race_13_14.csv", header = TRUE, stringsAsFactors = FALSE)
second.years <- read.csv("data/Bach_Degrees_By_Race_14_15.csv", header = TRUE, stringsAsFactors = FALSE)
colnames(all.years) <- gsub("\\.", " ", colnames(all.years))
colnames(all.years) <- gsub("X", "", colnames(all.years))
colnames(first.years) <- gsub("\\.", " ", colnames(first.years))
colnames(first.years) <- gsub("X", "", colnames(first.years))
colnames(second.years) <- gsub("\\.", " ", colnames(second.years))
colnames(second.years) <- gsub("X", "", colnames(second.years))

BuildGraph <- function(year) {
  
  majors <- first.years[2:37, 'Field of study']
  
  if(year == "2013-15") {
    amounts1 <- first.years[2:37, '2013 14 Total']
    label1 <- '2013-14 Majors'
    amounts2 <- second.years[2:37, '2014 15 Total']
    label2 <- '2014-15 Majors'
  } else if(year == "2013-14") {
    amounts1 <- first.years[2:37, '2013 14 Total']
    label1 <- '2013-14 Majors'
  } else {
    amounts1 <- second.years[2:37, '2014 15 Total']
    label1 <- '2014-15 Majors'
  }

  
  p <- plot_ly(
    x = ~majors,
    y = ~amounts1,
    type = "bar",
    name = label1) %>%
    layout(xaxis = list(title = 'Majors', tickangle = 45),
           yaxis = list(title = 'Amount'), 
           barmode = 'group',
           autosize = F,
           width = 1500,
           height = 700,
           margin = list(b = 300, r = 200, t = 50))
  
  if(year == "2013-15") {
    p <- p %>%
      add_trace(y = ~amounts2, 
                name = label2)     
  }
  
  return(p)
}