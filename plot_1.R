# Assignment 1, Explanatory analysis, plot 1
# 20 September 2016

rm(list=ls())
setwd("C:/Users/Pieter/Documents")
hh<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
head(hh)
hd<-hh
hd$d<-as.character(hd$Date)
hd<-hd[hd$d=="1/2/2007" | hd$d=="2/2/2007" ,]
head(hd)

png("plot1.png",  width = 480, height = 480, units = "px")
hist(hd$Global_active_power,
     col="red", main="Global Active Power",
     xlab="Global active power (kilowatts)", ylim=c(0,1400))
dev.off()