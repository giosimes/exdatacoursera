colClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
data <- read.csv("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = colClasses)
datasubset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

datasubset$DateTime <- paste(datasubset$Date, datasubset$Time)
datasubset$DateTime <- strptime(datasubset$DateTime, format = "%d/%m/%Y %H:%M:%S")

png("plot3.png")
with(datasubset, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(datasubset, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(datasubset, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()