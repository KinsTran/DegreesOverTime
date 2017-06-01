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
  
  col1 <- paste0('2013 14 ', races)
  col2 <- paste0('2014 15 ', races)
  
  if(year == "2013-15 (All)" || year == "2013-14") {
    amounts1 <- first.years[2:37, col1]
    label1 <- '2013-14 Majors'
    amounts2 <- second.years[2:37, col2]
    label2 <- '2014-15 Majors'
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