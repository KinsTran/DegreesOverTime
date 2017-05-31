# Read in data
males.data <- read.csv("./data/Bach_Degrees_Males.csv", header = TRUE, stringsAsFactors = FALSE)
females.data <- read.csv("./data/Bach_Degrees_Females.csv", header = TRUE, stringsAsFactors = FALSE)
colnames(males.data) <- gsub("\\.", " ", colnames(males.data))
colnames(males.data) <- gsub("X", "", colnames(males.data))
colnames(females.data) <- gsub("\\.", " ", colnames(females.data))
colnames(females.data) <- gsub("X", "", colnames(females.data))
plot.data <- c()

GenderChart <- function(gender) { # https://stackoverflow.com/questions/1169248/r-function-for-testing-if-a-vector-contains-a-given-element
  if(is.element("F1", input$genders)) {
    plot.data <- c(females.data[2:37, "2013 14 Total"], "F1")
  }
  if(is.element("M1", input$genders)) {
    plot.data <-c(plot.data, males.data[2:37, "2013 14 Total"], "M1")
  } 
  if(is.element("F2", input$genders)){
    plot.data <-c(plot.data, females.data[2:37, "2014 15 Total"], "F2")
  }
  if(is.element("M2", input$genders)) {
    plot.data <-c(plot.data, males.data[2:37, "2014 15 Total"], "M2")
  }
  
  
  
  p <- ggplot()
  return(p)
}