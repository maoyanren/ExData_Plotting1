plot3 <- function() {
        fileLocation <- "../household_power_consumption.txt";
        
        # Read the data file.
        hwdata <- read.table(fileLocation, header = TRUE, na.strings = '?', quote = "", sep = ';', stringsAsFactors = FALSE)
        data2plot <- hwdata[hwdata$Date %in% c("1/2/2007", "2/2/2007"), ]
        
        fulltime <- paste(data2plot$Date, data2plot$Time)
        plottime <- strptime(fulltime, "%d/%m/%Y %H:%M:%S")
        
        # generate plot 
        png("plot3.png", width = 480, height = 480)
        plot(plottime, data2plot$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
        lines(plottime, data2plot$Sub_metering_2, type = "l", col = "red")
        lines(plottime, data2plot$Sub_metering_3, type = "l", col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
        dev.off()
}