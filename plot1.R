ExData_Plotting1 <- function() {
        
        fileLocation <- "../household_power_consumption.txt";
        
        # Read the data file.
        hwdata <- read.table(fileLocation, header = TRUE, na.strings = '?', quote = "", sep = ';', stringsAsFactors = FALSE)
        data2plot <- hwdata[hwdata$Date %in% c("1/2/2007", "2/2/2007"), ]
        # stringAsFactors = FALSE can save a lot of trouble
        # %in% operator is useful
        
        # Convert column Date using as.Date(); convert column Time using strptime()
        #dates <- as.character(hwdata$Date)
        #times <- as.character(hwdata$Time)
        #fulltimes <- paste(dates, times)
        
        #hwdata$Date <- as.Date(dates, "%d/%m/%Y")
        #hwdata$Time <- strptime(fulltimes, "%d/%m/%Y %H:%M:%S")
        
        # Find the data between 2007-02-01 and 2007-02-02
        #date1 <- as.Date("2007-02-01")
        #date2 <- as.Date("2007-02-02")
        #data2plot <- hwdata[hwdata$Date >= date1 & hwdata$Date <= date2, ]
        
        # generate plot 
        png("plot1.png", width = 480, height = 480)
        with(data2plot, hist(Global_active_power, col = 'red', xlab = "Global Active Power(kilowatts)", main = "Global Active Power"))
        dev.off()
        
}