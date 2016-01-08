library(dplyr)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption.zip")
con<-unz("household_power_consumption.zip","household_power_consumption.txt")
dt<-read.table(con,sep=";",header=TRUE,stringsAsFactors = FALSE,na.strings="?") %>%
  filter(Date %in% c("1/2/2007","2/2/2007")) %>%
  mutate(datetime = paste(Date,Time))
png(filename='plot2.png',width = 480, height = 480)
plot(x=(as.POSIXct(as.POSIXct(strptime(dt$datetime,"%d/%m/%Y %H:%M:%S")))),y=as.numeric(dt$Global_active_power),type='l',xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
