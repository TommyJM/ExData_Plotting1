setwd("C:/Users/ctmun/OneDrive/Desktop/DS Explor Anal")
elecpwr <- read.table("C:/Users/ctmun/OneDrive/Desktop/DS Explor Anal/Proj I Pwr/household_power_consumption.txt", 
                    header = TRUE, sep = ";", stringsAsFactors = FALSE)
head(elecpwr, n=3)
class(elecpwr$Date)
##  [1] "character"
library(dplyr)
elecDate <- mutate(elecpwr, date= as.Date(Date, format="%d/%m/%Y"))
DateID1 <- "2007-02-01"
DateID2 <- "2007-02-02"
elecsub <- filter(elecDate, (date == DateID1 | date == DateID2))
dim(elecsub)
##  [1] 2880   10
elecsubDTG <- mutate(elecsub, DTG=as.POSIXct(paste(elecsub$date, elecsub$Time), format="%Y-%m-%d %H:%M:%S"))
head(elecsubDTG, n=3)
png(filename = "Plot4.png", height = 480, width = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(1,1,2,1))
plot(elecsubDTG$DTG, elecsubDTG$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(elecsubDTG$DTG, elecsubDTG$Voltage, xlab="datetime", ylab = "Voltage", type = "l", lwd=1)
plot(elecsubDTG$DTG, elecsubDTG$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(elecsubDTG$DTG, elecsubDTG$Sub_metering_2, col="red")
lines(elecsubDTG$DTG, elecsubDTG$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
plot(elecsubDTG$DTG, elecsubDTG$Global_reactive_power, type="l", lwd=1, xlab="datetime", ylab = "Global_reactive_power")
dev.off()
