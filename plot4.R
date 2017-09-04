#week 1 project

#load the file and subset the data from 2007-02-01 and 2007-02-02
setwd("C:/Users/Ravi Patel/Desktop/Data Science/Exploratory Data analysis/week 1 project")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power_consumption.zip")
unzip("power_consumption.zip")
power<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, dec = ".", stringsAsFactors = FALSE)
sub_power<-power[power$Date %in% c("1/2/2007","2/2/2007") ,]


#plot4
#making necessary vectors
data<-as.numeric(sub_power$Global_active_power)
time<-strptime(paste(sub_power$Date, sub_power$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
sub1<-as.numeric(sub_power$Sub_metering_1)
sub2<-as.numeric(sub_power$Sub_metering_2)
sub3<-as.numeric(sub_power$Sub_metering_3)
volt<-as.numeric(sub_power$Voltage)
reac<-as.numeric(sub_power$Global_reactive_power)
#making the plots
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
#1
plot(y= data, x=time, xlab="", ylab= "Global Active Power (kilowatts)",  type="l")
#2
plot(y= volt, x= time, xlab = "datetime", ylab= "Voltage", type = "l")
#3
plot(x=time, y=sub1, xlab="", ylab = "Energy sub metering", col="black", type = "l")
lines(x=time, y=sub2, type="l", col="red")
lines(x=time, y=sub3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd=2.5, col = c("black","red","blue"),bty = "n")
#4
plot(y=reac, x=time, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()
