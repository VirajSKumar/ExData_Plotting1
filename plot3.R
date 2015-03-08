#Reads data for appropriate dates from file using skip and nrows
data <-read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880,
                  colClasses = c("character", "character","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric"))

#Sets the column names
data <- setNames(data, c("Date","Time", "Global_active_power", "Global_reactive_power",
                         "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                         "Sub_metering_3"))

#Creates vector of Time objects from Date and Time data
time_c <- paste(data$Date, data$Time)
time <- strptime(time_c,"%d/%m/%Y %H:%M:%S", tz="US/Pacific")

png("plot3.png")

#Plots line plot of sub metering 1 vs. time
plot(time,data$Sub_metering_1, type = "l", main="",xlab="",
     ylab="Energy sub metering")

#Adds line plots of sub metering 2 and 3 to first plot
lines(time, data$Sub_metering_2, col = "red")
lines(time, data$Sub_metering_3,col = "blue")

#Adds legend at topright position with text matching line symbols(lty) by color(col)
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","blue","red"))

dev.off()
