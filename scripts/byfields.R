library(dplyr)
library(plotly)

df <- read.csv("data/Bach_Degrees.csv", header = TRUE, stringsAsFactors = FALSE)
colnames(df) <- gsub("\\.", " ", colnames(df))
colnames(df) <- gsub("X", "", colnames(df))

FieldsChart <- function(history) {
  
  majors <- df[2:34, 'Field of study']

  if(history == "1970") {
    col <- df[2:34, '1970 71']
  }else if(history == "1975") {
    col <- df[2:34, '1975 76']
  }else if(history == "1980") {
    col <- df[2:34, '1980 81']
  }else if(history == "1985") {
    col <- df[2:34, '1985 86']
  }else if(history == "1990") {
    col <- df[2:34, '1990 91']
  }else if(history == "1995") {
    col <- df[2:34, '1995 96']
  }else if(history == "2000") {
    col <- df[2:34, '2000 01']
  }else if(history == "2004") {
    col <- df[2:34, '2004 05']
  }else if(history == "2005") {
    col <- df[2:34, '2005 06']
  }else if(history == "2006") {
    col <- df[2:34, '2006 07']
  }else if(history == "2007") {
    col <- df[2:34, '2007 08']
  }else if(history == "2008") {
    col <- df[2:34, '2008 09']
  }else if(history == "2009") {
    col <- df[2:34, '2009 10']
  }else if(history == "2010") {
    col <- df[2:34, '2010 11']
  }else if(history == "2011") {
    col <- df[2:34, '2011 12']
  }else if(history == "2012") {
    col <- df[2:34, '2012 13']
  }else if(history == "2013") {
    col <- df[2:34, '2013 14']
  }else {
    col <- df[2:34, '2014 15']
  }
  
  new.title <- paste0("Popularity of Majors in ",history)
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
