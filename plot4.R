##read in data
power <- read.csv("household_power_consumption.txt", sep = ";", dec = ".", na.strings="?")

##create one time variable including both date and time with POSIXct class
power$Date <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")

##subset data to only get data from the 1st and 2nd of Feb 2007
power2 <- subset(power, Date >= as.POSIXct("2007-02-01") & Date < as.POSIXct("2007-02-03"))

power2$Global_active_power <- as.numeric(power2$Global_active_power)
power2$Sub_metering_1 <- as.numeric(power2$Sub_metering_1)
power2$Sub_metering_2 <- as.numeric(power2$Sub_metering_2)
power2$Sub_metering_3 <- as.numeric(power2$Sub_metering_3)
power2$Voltage <- as.numeric(power2$Voltage)

par(mfrow = c(2,2))

with(power2, {
        plot(Date, Global_active_power, type="l", ylab="Global Active Power", xlab="")
        plot(Date, Voltage, type="l", ylab="Voltage", xlab="datetime")
        plot(Date, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
        lines(Date, Sub_metering_2, col = "red")
        lines(Date, Sub_metering_3, col = "blue")
        legend("topright", bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
        plot(Date, Global_reactive_power, type="l", ylab="Global_reactive_power",xlab="datetime")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()