# Script to create plot1.png
source("EDA_Setup.R")

# setup the tidy dataset
tidyData <- EDA_Setup()

png(file = "./plot1.png", height = 480, width = 480)

hist(tidyData$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.off()