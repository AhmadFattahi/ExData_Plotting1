
#Plot 3
#Reading the data

fulldf <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
mydf <- subset(fulldf, as.character(Date) %in% c("1/2/2007", "2/2/2007")) #Separating the dates of interest

#Converting Date and Time columns from text to PSIXct an dadding to the dataframe
mydf$fulltime <- paste(mydf$Date, mydf$Time)
mydf$fulltime <- as.POSIXct(mydf$fulltime, format = "%d/%m/%Y %H:%M:%S")

#Generating the plot on screen
dev.off()
par(mfcol = c(2,2), mar = c(4, 4, 3, 2))
#Plot 1, 1
with(mydf, plot(fulltime, Global_active_power, xlab = "", ylab = "Global Active Power", main = "", col = "black", type = "n"))
with(mydf, lines(fulltime, Global_active_power, xlab = "", ylab = "Global Active Power", main = "", col = "black"), type = "l", pch = 20)

#Plot 2, 1
with(mydf, plot(fulltime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = "", col = "black", type = "n"))
with(mydf, lines(fulltime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = "", col = "black"), type = "l", pch = 20)
with(mydf, lines(fulltime, Sub_metering_2, xlab = "", ylab = "Energy sub metering", main = "", col = "red"), type = "l", pch = 20)
with(mydf, lines(fulltime, Sub_metering_3, xlab = "", ylab = "Energy sub metering", main = "", col = "blue"), type = "l", pch = 20)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), text.col = "black", lty = c(1, 1, 1), bty = "n")

#Plot 1, 2
with(mydf, plot(fulltime, Voltage, xlab = "datetime", ylab = "Voltage", col = "black", type = "n"))
with(mydf, lines(fulltime, Voltage, xlab = "datetime", ylab = "Voltage", col = "black"))

#Plot 2, 2
with(mydf, plot(fulltime, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", col = "black", type = "n"))
with(mydf, lines(fulltime, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", col = "black"))


#Writing the same plot into the png file
png("plot4.png", width = 480, height = 480, units = "px")

par(mfcol = c(2,2), mar = c(4, 4, 3, 2))
#Plot 1, 1
with(mydf, plot(fulltime, Global_active_power, xlab = "", ylab = "Global Active Power", main = "", col = "black", type = "n"))
with(mydf, lines(fulltime, Global_active_power, xlab = "", ylab = "Global Active Power", main = "", col = "black"), type = "l", pch = 20)

#Plot 2, 1
with(mydf, plot(fulltime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = "", col = "black", type = "n"))
with(mydf, lines(fulltime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = "", col = "black"), type = "l", pch = 20)
with(mydf, lines(fulltime, Sub_metering_2, xlab = "", ylab = "Energy sub metering", main = "", col = "red"), type = "l", pch = 20)
with(mydf, lines(fulltime, Sub_metering_3, xlab = "", ylab = "Energy sub metering", main = "", col = "blue"), type = "l", pch = 20)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), text.col = "black", lty = c(1, 1, 1), bty = "n")

#Plot 1, 2
with(mydf, plot(fulltime, Voltage, xlab = "datetime", ylab = "Voltage", col = "black", type = "n"))
with(mydf, lines(fulltime, Voltage, xlab = "datetime", ylab = "Voltage", col = "black"))

#Plot 2, 2
with(mydf, plot(fulltime, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", col = "black", type = "n"))
with(mydf, lines(fulltime, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", col = "black"))

dev.off()