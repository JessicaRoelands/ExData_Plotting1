##read in data
power <- read.csv("household_power_consumption.txt", sep = ";", dec = ".", na.strings="?")

##create one time variable including both date and time with POSIXct class
power$Date <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")

##subset data to only get data from the 1st and 2nd of Feb 2007
power2 <- subset(power, Date >= as.POSIXct("2007-02-01") & Date < as.POSIXct("2007-02-03"))

power2$Sub_metering_1 <- as.numeric(power2$Sub_metering_1)
power2$Sub_metering_2 <- as.numeric(power2$Sub_metering_2)
power2$Sub_metering_3 <- as.numeric(power2$Sub_metering_3)

with(power2, plot(Date, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(power2, lines(Date, Sub_metering_2, col = "red"))
with(power2, lines(Date, Sub_metering_3, col = "blue"))

legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()