library(sqldf)
df  <- read.csv.sql("household_power_consumption.txt", header=TRUE, sep=';', colClasses=c("Date"="character"), sql = "select * from file where Date == '1/2/2007' OR Date == '2/2/2007'")

df$datetime <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M")

# Plot the Data!
png("plot4.png",width=480,height=480,units="px",bg="transparent")

# Multiple Plots
par(mfrow=c(2,2))

message("Global Active Power Plot ( top left )")
plot( df$datetime,df$Global_active_power, xlab ="", ylab = "Global Active Power", type ="l")


plot( df$datetime,df$Voltage, xlab ="datetime", ylab = "Voltage", type ="l")

plot( df$datetime,df$Sub_metering_1,xlab ="", ylab = "Energy sub metering", type ="l",col = 'black')

lines( df$datetime, df$Sub_metering_2, col = "red")
lines( df$datetime, df$Sub_metering_3, col = "blue")

legend( 'topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c('black','red','blue'),lty = 1,lwd = 3)


plot(df$datetime, df$Global_reactive_power,xlab ="datetime",ylab = "Global_reactive_power", type ="l")

dev.off() # Close the PNG device!