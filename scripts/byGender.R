# Read in data
library(dplyr)
males.data <- read.csv("data/Bach_Degrees_Males.csv", header = TRUE, stringsAsFactors = FALSE)
females.data <- read.csv("data/Bach_Degrees_Females.csv", header = TRUE, stringsAsFactors = FALSE)
colnames(males.data) <- gsub("\\.", " ", colnames(males.data))
colnames(males.data) <- gsub("X", "", colnames(males.data))
colnames(females.data) <- gsub("\\.", " ", colnames(females.data))
colnames(females.data) <- gsub("X", "", colnames(females.data))

GenderChart <- function(gender, majors) {
  x.values <- males.data[2:37, 'Field of study']
  
  p <- plot_ly(
     x = ~x.values,
     type = "bar",
     width = 1500,
     height = 700,
     visible = FALSE
  )
  
  if(is.element("F1", gender)) { # https://stackoverflow.com/questions/22842232/dplyr-select-column-names-containing-white-space
    females.2013.2014 <- females.data[2:37, "2013 14 Total"]
    p <- p %>% add_trace(y = ~females.2013.2014, name = 'F: 2013-2014', visible = TRUE)
  }
  if(is.element("M1", gender)) {
    males.2013.2014 <- males.data[2:37, "2013 14 Total"]
    p <- p %>% add_trace(y = ~males.2013.2014, name = 'M: 2013-2014', visible = TRUE)
  } 
  if(is.element("F2", gender)){
    females.2014.2015 <- females.data[2:37, "2014 15 Total"]
    p <- p %>% add_trace(y = ~females.2014.2015, name = 'F: 2014-2015', visible = TRUE)
  }
  if(is.element("M2", gender)) {
    males.2014.2015 <- males.data[2:37, "2014 15 Total"]
    p <- p %>% add_trace(y = ~males.2014.2015, name = 'M: 2014-2015', visible = TRUE)
  }
      
  p <- p %>% layout(xaxis = list(title = 'Majors', tickangle = 45),
                    yaxis = list(title = 'Amount'), 
                    barmode = 'group',
                    autosize = F,
                    margin = list(b = 300, r = 200, t = 50))
  
  return(p)
}