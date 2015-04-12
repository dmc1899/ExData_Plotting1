library(dplyr)
library(tidyr)

# Source shared function to retrieve source file and return subset of data.
source("downloadSourceFile.R")

main <- function() {
    
    # Read in data set.
    two_days_in_feb_data <- get_data_subset_by_dates()
    
    # Open PNG device for plot.
    png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
    
    # Create Global Active Power plot.
    with(two_days_in_feb_data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
    
    # Close device.
    dev.off()
    
}
