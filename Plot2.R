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
png(filename="Plot2.png", height = 480, width = 480)
plot(elecsubDTG$DTG, elecsubDTG$Global_active_power, type = "l",  xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()