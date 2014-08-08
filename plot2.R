# Load data and generate second plot of assignment

# Assumes the data file resides in the same directory as this script
# Also assumes package sqldf and dependencies are available/installed

# read data for two days - merge date and time fields for X axis
library(sqldf)
tbl1 <- read.csv.sql("household_power_consumption.txt", sql= "select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=";")
tbl1$FullDate <- strptime(paste(tbl1$Date,tbl1$Time), "%d/%m/%Y %H:%M:%S")

# draw the plot to a .png file
png("plot2.png", width=480, height=480)
plot(tbl1$FullDate, tbl1$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
