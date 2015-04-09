
## loading the data
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

setwd("/Users/dassen/Documents/Coursera/04_ExploratoryAnalysis/Course Projects/Project1")

if (!file.exists("data")) {
    dir.create("data")
}

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## Download the zip file
download.file(fileURL, destfile = "./data/house_hold_power_consumption.zip",method="curl")
##  Load into data frame
data <- read.table(unz("./data/house_hold_power_consumption.zip", "household_power_consumption.txt"),sep=";",header=TRUE, na.strings="?")
## Add a Datetime column 
data$Datetime <- strptime(paste(data$Date, data$Time) ,"%d/%m/%Y %H:%M:%S")
## Create a subset of the data with two days data.
data200702 <- data[data$Datetime>="2007-02-01" & data$Datetime<"2007-02-03",]
## Create plot in PNG file.
png(file="plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(data200702$Datetime, data200702$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(data200702$Datetime, data200702$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data200702$Datetime, data200702$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
points(data200702$Datetime, data200702$Sub_metering_2, type="l", col="red")
points(data200702$Datetime, data200702$Sub_metering_3, type="l", col="blue")
legend("topright", lty = 1, col = c("black","red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data200702$Datetime, data200702$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
##title(main="")
dev.off()

par(mfrow=c(1,1))



