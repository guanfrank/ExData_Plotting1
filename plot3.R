library(sqldf)
subEPC  <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=';', colClasses=c("Date"="character"), sql = "select * from file where Date == '1/2/2007' OR Date == '2/2/2007'")

subEPC$datetime <- strptime(paste(subEPC$Date,subEPC$Time), "%d/%m/%Y %H:%M")

# Plot the Data!
<<<<<<< HEAD
png("plot3.png",width=480,height=480,units="px",bg="transparent")
=======

png("plot3.png",width=480,height=480,units="px")
>>>>>>> 4566463e7ef54bce874a0c6b7bc3c79c92ca0c6c

plot(subEPC$datetime, subEPC$Sub_metering_1, xlab ="", ylab = "Energy sub metering",type ="l",col = 'black')

lines(subEPC$datetime,subEPC$Sub_metering_2,col = "red")

lines(subEPC$datetime,subEPC$Sub_metering_3,col = "blue")

legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c('black','red','blue'), lty = 1, lwd = 3)

dev.off() # Close the PNG device!

