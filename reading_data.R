## Getting full dataset
data_complete <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_complete$Date <- as.Date(data_complete$Date, format="%d/%m/%Y")

## Subsetting and taking the required data
data_req <- subset(data_complete, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_complete)

## Dates conversion
datetime <- paste(as.Date(data_req$Date), data_req$Time)
data_req$Datetime <- as.POSIXct(datetime)