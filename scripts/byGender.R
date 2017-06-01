# Read in data
library(dplyr)
males.data <- read.csv("data/Bach_Degrees_Males.csv", header = TRUE, stringsAsFactors = FALSE)
females.data <- read.csv("data/Bach_Degrees_Females.csv", header = TRUE, stringsAsFactors = FALSE)
colnames(males.data) <- gsub("\\.", " ", colnames(males.data))
colnames(males.data) <- gsub("X", "", colnames(males.data))
colnames(females.data) <- gsub("\\.", " ", colnames(females.data))
colnames(females.data) <- gsub("X", "", colnames(females.data))
x.values <- c()
females.2013.2014 <- c()
males.2013.2014 <- c()
females.2014.2015 <- c()
males.2014.2015 <- c()
GenderChart <- function(gender, majors) {
  if(is.element("Science", majors)) {
    x.values <- males.data[c(2, 5, 8, 9, 12, 13, 17, 21, 24, 28), "Field of study"]
    females.2013.2014 <- females.data[c(2, 5, 8, 9, 12, 13, 17, 21, 24, 28), "2013 14 Total"]
    males.2013.2014 <- males.data[c(2, 5, 8, 9, 12, 13, 17, 21, 24, 28), "2013 14 Total"]
    females.2014.2015 <- females.data[c(2, 5, 8, 9, 12, 13, 17, 21, 24, 28), "2014 15 Total"]
    males.2014.2015 <- males.data[c(2, 5, 8, 9, 12, 13, 17, 21, 24, 28), "2014 15 Total"]
  }
  if(is.element("Arts", majors)) {
    x.values <- c(x.values, males.data[c(3, 4, 6, 7, 14, 15, 16, 19, 27, 32, 33), "Field of study"])
    females.2013.2014 <- c(females.2013.2014, females.data[c(3, 4, 6, 7, 14, 15, 16, 19, 27, 32, 33), "2013 14 Total"])
    males.2013.2014 <- c(males.2013.2014, males.data[c(3, 4, 6, 7, 14, 15, 16, 19, 27, 32, 33), "2013 14 Total"])
    females.2014.2015 <- c(females.2014.2015, females.data[c(3, 4, 6, 7, 14, 15, 16, 19, 27, 32, 33), "2014 15 Total"])
    males.2014.2015 <- c(males.2014.2015, males.data[c(3, 4, 6, 7, 14, 15, 16, 19, 27, 32, 33), "2014 15 Total"])
  }
  if(is.element("Other", majors)) {
    x.values <- c(x.values, males.data[c(10, 11, 18, 20, 22, 23, 25, 26, 29, 30, 34, 35, 36, 37), "Field of study"])
    females.2013.2014 <- c(females.2013.2014, females.data[c(10, 11, 18, 20, 22, 23, 25, 26, 29, 30, 34, 35, 36, 37), "2013 14 Total"])
    males.2013.2014 <- c(males.2013.2014, males.data[c(10, 11, 18, 20, 22, 23, 25, 26, 29, 30, 34, 35, 36, 37), "2013 14 Total"])
    females.2014.2015 <- c(females.2014.2015, females.data[c(10, 11, 18, 20, 22, 23, 25, 26, 29, 30, 34, 35, 36, 37), "2014 15 Total"])
    males.2014.2015 <- c(males.2014.2015, males.data[c(10, 11, 18, 20, 22, 23, 25, 26, 29, 30, 34, 35, 36, 37), "2014 15 Total"])
  }

  p <- plot_ly(
     x = ~x.values,
     type = "bar",
     width = 1500,
     height = 700,
     visible = FALSE
  )
  
  if(is.element("F1", gender)) { # https://stackoverflow.com/questions/22842232/dplyr-select-column-names-containing-white-space
    p <- p %>% add_trace(y = ~females.2013.2014, name = 'F: 2013-2014', visible = TRUE)
  }
  if(is.element("M1", gender)) {
    p <- p %>% add_trace(y = ~males.2013.2014, name = 'M: 2013-2014', visible = TRUE)
  } 
  if(is.element("F2", gender)){
    p <- p %>% add_trace(y = ~females.2014.2015, name = 'F: 2014-2015', visible = TRUE)
  }
  if(is.element("M2", gender)) {
    p <- p %>% add_trace(y = ~males.2014.2015, name = 'M: 2014-2015', visible = TRUE)
  }
      
  p <- p %>% layout(xaxis = list(title = 'Majors', tickangle = 45),
                    yaxis = list(title = 'Amount'), 
                    barmode = 'group',
                    autosize = F,
                    margin = list(b = 300, r = 200, t = 50))
  
  return(p)
}