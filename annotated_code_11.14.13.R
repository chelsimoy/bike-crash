setwd('~/dataviz-fall-2013/bike-crash/')
#Load datav
data <- read.csv('bike_collision.csv', stringsAsFactors=F)

#Lets make the "date" column actual dates, not characters
data$newDate <- as.Date(data$date, format='%m/%d/%y')

#we need to make our "time" column actual times (ie date), not characters
# data$newTime <- as.Date(data$time, format='%H:%M:%M')

#Now lets add the date (newDate) and time column together
date_time <- paste(data$newDate, data$time)

#aggregate by day
accidents_by_date <- aggregate(data$newDate, list(data$newDate), length)

#renamed the Group.1 and x columns in our new column 'accidents_by_date' "date" and "total crashes"
names(accidents_by_date) <- c("date", "total_crashes")

#plot!
plot(accidents_by_date$date, accidents_by_date$total_crashes)

#But that looks like crap -- too many crashes per day. Let's aggregate crashes per month instead of day
format(data$newDate, format="%m/%y")
month_year <- format(data$newDate, format="%m/%y")

#aggregate
accidents_by_month <- aggregate(data$month_year, list(data$month_year), length)

#rename the columns
names(accidents_by_month) <- c("month", "crashes")

#crap. when we formated we turned our data back into a data.frame. It needs to be a date. lets fix that. 

#Let's add the first of the month becuase it need "day"
paste("01/", accidents_by_month$month)

#get rid of the space
paste("01/", accidents_by_month$month, sep="")

#reformat back into a date and save new column
accidents_by_month$month_as_date <- as.Date(paste("01/", accidents_by_month$month, sep=""), format="%d/%m/%y")

#but we need to order first becuase otherwise our chart looks like a mess! And THEN plot
accidents_by_month <- accidents_by_month[order(accidents_by_month$month_as_date),]
plot(accidents_by_month$month_as_date, accidents_by_month$crashes, type="l")

#Think about plotting on the month and DAY -- throw out the year. Do what we just did but instead of thorwing out day, throw out year



