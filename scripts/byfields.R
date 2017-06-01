library(dplyr)
library(plotly)

df <- read.csv("data/Bach_Degrees.csv", header = TRUE, stringsAsFactors = FALSE)

BuildGraph.fields <- function() {
  
  majors <- df[2:37, 'Field.of.study']
  
  if(input$shelf == "1970") {
    data <- df[2:37, 'X1970.71']
  }else if(input$shelf == "1975") {
    data <- df[2:37, 'X1975.76']
  }else if(input$shelf == "1980") {
    data <- df[2:37, 'X1980.81']
  }else if(input$shelf == "1985") {
    data <- df[2:37, 'X1985.86']
  }else if(input$shelf == "1990") {
    data <- df[2:37, 'X1990.91']
  }else if(input$shelf == "1995") {
    data <- df[2:37, 'X1995.96']
  }else if(input$shelf == "2000") {
    data <- df[2:37, 'X2000.01']
  }else if(input$shelf == "2004") {
    data <- df[2:37, 'X2004.05']
  }else if(input$shelf == "2005") {
    data <- df[2:37, 'X2005.06']
  }else if(input$shelf == "2006") {
    data <- df[2:37, 'X2006.07']
  }else if(input$shelf == "2007") {
    data <- df[2:37, 'X2007.08']
  }else if(input$shelf == "2008") {
    data <- df[2:37, 'X2008.09']
  }else if(input$shelf == "2009") {
    data <- df[2:37, 'X2009.10']
  }else if(input$shelf == "2010") {
    data <- df[2:37, 'X2010.11']
  }else if(input$shelf == "2011") {
    data <- df[2:37, 'X2011.12']
  }else if(input$shelf == "2012") {
    data <- df[2:37, 'X2012.13']
  }else if(input$shelf == "2013") {
    data <- df[2:37, 'X2013.14']
  }else {
    data <- df[2:37, 'X2014.15']
  }
  
  p <- plot_ly(
    x = ~majors,
    y = ~data,
    type = "bar",
    name = 'Popularity of Majors') %>%
    layout(xaxis = list(title = 'Majors', tickangle = 45),
           yaxis = list(title = 'Amount'), 
           barmode = 'group',
           autosize = F,
           width = 1500,
           height = 700,
           margin = list(b = 300, r = 200, t = 50))
  
  return(p)
}
