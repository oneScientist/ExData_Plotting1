install.packages("sqldf")
library(sqldf)

# Read data
dat3 <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep =";")


# Convert date  + time values to dates
dat3$day <- strptime(paste(dat3$Date, dat3$Time), "%d/%m/%Y %H:%M:%S")

# Create the plot
hist(dat3$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
# Copy the plot into a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
# close the device
dev.off()
