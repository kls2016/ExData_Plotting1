library(ggplot2)
library(lattice)

colNames <- read.table("household_power_consumption.txt", sep = ";", colClasses = "character", nrows = 1)
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", col.names = colNames, skip = 66636, nrows = 2880)

print(dim(powerData))

powerData$Date <- as.Date(powerData$Date)
powerData$Time <- strptime(powerData$Time, format = "%H:%M:%S")

par(mfrow = c(1, 1))
hist(powerData$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()