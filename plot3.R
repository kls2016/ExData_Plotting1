library(lubridate)

colNames <- read.table("household_power_consumption.txt", sep = ";", colClasses = "character", nrows = 1)
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", col.names = colNames, skip = 66636, nrows = 2880)

print(dim(powerData))

powerData$Day <- as.POSIXct(paste(powerData$Date, powerData$Time), format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(1, 1))
with(powerData, plot(Day, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(powerData, lines(Day, Sub_metering_1, lty = 1))
with(powerData, lines(Day, Sub_metering_2, lty = 1, col = "red"))
with(powerData, lines(Day, Sub_metering_3, lty = 1, col = "blue"))
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1     ", "Sub_metering_2      ", "Sub_metering_3      "))
dev.copy(png, file = "plot3.png")
dev.off()