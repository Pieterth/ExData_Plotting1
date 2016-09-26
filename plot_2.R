# Assignment 1, Explanatory analysis, plot 2
# 20 September 2016

rm(list=ls())
setwd("C:/Users/Pieter/Documents")
hd<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hd$d<-as.character(hd$Date)
hd<-hd[hd$d=="1/2/2007" | hd$d=="2/2/2007" ,]
dim(hd)
hd<-hd[order(hd$d),]
hd$nr<-1:2880

png("plot2.png",  width = 480, height = 480, units = "px")
plot(hd$nr, hd$Global_active_power,
     ylab="Global active power (kilowatts)", 
     xlab="", type="n", xaxt="n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
lines(hd$nr, hd$Global_active_power,  col="black")
dev.off()