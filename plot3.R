install.packages("sqldf")
library(sqldf)

# Read data
dat3 <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep =";")

# Convert date  + time values to dates
dat3$day <- strptime(paste(dat3$Date, dat3$Time), "%d/%m/%Y %H:%M:%S")

# Create the plot
plot(dat3$day, dat3$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(dat3$day, dat3$Sub_metering_2, type = "l", col = "red")
lines(dat3$day, dat3$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lwd = 2,cex = 0.8)

# Copy the plot into a PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480)

# close the device
dev.off()

