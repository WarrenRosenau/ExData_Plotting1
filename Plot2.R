# Script to create plot2.png
source("EDA_Setup.R")

# setup the tidy dataset
tidyData <- EDA_Setup()

png(file = "./plot2.png", height = 480, width = 480)

with( tidyData,
      plot(Date,
           Global_active_power,
           type="l",
           ylab = "Global Active Power (kilowatts)",
           xlab = ""))
           

dev.off()