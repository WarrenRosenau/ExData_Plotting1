# Script to create plot4.png
source("EDA_Setup.R")

# setup the tidy dataset
tidyData <- EDA_Setup()

png(file = "./plot4.png", height = 480, width = 480)
par(mfcol = c(2, 2))

################################################################################
# top left (from plot2)
#
with( tidyData,
      plot(Date,
           Global_active_power,
           type="l",
           ylab = "Global Active Power",
           xlab = ""))

################################################################################
# bottom left (from plot3)
#
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
       bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

################################################################################
# top right
#
with( tidyData,
      plot(Date,
           Voltage,
           type = "l",
           xlab = "datetime"))

################################################################################
# bottom right
#
with( tidyData,
      plot(Date,
           Global_reactive_power,
           type = "l",
           xlab = "datetime"))



# Close the file
dev.off()