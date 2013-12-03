#annotated R code: 

setwd('~/dataviz-fall-2013/bike-crash/')



data <- read.csv('bike_collision.csv', stringsAsFactors=F)

install.packages("maptools")

library(maptools)

shapes <- readShapePoly("planning_neighborhoods/planning_neighborhoods.shp")
plot(shapes)

map_data <- data.frame(shapes)

crash_map <- readShapePoints("Bike.shp")

plot(crash_map)

male <- subset(data, Party.Sex.1 == "Male")
dim(male)

female <- subset(data, Party.Sex.1 == "Female")
dim(female)

#Let's order the various categories based on date. but first...

#let's make the dates "strings" instead of "factors" 
data$formatDate <- as.character(data$date)

#Then we have to make them "dates" 
data$formatDate <- as.Date(data$date, format="%m/%d/%y")

#total females involved in accidents by date
femaleByDate <- aggregate(female$date, list(female$date), length)

#now we need to add accidents per date to females per date




# where do the most crashes occur?




ampm_list <- strsplit(data$time, " ")

get_second_element <- function(item) {
	return (item[2])
}


ampm <- sapply(ampm_list, get_second_element)


hour_list <- strsplit(data$time, ":")

get_first_element <- function(item) {
	return (item[1])
}

hour <- as.numeric(sapply(hour_list, get_first_element ))


data$hour <- ifelse(ampm == "PM", hour+12, hour)



}
