
setwd('~/dataviz-fall-2013/bike-crash/')

library(maptools)

# a shape file of neighborghoods.
shapes <- readShapePoly("planning_neighborhoods/planning_neighborhoods.shp")
plot(shapes)

#a shape file of points from source.
crash_map <- readShapePoints("Bike.shp")
plot(crash_map)


map_data <- data.frame(shapes)

#format into date
crash_map$newDate <- as.Date(as.character(crash_map$DATE), format="%m/%d/%Y")

#year 
crash_map$year <- format(crash_map$newDate, format="%Y")

#subset
y2 <- subset(crash_map, year==2000)

#plot all the dots
plot(crash_map, col="lightgrey")

#"points"= dots on top of previous map. and they're red. Bam! crashes only in the year 2000
points(y2, col="red")