## Plot 2

# load data
library(data.table)
power <- fread("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# subset date
power <- power[power$Date %in% c("1/2/2007", "2/2/2007")]
# plot to png file
date <- power$Date
time <- power$Time
datetime <- paste(date, time)
datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
library(dplyr)
power <- transform(power, datetime = datetime)
png(file = "plot2.png", width = 480, height = 480)
plot(power$datetime, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()