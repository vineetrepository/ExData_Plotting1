library(data.table)
library(lubridate)
library(dplyr)
setwd("C:/Vineet-Learning/Data Science/Course 4- Exploratory Data Analysis/ExData_Plotting1")

# Download zip file with data and unzip data in data folder to extract datasets
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("./data")) {dir.create("./data")}
download.file(fileurl, destfile = "./data/dataset.zip", method="curl")
paste(getwd(),"/data")
unzip(zipfile = "./data/dataset.zip", exdir = paste(getwd(),"/data", sep=""))

# Read household consumption data and set "?" as missing values
feature <- fread("./data/household_power_consumption.txt", na.strings="?")

# Check data structure
str(feature)

# Filter data from the dates 2007-02-01 and 2007-02-02
feature2<-filter(feature, Date %in% c("1/2/2007", "2/2/2007"))

# Convert data and time character variable to datetime
feature2$Datetime<-paste(feature2$Date, feature2$Time)
feature2$Datetime2<-dmy_hms(feature2$Datetime)

# Create PNG file with plot
png(file = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
hist(feature2$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatt)")
dev.off()