plot2 <- function() {
        fileLocation <- "../household_power_consumption.txt";
        
        # Read the data file.
        hwdata <- read.table(fileLocation, header = TRUE, na.strings = '?', quote = "", sep = ';', stringsAsFactors = FALSE)
        data2plot <- hwdata[hwdata$Date %in% c("1/2/2007", "2/2/2007"), ]

        fulltime <- paste(data2plot$Date, data2plot$Time)
        plottime <- strptime(fulltime, "%d/%m/%Y %H:%M:%S")
        
        # generate plot 
        png("plot2.png", width = 480, height = 480)
        plot(plottime, data2plot$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
        dev.off()
}