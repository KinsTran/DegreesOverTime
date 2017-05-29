# library(dplyr)
# library(plotly)
# 
# setwd('C:/Users/Wendy/Google Drive/UW/2016-17/INFO201/DegreesOverTime')

df <- read.csv("data/Bach_Degrees_By_Race.csv", header = TRUE, stringsAsFactors = FALSE)

BuildGraph <- function() {
  
  majors <- df[2:37, 'Field.of.study']
  amounts1 <- df[2:37, 'X2013.14.Total']
  amounts2 <- df[2:37, 'X2014.15.Total']
    
  p <- plot_ly(
    x = ~majors,
    y = ~amounts1,
    type = "bar",
    name = '2013-14 Majors') %>%
    add_trace(y = ~amounts2, 
              name = '2014-15 Majors') %>%
    layout(xaxis = list(title = 'Majors', tickangle = 45),
           yaxis = list(title = 'Amount'), 
           barmode = 'group',
           autosize = F,
           width = 1500,
           height = 700,
           margin = list(b = 300, r = 200, t = 50))
    
  return(p)
}