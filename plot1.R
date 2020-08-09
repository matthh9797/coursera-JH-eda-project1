## Plot 1 

# load data
library(data.table)
power <- fread("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# subset date
power <- power[power$Date %in% c("1/2/2007", "2/2/2007")]
# plot to png file
png(file = "plot1.png", width = 480, height = 480)
hist(power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()