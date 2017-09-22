# Reading data
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")


# Extracts only 01/2016 and 02/2016 data
hpc$Date      <- as.Date(hpc$Date, "%d/%m/%Y")
extract_dates <- hpc$Date == as.Date("01/02/2007", "%d/%m/%Y") | hpc$Date == as.Date("02/02/2007", "%d/%m/%Y")
hpc2          <- hpc[extract_dates,]
hpc2$Date     <- as.POSIXct(paste(hpc2$Date, hpc2$Time))

#plot1
hist(hpc2$Global_active_power, 
     col    = "red",  
     xlab   = "Global Active Power (kilowatts)", 
     main   ="Global Active Power")

dev.copy(png,'plot1.png')
dev.off()
