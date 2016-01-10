install.packages("sqldf")
library(sqldf)

# Read data
dat3 <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep =";")


# Convert date  + time values to dates
dat3$day <- strptime(paste(dat3$Date, dat3$Time), "%d/%m/%Y %H:%M:%S")


# Create the plot
oldpar <- par()
par(mfrow = c(2,2))
# Global Active Power plot
plot(dat3$day, dat3$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
# Voltage plot
plot(dat3$day, dat3$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
# Sub metering plot
dat3$day <- strptime(paste(dat3$Date, dat3$Time), "%d/%m/%Y %H:%M:%S")
plot(dat3$day, dat3$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(dat3$day, dat3$Sub_metering_2, type = "l", col = "red")
lines(dat3$day, dat3$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), 
       lwd = 1, cex = 0.7,  bty = "n")
# Global_reactive_power plot
plot(dat3$day, dat3$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Copy the plot into a PNG file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
# close the device
dev.off()
# restore old graphic parameters
par(oldpar)
