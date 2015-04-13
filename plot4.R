#Course 4 - Exploratary Data Analysis
setwd("C:/Users/Pete/Documents/R-files/Course4")

# Reads the data from the data file, skipping lines, and reading a certain
# number of rows defined by the variables lines_to_skip and num_rows
lines_to_skip = 66637
num_rows = 2880
dataset = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", skip=lines_to_skip, nrows=num_rows)

headers = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
           "Sub_metering_1","Sub_metering_2","Sub_metering_3")
colnames(dataset) = headers

# convert Date and Time variables
DateTime = strptime(paste(dataset$Date, dataset$Time), "%d/%m/%Y %H:%M:%S")
dataset_new = cbind(DateTime, dataset[,3:9])


# Label variables
# Plot top left
plot2_ylab = "Global Active Power (kilowatts)"

# Plot bottom left
plot3_ylab = "Energy sub metering"

# Plot top right
plot4_ylab = "Voltage"
plot4_xlab = "datetime"

# Plot bottom right
plot5_ylab = "Global_reactive_power"
plot5_xlab = "datetime"


# png4
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
with(dataset_new,{
  plot(dataset_new$DateTime, dataset_new$Global_active_power, type = "l",
       ylab = plot2_ylab, xlab = "")
  
  plot(dataset_new$DateTime, dataset_new$Voltage, type = "l",
       ylab = plot4_ylab, xlab = plot4_xlab)
  
  plot(dataset_new$DateTime,dataset_new$Sub_metering_1, type = "l",
       ylab = plot3_ylab, xlab = "", col = "Black")
  lines(dataset_new$DateTime,dataset_new$Sub_metering_2, col = "Red")
  lines(dataset_new$DateTime,dataset_new$Sub_metering_3, col = "Blue")
  legend("topright",c("Sub_metering1", "Sub_metering2", "Sub_metering3"), 
         lwd = 0.5, col = c("Black","Red","Blue"))
    
  plot(dataset_new$DateTime, dataset_new$Global_reactive_power, type = "l",
       ylab = plot5_ylab, xlab = plot5_xlab)
})


dev.off()



