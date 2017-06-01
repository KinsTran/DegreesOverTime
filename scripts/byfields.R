library(dplyr)
library(plotly)

df <- read.csv("data/Bach_Degrees.csv", header = TRUE, stringsAsFactors = FALSE)
colnames(df) <- gsub("\\.", "-", colnames(df))
colnames(df) <- gsub("X", "", colnames(df))

FieldsChart <- function(history) {
  
  majors <- df[2:34, 'Field-of-study']
  col <- df[2:34, history]
  
  new.title <- paste0("Popularity of Majors in ", history)
  p <- plot_ly(
    x = ~majors,
    y = ~col,
    type = "bar",
    name = 'Popularity of Majors',
    width = 1500,
    height = 700) %>%
    layout(title = new.title, xaxis = list(title = 'Majors', tickangle = 45),
           yaxis = list(title = 'Amount'), 
           barmode = 'group',
           autosize = F,
           margin = list(b = 300, r = 200, t = 50))
  
  return(p)
}
