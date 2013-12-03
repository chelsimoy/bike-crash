setwd('~/dataviz-fall-2013/bike-crash')

data <- read.csv("bike_collision.csv", stringsAsFactors=F)

data$newDate <- data$DATE

#Reformat date into "date" and just make it a year only
date$year <- format(as.Date(data$newDate, format="%m/%d/%y"), "%Y")

#make new column that's empty
data$at.fault <- NA

#fill new column with whether a biker or driver is at fault
party_at_fault_2_indexes <- which(data$party.at.fault == 2)
data$at.fault[party_at_fault_2_indexes] <- data$Party.Type.2[party_at_fault_2_indexes]


party_at_fault_1_indexes <- which(data$party.at.fault == 1)
data$at.fault[party_at_fault_1_indexes] <- data$Party.Type.1[party_at_fault_1_indexes]

#aggregate the column of people at fault and years
aggregate(data$at.fault, list(data$year, data$at.fault), length)

#store it
at_fault_agg <-  aggregate(data$at.fault, list(data$year, data$at.fault), length)

#rename
names(at_fault_agg) <- c("year", "group", "fault")

# year totals
year_totals <- aggregate(data$at.fault, list(data$year), length)
#renamed
names(year_totals) <- c("year", "total_crash")
#added a year totals column
merge(at_fault_agg, year_totals, by="year")
#save it
at_fault_pct <- merge(at_fault_agg, year_totals, by="year")
#Now, let's divide "fault" by "total_crash" (ie number of bike accidents by total crashes)
at_fault_pct$pct <- at_fault_pct$fault/ at_fault_pct$total_crash
#now plot like a boss
ggplot(data=at_fault_pct, aes(x=at_fault_pct$year, y=at_fault_pct$pct, fill=at_fault_pct$group), ylim=c(0,400), ylab="percent", xlab="year", title="who is at fault for injury accidents") + geom_bar()
#THE PCT PLOT FAULT needs to add up to 100pct. NA's not represented - //NOW AGG!
 data$at.fault.clean[is.na(data$at.fault.clean)] <- "NA"

#subset 
bikes <- subset(at_fault_agg, group=="Bicyclist")
plot(bikes$year, bikes$fault, type="l")

ped <- subset(at_fault_agg, group=="Pedestrian")
driver <- subset(at_fault_agg, group=="Driver")
parkedcars <- subset(at_fault_agg, group=="Parked Vehicle", ylim=c(0,400))


#plot
plot(bikes$year, bikes$fault, type="l", col="green", ylim=c(0,400))
lines(parkedcars$year, parkedcars$fault, type="l", col="purple")
lines(driver$year, driver$fault, type="l", col="red")
lines(ped$year, ped$fault, type="l", col="blue")
title("Rate of Change of Person At Fault")
