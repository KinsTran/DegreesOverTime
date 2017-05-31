library(dplyr)
library(plotly)
# 
# setwd('C:/Users/Wendy/Google Drive/UW/2016-17/INFO201/DegreesOverTime')

df <- read.csv("data/Bach_Degrees.csv", header = TRUE, stringsAsFactors = FALSE)

BuildGraph.field <- function() {
  
  majors <- df[2:37, 'Field.of.study']
  year70 <- df[2:37, 'X1970.71']
  year75 <- df[2:37, 'X1975.76']
  year80 <- df[2:37, 'X1980.81']
  year85 <- df[2:37, 'X1985.86']
  year90 <- df[2:37, 'X1990.91']
  year95 <- df[2:37, 'X1995.96']
  year00 <- df[2:37, 'X2000.01']
  year04 <- df[2:37, 'X2004.05']
  year05 <- df[2:37, 'X2005.06']
  year06 <- df[2:37, 'X2006.07']
  year07 <- df[2:37, 'X2007.08']
  year08 <- df[2:37, 'X2008.09']
  year09 <- df[2:37, 'X2009.10']
  year10 <- df[2:37, 'X2010.11']
  year11 <- df[2:37, 'X2011.12']
  year12 <- df[2:37, 'X2012.13']
  year13 <- df[2:37, 'X2013.14']
  year14 <- df[2:37, 'X2014.15']
  
  p <- plot_ly(
    x = ~majors,
    y = ~year70,
    type = "bar",
    name = '1970-71 Majors') %>%
    add_trace(y = ~year75, 
              name = '1975-76 Majors')%>%
    add_trace(y = ~year80, 
              name = '1980-81 Majors')%>%
    add_trace(y = ~year85, 
              name = '1985-86 Majors')%>%
    add_trace(y = ~year90, 
              name = '1990-91 Majors')%>%
    add_trace(y = ~year95, 
              name = '1995-96 Majors')%>%
    add_trace(y = ~year00, 
              name = '2000-01 Majors')%>%
    add_trace(y = ~year04, 
              name = '2004-05 Majors')%>%
    add_trace(y = ~year05, 
              name = '2005-06 Majors')%>%
    add_trace(y = ~year06, 
              name = '2006-07 Majors')%>%
    add_trace(y = ~year07, 
              name = '2007-08 Majors')%>%
    add_trace(y = ~year08, 
              name = '2008-09 Majors')%>%
    add_trace(y = ~year09, 
              name = '2009-10 Majors')%>%
    add_trace(y = ~year10, 
              name = '2010-11 Majors')%>%
    add_trace(y = ~year11, 
              name = '2011-12 Majors')%>%
    add_trace(y = ~year12, 
              name = '2012-13 Majors')%>%
    add_trace(y = ~year13, 
              name = '2013-14 Majors')%>%
    add_trace(y = ~year14, 
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