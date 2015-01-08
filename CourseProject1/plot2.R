colClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
data <- read.csv("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = colClasses)
datasubset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

datasubset$DateTime <- paste(datasubset$Date, datasubset$Time)
datasubset$DateTime <- strptime(datasubset$DateTime, format = "%d/%m/%Y %H:%M:%S")

with(datasubset, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

dev.copy(png, file = "plot2.png")
dev.off()