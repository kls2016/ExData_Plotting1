library(lubridate)

colNames <- read.table("household_power_consumption.txt", sep = ";", colClasses = "character", nrows = 1)
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", col.names = colNames, skip = 66636, nrows = 2880)

print(dim(powerData))

powerData$Day <- as.POSIXct(paste(powerData$Date, powerData$Time), format = "%d/%m/%Y %H:%M:%S")

print(head(powerData$Date))
print(tail(powerData$Date))

par(mfrow = c(1, 1))
with(powerData, plot(Day, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(powerData, lines(Day, Global_active_power, lty = 1))
dev.copy(png, file = "plot2.png")
dev.off()