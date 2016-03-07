plot4 <- function() {
        fileLocation <- "../household_power_consumption.txt";
        
        # Read the data file.
        hwdata <- read.table(fileLocation, header = TRUE, na.strings = '?', quote = "", sep = ';', stringsAsFactors = FALSE)
        data2plot <- hwdata[hwdata$Date %in% c("1/2/2007", "2/2/2007"), ]
        
        fulltime <- paste(data2plot$Date, data2plot$Time)
        plottime <- strptime(fulltime, "%d/%m/%Y %H:%M:%S")
        
        # generate plot 
        png("plot4.png", width = 480, height = 480)
        par(mfrow = c(2, 2))
        
        # 1
        plot(plottime, data2plot$Global_active_power, type="l", xlab="", ylab="Global Active Power")
        
        # 2
        plot(plottime, data2plot$Voltage, type="l", xlab="datetime", ylab="Voltage")
        
        #3
        plot(plottime, data2plot$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
        lines(plottime, data2plot$Sub_metering_2, type="l", col="red")
        lines(plottime, data2plot$Sub_metering_3, type="l", col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"), bty = "n")
        
        #4
        plot(plottime, data2plot$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
        
        dev.off()
}