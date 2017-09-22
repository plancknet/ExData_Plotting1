# Reading data
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")


# Extracts only 01/2016 and 02/2016 data
hpc$Date      <- as.Date(hpc$Date, "%d/%m/%Y")
extract_dates <- hpc$Date == as.Date("01/02/2007", "%d/%m/%Y") | hpc$Date == as.Date("02/02/2007", "%d/%m/%Y")
hpc2          <- hpc[extract_dates,]
hpc2$Date     <- as.POSIXct(paste(hpc2$Date, hpc2$Time))

#plot3
Sys.setlocale(category = "LC_ALL", locale = "english")

plot(hpc2$Date, 
     hpc2$Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering", 
     xlab = "")

lines(hpc2$Date, 
      hpc2$Sub_metering_2, 
      col = "red")

lines(hpc2$Date, 
      hpc2$Sub_metering_3, 
      col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col 	  = c("black", "red", "blue"), 
       lty    = 1)

dev.copy(png,'plot3.png')
dev.off()

