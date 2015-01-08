colClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
data <- read.csv("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = colClasses)
datasubset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
hist(datasubset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()