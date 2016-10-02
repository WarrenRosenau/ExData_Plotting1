library(dplyr)
library(lubridate)

# Script to do all of the common setup tasks to produce a tidy dataset for the four plotting tasks

EDA_Setup <- function() {
        # download source data if needed and unzip to working directory if needed
        projectDatasetUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        projectDatasetZipFile <- "./exdata_data_household_power_consumption.zip"
        projectDatasetFile <- "./household_power_consumption.txt"
        
        # If needed, download the zip file of the dataset 
        if (!file.exists(projectDatasetFile)) {
                download.file(projectDatasetUrl,projectDatasetZipFile, method = "curl")
        }
        
        # if the data folder does not exist, create and fill it by unzipping the zip file
        if (!file.exists(projectDatasetFile)) {
                unzip(projectDatasetZipFile)
        }
        
        # Read in the dataset noting ";" seperator and "?" for NA values
        initialData <-read.table(projectDatasetFile,
                                 sep = ";",
                                 na.strings = "?",
                                 stringsAsFactors = FALSE, 
                                 header = TRUE, 
                                 colClasses = c(rep("character",2),rep("numeric",7) ))
        
        # Tidy up the dataset by filtering to the days of interest and by converting
        # date and time strings into plottable date format.
        tidyData <- initialData %>% 
                filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
                mutate(Date = dmy_hms(paste(Date,Time))) %>%
                select(-Time)
                
        tidyData
}