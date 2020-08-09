## Plot 4

# load data
library(data.table)
power <- fread("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# subset date
power <- power[power$Date %in% c("1/2/2007", "2/2/2007")]
# plot to png file
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,1))
plot(power$datetime, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
with(power, plot(datetime, Voltage, type = "l"))
with(power, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(power, lines(datetime, Sub_metering_2, col = "red"))
with(power, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)
with(power, plot(datetime, Global_reactive_power, type = "l"))
dev.off()