library(dplyr)
library(tidyr)

get_data_subset_by_dates <- function(){
    #
    # Function to download and unzip the power consumption dataset and having converted Date and Time columns to 
    # valid Date and Time objects, returns a subset of the data between two dates in February.
    #
    compressed_source_file_URL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    raw_source_file_name <- "household_power_consumption"
    start_date = "1/2/2007"
    end_date = "2/2/2007"
    
    compressed_file_name = paste(raw_source_file_name, ".zip", sep = "")
    uncompressed_file_name = paste(raw_source_file_name, ".txt", sep = "")
    
    # Download the specified input file.
    download.file(compressed_source_file_URL,compressed_file_name)
    
    # Unzip downloaded file.
    unzip(compressed_file_name)
    
    source_data <- read.table(uncompressed_file_name, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=F)
    
    # Create a new column including both date and time
    source_data <- mutate(source_data, DateTime = as.POSIXct(paste(source_data$Date, source_data$Time), format="%d/%m/%Y %H:%M:%S"))
    
    # Convert the date string to date class
    source_data <- mutate(source_data, Date = as.Date(Date, "%d/%m/%Y"))
    
    # Before performing any additional processing, only extract those observations between the specified date range.
    subset_data <- subset(source_data, Date >= as.Date(start_date, "%d/%m/%Y") & Date <= as.Date(end_date, "%d/%m/%Y"))
    
    # Convert the time string to time class
    subset_data <- mutate(subset_data, Time = as.POSIXct(strptime(subset_data$Time, format = "%H:%M:%S")))
    
    rm(source_data)
    
    return(subset_data)
}