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

png("plot4.png")

#Creates 2X2 plot layout
par(mfrow=c(2,2))

#Plots global active power vs. time in position (1,1)
plot(time,data$Global_active_power, type="l", main="", xlab="",
     ylab="Global Active Power")

#Plots voltage vs. time in position (1,2)
plot(time,data$Voltage,type="l",main="", xlab="datetime", ylab = "Voltage")

#Plots 3 sub metering variables vs. time with legend in position (2,1). Legend
#box removed by setting bty="n"
plot(time,data$Sub_metering_1, type = "l", main="",xlab="",
     ylab="Energy sub metering")
lines(time, data$Sub_metering_2, col = "red")
lines(time, data$Sub_metering_3,col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","blue","red"), bty="n")

#Plots global reactive power vs. time in position (2,2)
plot(time,data$Global_reactive_power, type="l", main="",xlab="datetime",
     ylab="Global_reactive_power")

dev.off()