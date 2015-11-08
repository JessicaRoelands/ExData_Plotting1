##read in data
power <- read.csv("household_power_consumption.txt", sep = ";", dec = ".", na.strings="?")

##create one time variable including both date and time with POSIXct class
power$Date <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")

##subset data to only get data from the 1st and 2nd of Feb 2007
power2 <- subset(power, Date >= as.POSIXct("2007-02-01") & Date < as.POSIXct("2007-02-03"))

##set global_active_power to numeric value
Global_active_power <- as.numeric(power2$Global_active_power)

plot(power2$Date, power2$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()