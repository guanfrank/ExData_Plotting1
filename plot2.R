library(sqldf)
subEPC  <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=';', colClasses=c("Date"="character"), sql = "select * from file where Date == '1/2/2007' OR Date == '2/2/2007'")

subEPC$datetime <- strptime(paste(subEPC$Date,subEPC$Time), "%d/%m/%Y %H:%M")

png("plot2.png",width=480,height=480,units="px",bg="transparent")

plot( subEPC$datetime, subEPC$Global_active_power,  xlab ="",  ylab = "Global Active Power (kilowatts)",  type="l")
dev.off()
