setwd('~/dataviz-fall-2013/bike-crash/')
data <- read.csv('bike_collision.csv', stringsAsFactors=F)

summary(data)

#lets look at crashes per hour
#first lets put the time and date together
test <- paste(data$formatDate[1:10], data$time[1:10])

#make it a date and hour format
as.Date(test, format="%m/%d/%y %H:%M:%M")

#getting ride of the space and splitting Hr&Min from AM/PM
sapply(strsplit(data$time, " "), function(x) x[2])

#function to take PM and multimply it by 12 (hrs)
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

#aggregate and plot
byHour <- aggregate(data$hour, list(data$hour), length)
plot(byHour$Group.1, byHour$x)
> barplot(byHour$x)
> plot(byHour$Group.1, byHour$x, type="h")
> plot(byHour$Group.1, byHour$x, type="l")
> plot(byHour$Group.1, byHour$x, type="h")


