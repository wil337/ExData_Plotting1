
getwd()
library(dplyr)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption.zip")
con<-unz("household_power_consumption.zip","household_power_consumption.txt")
dt<-read.table(con,sep=";",header=TRUE,stringsAsFactors = FALSE) %>%
  filter(Date %in% c("1/2/2007","2/2/2007"))
png(filename='plot1.png',width = 480, height = 480)
with(dt,hist(as.numeric(Global_active_power)/500,col="red",xlab="Global active power (kilowatts)",main="Global Active Power"))
dev.off()
