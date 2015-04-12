library(dplyr)
library(tidyr)

# Source shared function to retrieve source file and return subset of data.
source("downloadSourceFile.R")

main <- function() {
    
    # Read in data set.
    two_days_in_feb_data <- get_data_subset_by_dates()
    
    # Open PNG device for plot.
    png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")
    
    # Two columns and two rows.
    par(mfrow=c(2,2))
    
    # Chart 1.
    with(two_days_in_feb_data, plot(Global_active_power ~ DateTime, type="l", ylab="Global Active Power (Kilowatts)", xlab=""))
    
    # Chart 2.
    with(two_days_in_feb_data, plot(Voltage ~ DateTime, type="l", ylab="Voltage", xlab="datetime"))
    
    # Chart 3.
    with(two_days_in_feb_data, plot(Sub_metering_1 ~ DateTime, type="n", ylab="Energy sub metering", xlab=""))
    with(two_days_in_feb_data, points(Sub_metering_1 ~ DateTime, type="l", col="black"))
    with(two_days_in_feb_data, points(Sub_metering_2 ~ DateTime, type="l", col="red"))
    with(two_days_in_feb_data, points(Sub_metering_3 ~ DateTime, type="l", col="blue"))
    
    legend("topright",lty=1, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue") )
    
    # Chart 4.
    with(two_days_in_feb_data, plot(Global_reactive_power ~ DateTime, type="l"))
    
    # Close device.
    dev.off()
    
}