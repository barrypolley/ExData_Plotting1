# Load data and generate fourth plot of assignment

# Assumes the data file resides in the same directory as this script
# Also assumes package sqldf and dependencies are available/installed

# read data for two days - merge date and time fields for X axis
library(sqldf)
tbl1 <- read.csv.sql("household_power_consumption.txt", sql= "select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=";")
tbl1$FullDate <- strptime(paste(tbl1$Date,tbl1$Time), "%d/%m/%Y %H:%M:%S")

# build 2x2 of plots, two new ones and those copied/pasted from plot2 and plot3
# note changes to legends and labels
par(mfrow = c(2,2))

with(tbl1, {

# plot 1
plot(tbl1$FullDate, tbl1$Global_active_power,type="l",xlab="",ylab="Global Active Power")

# plot 2
plot(tbl1$FullDate, tbl1$Voltage,type="l",xlab="datetime",ylab="Voltage")

# plot 3
plot(tbl1$FullDate, tbl1$Sub_metering_1,type="l",col="black", xlab="",ylab="Energy sub metering")
lines(tbl1$FullDate, tbl1$Sub_metering_2,type="l",col="red")
lines(tbl1$FullDate, tbl1$Sub_metering_3,type="l",col="blue")
legend("topright", box.lwd=0, lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# plot4
plot(tbl1$FullDate, tbl1$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

})

# draw the plots to a .png file
dev.copy(png, file="plot4.png")
dev.off()
