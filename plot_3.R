# Assignment 1, Explanatory analysis, plot 3
# 20 September 2016

rm(list=ls())
setwd("C:/Users/Pieter/Documents")
hd<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hd$d<-as.character(hd$Date)
hd<-hd[hd$d=="1/2/2007" | hd$d=="2/2/2007" ,]
hd<-hd[order(hd$d),]
hd$nr<-1:2880

png("plot3.png",  width = 480, height = 480, units = "px")
plot.new()
plot(hd$nr, hd$Sub_metering_3, type='l', col='blue', xaxt="n",
      xlab="", ylab="Energy sub metering", ylim = c(0,40))
lines(hd$nr, hd$Sub_metering_2, col="red")
lines(hd$nr, hd$Sub_metering_1, col="black")
legend("topright", pch="_", col=c("black","red","blue"), 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
dev.off()