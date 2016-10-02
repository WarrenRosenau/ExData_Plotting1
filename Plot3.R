# Script to create plot3.png
source("EDA_Setup.R")

# setup the tidy dataset
tidyData <- EDA_Setup()

png(file = "./plot3.png", height = 480, width = 480)

with( tidyData,
      plot(Date, Sub_metering_1,
           type = "l",
           col = "black",
           ylab = "Energy sub metering",
           xlab = ""))
         
with( tidyData, lines(Date, Sub_metering_2, col = "red"))
with( tidyData, lines(Date, Sub_metering_3, col = "blue"))

legend("topright", 
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

dev.off()