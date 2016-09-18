library(sqldf)
subEPC  <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=';', colClasses=c("Date"="character"), sql = "select * from file where Date == '1/2/2007' OR Date == '2/2/2007'")

png("plot1.png",width=480,height=480,units="px",bg="transparent")


hist(subEPC$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",col="red")
dev.off()
