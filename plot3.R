library(dplyr)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption.zip")
con<-unz("household_power_consumption.zip","household_power_consumption.txt")
dt<-read.table(con,sep=";",header=TRUE,stringsAsFactors = FALSE,na.strings="?") %>%
  filter(Date %in% c("1/2/2007","2/2/2007")) %>%
  mutate(datetime = paste(Date,Time))

png(filename='plot3.png',width = 480, height = 480)
#par(mfrow=c(1,1))
with(dt,plot(x=(as.POSIXct(as.POSIXct(strptime(datetime,"%d/%m/%Y %H:%M:%S")))),y=as.numeric(Sub_metering_1), type = 'l',xlab=""))
with(dt,points(x=(as.POSIXct(as.POSIXct(strptime(datetime,"%d/%m/%Y %H:%M:%S")))),y=as.numeric(Sub_metering_2), type = 'l',col="red"))
with(dt,points(x=(as.POSIXct(as.POSIXct(strptime(datetime,"%d/%m/%Y %H:%M:%S")))),y=as.numeric(Sub_metering_3), type = 'l',col="blue"))
legend("topright", c("sub_metering_1","sub_metering_2","sub_metering_3"), col = c("black","red", "blue"), lty = 1)
dev.off()
#dev.cur()
#dev.set(2)
