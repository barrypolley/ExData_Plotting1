# Load data and generate third plot of assignment

# Assumes the data file resides in the same directory as this script
# Also assumes package sqldf and dependencies are available/installed

# read data for two days - merge date and time fields for X axis
library(sqldf)
tbl1 <- read.csv.sql("household_power_consumption.txt", sql= "select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=";")
tbl1$FullDate <- strptime(paste(tbl1$Date,tbl1$Time), "%d/%m/%Y %H:%M:%S")

# draw the plot to a .png file
png("plot3.png", width=480, height=480)
plot(tbl1$FullDate, tbl1$Sub_metering_1,type="l",col="black", xlab="",ylab="Energy sub metering")
lines(tbl1$FullDate, tbl1$Sub_metering_2,type="l",col="red")
lines(tbl1$FullDate, tbl1$Sub_metering_3,type="l",col="blue")
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()