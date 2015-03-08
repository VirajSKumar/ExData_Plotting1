#Reads data for appropriate dates from file using skip and nrows
data <-read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880,
              colClasses = c("character", "character","numeric","numeric","numeric",
                             "numeric","numeric","numeric", "numeric"))

#Sets the column names
data <- setNames(data, c("Date","Time", "Global_active_power", "Global_reactive_power",
              "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
              "Sub_metering_3"))

#Plots histogram of global active power
png("plot1.png")
hist(data$Global_active_power, col="red",main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
