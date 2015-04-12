library(dplyr)
library(tidyr)

# Source shared function to retrieve source file and return subset of data.
source("downloadSourceFile.R")

main <- function() {
    
    # Read in data set.
    two_days_in_feb_data <- get_data_subset_by_dates()
    
    # Open PNG device for plot.
    png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")
    
    with(two_days_in_feb_data, plot(Sub_metering_1 ~ DateTime, type="n", ylab="Energy sub metering", xlab=""))
    with(two_days_in_feb_data, points(Sub_metering_1 ~ DateTime, type="l", col="black"))
    with(two_days_in_feb_data, points(Sub_metering_2 ~ DateTime, type="l", col="red"))
    with(two_days_in_feb_data, points(Sub_metering_3 ~ DateTime, type="l", col="blue"))
    
    legend("topright",lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue") )
    
    # Close device.
    dev.off()
    
}