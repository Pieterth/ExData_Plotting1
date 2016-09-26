# Assignment 1, Explanatory analysis, plot 4
# 20 September 2016

rm(list=ls())
setwd("C:/Users/Pieter/Documents")
hd<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hd$d<-as.character(hd$Date)
hd<-hd[hd$d=="1/2/2007" | hd$d=="2/2/2007" ,]
names(hd)
hd<-hd[order(hd$d),]
hd$nr<-1:2880

png("plot4.png",  width = 480, height = 480, units = "px")
plot.new()
par(mfrow=c(2,2))

plot(hd$nr, hd$Global_active_power,
     ylab="Global active power (kilowatts)", 
     xlab="", type="n", xaxt="n")
lines(hd$nr, hd$Global_active_power,  col="black")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

plot(hd$nr, hd$Voltage,
     ylab="Voltage", 
     xlab="datetime", ylim=c(232,248), col="black", type="l", xaxt="n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

plot(hd$nr, hd$Sub_metering_3, type='l', col='blue', xlab="",
     ylab="Energy sub metering", ylim = c(0,40), xaxt="n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
lines(hd$nr, hd$Sub_metering_2, col="red")
lines(hd$nr, hd$Sub_metering_1, col="black")
legend("topright", pch="_", col=c("black","red","blue"), 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(hd$nr, hd$Global_reactive_power,
     ylab="Global reactive power", 
     xlab="datetime", col="black", type="l", xaxt="n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
dev.off()