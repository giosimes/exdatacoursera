colClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
data <- read.csv("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = colClasses)
datasubset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

datasubset$DateTime <- paste(datasubset$Date, datasubset$Time)
datasubset$DateTime <- strptime(datasubset$DateTime, format = "%d/%m/%Y %H:%M:%S")

png("plot4.png")
par(mfrow = c(2, 2))

with(datasubset, {
  plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  plot(DateTime, Voltage, type = "l", xlab = "datetime")
  plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  points(DateTime, Sub_metering_2, type = "l", col = "red")
  points(DateTime, Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime")
})

dev.off()