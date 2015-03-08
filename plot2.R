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

#Plots line plot of Global Active Power vs. time
png("plot2.png")
plot(time,data$Global_active_power, type="l", main="",xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
