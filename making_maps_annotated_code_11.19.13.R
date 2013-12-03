#Making maps subsetting each year -- ## Something about this code is messed but I dont know why... it has to do with the formatting!


setwd('~/dataviz-fall-2013/bike-crash/')

install.packages("maptools")
library(maptools)

data <- readShapePoints("Bike.shp")


#make dates actual dates and create a new column
data$newDate <- format(data$DATE, format="%m-%d-%Y")

#then let's format it, dropping the month and day
data$year <- format(data$newDate, format="%Y")

#subset the year
y2001 <- subset(data, year==2001)

#plot all of the crashes 
plot(data, col="light grey")

#overlay just the crashes from 2001
points(y2001, col="red")

title("2001")