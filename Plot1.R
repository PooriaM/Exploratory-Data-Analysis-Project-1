##Create Project Folder and Set as Working Directory"
RWD<-getwd()
if (!("Week1_projectdata"%in%RWD)) {dir.create("Week1_projectdata")}
setwd("Week1_projectdata")

## Download and Unzip Project Data

URL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL,destfile ="exdata_data_household_power_consumption.zip")
unzip("exdata_data_household_power_consumption.zip")

## Read and Subset Data
data1<-subset(read.table("household_power_consumption.txt",na.strings = "?",sep=";",header = TRUE,stringsAsFactors = FALSE),(Date=="1/2/2007"|Date=="2/2/2007"))
data1$Date<-as.Date(data1$Date,"%d/%m/%Y")

## Making Plot.1

png(filename = "Plot1.png", width = 480, height = 480, units = "px")
hist(data1$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",main = "Global Active Power")
dev.off()

## Reset Working Directory
setwd(RWD)