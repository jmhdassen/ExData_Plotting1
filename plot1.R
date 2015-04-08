
## loading the data

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
png(file="plot1.png", width = 480, height = 480)
hist(data200702$Global_active_power, col="red", xlab="Global Active Power (kilowatt)", ylab= "Frequency", main="Global Active Power")
##title(main="")
dev.off()



