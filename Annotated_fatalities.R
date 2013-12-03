setwd('~/dataviz-fall-2013/bike-crash')

data <- read.csv("bike_collision.csv", stringsAsFactors=F)

#Ok crud, my function doesn't work. Skip below it. 
f <- function() { 
	if(data$party.at.fault == 1)
		return (data$Party.Type.1)

	else(data$Party.Type.2)}


# create an emtpty field
data$at.fault <- NA


#
party_at_fault_2_indexes <- which(data$party.at.fault == 2)
data$at.fault[party_at_fault_2_indexes] <- data$Party.Type.2[party_at_fault_2_indexes]


party_at_fault_1_indexes <- which(data$party.at.fault == 1)
data$at.fault[party_at_fault_1_indexes] <- data$Party.Type.1[party_at_fault_1_indexes]


at_fault <- f()

#needs to be a character, not a factor
at_fault2 <- as.character(at_fault)

#subsets drivers
subset(at_fault2, at_fault2 == "Driver")

#gets the number of the subset

subset(at_fault2, at_fault2 == "Bicylist")
length(subset(at_fault2, at_fault2 == "Bicyclist"))


subset(at_fault2, at_fault2 == "Pedestrian")
length(subset(at_fault2, at_fault2 == "Pedestrian"))

