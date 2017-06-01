library(dplyr)
library(plotly)
library(ggplot2)

# Read in .csv data files
masters.degrees <- read.csv("data/Masters_Degrees.csv", stringsAsFactors = FALSE, row.names = 1)
doctors.degrees <- read.csv("data/Doctors_Degrees.csv", stringsAsFactors = FALSE, row.names = 1)

# Clean up the column names
colnames(masters.degrees) <- gsub("\\.", "-", colnames(masters.degrees))
colnames(masters.degrees) <- gsub("X", "", colnames(masters.degrees))
colnames(doctors.degrees) <- gsub("\\.", "-", colnames(doctors.degrees))
colnames(doctors.degrees) <- gsub("X", "", colnames(doctors.degrees))

# Transpose data frame to get fields as columns
masters.degrees <- as.data.frame(t(masters.degrees))
doctors.degrees <- as.data.frame(t(doctors.degrees))

# Builds line plot of master's/doctor's degrees over time
GradChart <- function(level, field) {
  if (level == "Master's Degrees")
    data = masters.degrees
  else
    data = doctors.degrees

  Year <- rownames(data)
  Degrees <- data[field]

  p <- ggplot(data = masters.degrees, mapping = aes(x = Year, y = Degrees, group = 1)) +
    geom_point() +
    geom_line() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1),
          axis.title = element_text(vjust=1))
  p <- ggplotly(p, tooltip = c('x', 'y')) %>%
    layout(title = paste(level, "Over Time"),
           yaxis = list(title = field),
           margin=list(b = 80, l = 80, t = 50))

  return(p)
}
