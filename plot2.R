install.packages("sqldf")
library(sqldf)

# Read data
dat3 <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep =";")

# Convert date  + time values to dates
dat3$day <- strptime(paste(dat3$Date, dat3$Time), "%d/%m/%Y %H:%M:%S")


# Create the plot
plot(dat3$day, dat3$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Copy the plot into a PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480)

# close the device
dev.off()
