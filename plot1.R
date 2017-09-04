#week 1 project

#load the file and subset the data from 2007-02-01 and 2007-02-02
setwd("C:/Users/Ravi Patel/Desktop/Data Science/Exploratory Data analysis/week 1 project")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power_consumption.zip")
unzip("power_consumption.zip")
power<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".", stringsAsFactors = FALSE)
sub_power<-power[power$Date %in% c("1/2/2007","2/2/2007") ,]


#plot1
data<-as.numeric(sub_power$Global_active_power)
png(filename = "plot1.png",width = 480, height = 480)
hist(x= data, xlab= "Global Active Power (kilowatts)", ylab = "Frequency", col="red", main="Global Active Power")
dev.off()