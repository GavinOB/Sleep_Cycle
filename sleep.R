library(ggplot2)

sleep <- read.csv(file = "sleepdata.csv", sep = ";", as.is=TRUE)
names(sleep)[names(sleep) == "Activity..steps."] <- "Steps"

# convert to proper date/time format
sleep$Start <- as.POSIXct(sleep$Start, format = "%Y-%m-%d %H:%M:%S")
sleep$End <- as.POSIXct(sleep$End, format = "%Y-%m-%d %H:%M:%S")

# change "time in bed" to decimal hours
sleep$Time.in.bed <- sapply(strsplit(sleep$Time.in.bed, ":"),
                            function(x) {
                                x <- as.numeric(x)
                                round(x[1]+x[2]/60, 2)
                            }
)

# convert percentage strings to numeric
sleep$Sleep.quality <- as.numeric(sub("%", "" , sleep$Sleep.quality)) / 100

# add column for day of week
week <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
sleep$Day.of.week <- factor(weekdays(sleep$Start), levels = week, ordered = TRUE)

# average sleep quality by day of week
sleep.day <- aggregate(Sleep.quality ~ Day.of.week, data = sleep, mean) 

# average sleep time by day of week
sleep.time <- aggregate(Time.in.bed ~ Day.of.week, data = sleep, mean) 

# average sleep quality by step ranges
sleep.steps <- sleep
sleep.steps$Step.Range <- cut(sleep.steps$Steps, breaks = seq(0, max(sleep$Steps), by = 1000), dig.lab = 10)
sleep.steps <- aggregate(Sleep.quality ~ Step.Range, data = sleep.steps, mean)

# average steps by day of week
sleep.steps.day <- aggregate(Steps ~ Day.of.week, data = sleep, mean)

# TODO: mention average time asleep, sleep quality range, etc.
