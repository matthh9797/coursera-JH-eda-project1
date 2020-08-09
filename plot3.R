## Plot 3

# load data
library(data.table)
power <- fread("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# subset date
power <- power[power$Date %in% c("1/2/2007", "2/2/2007")]
# plot to png file
png(file = "plot3.png", width = 480, height = 480)
with(power, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(power, lines(datetime, Sub_metering_2, col = "red"))
with(power, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)
dev.off()