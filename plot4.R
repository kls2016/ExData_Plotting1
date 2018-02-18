library(lubridate)

colNames <- read.table("household_power_consumption.txt", sep = ";", colClasses = "character", nrows = 1)
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", col.names = colNames, skip = 66636, nrows = 2880)

print(dim(powerData))

powerData$Day <- as.POSIXct(paste(powerData$Date, powerData$Time), format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2), mar = c(5, 4, 1, 1))
with(powerData, plot(Day, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power"))
with(powerData, lines(Day, Global_active_power, lty = 1))

with(powerData, plot(Day, Voltage, type = "n", xlab = "datetime", ylab = "Voltage"))
with(powerData, lines(Day, Voltage, lty = 1))

with(powerData, plot(Day, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(powerData, lines(Day, Sub_metering_1, lty = 1))
with(powerData, lines(Day, Sub_metering_2, lty = 1, col = "red"))
with(powerData, lines(Day, Sub_metering_3, lty = 1, col = "blue"))
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1  ", "Sub_metering_2  ", "Sub_metering_3  "), bty = "n", cex = 0.8)

with(powerData, plot(Day, Global_reactive_power, type = "n", xlab = "datetime"))
with(powerData, lines(Day, Global_reactive_power, lty = 1))


dev.copy(png, file = "plot4.png")
dev.off()