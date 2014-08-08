# Load data and generate first plot of assignment

# Assumes the data file resides in the same directory as this script
# Also assumes package sqldf and dependencies are available/installed

# read data for two days and coerce types as necessary
library(sqldf)
# tbl1 <- read.csv.sql("household_power_consumption.txt", sql= "select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=";")

# draw the plot to a .png file
# png("plot1.png", width=480, height=480)
hist(tbl1$Global_active_power, col="red", breaks=12, main="Global Active Power", ylim = c(0,1200), xlab="Global Active Power (kilowatts)")
# dev.off()