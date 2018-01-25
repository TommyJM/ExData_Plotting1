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
png(filename="Plot1.png", width=480, height=480)
hist(as.numeric(elecsub$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
