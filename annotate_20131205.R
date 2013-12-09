#reprojects x,y into lat long points

p <- SpatialPoints(cbind(data$X, data$Y), 
  proj4string=CRS("+proj=lcc +lat_1=37.06666666666667 +lat_2=38.43333333333333 +lat_0=36.5 +lon_0=-120.5 +x_0=2000000 +y_0=500000.0000000002 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs "))

projected <- spTransform(p, CRS("+proj=longlat"))

 latlon <- as.data.frame(projected)

 data$lon <- latlon$coords.x1

 data$lat <- latlon$coords.x2

 write.csv(data, file="dataWithLatLon.csv")