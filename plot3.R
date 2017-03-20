
#Plot 3
#Reading the data

fulldf <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
mydf <- subset(fulldf, as.character(Date) %in% c("1/2/2007", "2/2/2007")) #Separating the dates of interest

#Converting Date and Time columns from text to PSIXct an dadding to the dataframe
mydf$fulltime <- paste(mydf$Date, mydf$Time)
mydf$fulltime <- as.POSIXct(mydf$fulltime, format = "%d/%m/%Y %H:%M:%S")

#Generating the plot on screen
dev.off()
with(mydf, plot(fulltime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = "", col = "black", type = "n"))
with(mydf, lines(fulltime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = "", col = "black"), type = "l", pch = 20)
with(mydf, lines(fulltime, Sub_metering_2, xlab = "", ylab = "Energy sub metering", main = "", col = "red"), type = "l", pch = 20)
with(mydf, lines(fulltime, Sub_metering_3, xlab = "", ylab = "Energy sub metering", main = "", col = "blue"), type = "l", pch = 20)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), text.col = "black", lty = c(1, 1, 1))

#Writing the same plot into the png file
png("plot3.png", width = 480, height = 480, units = "px")
with(mydf, plot(fulltime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = "", col = "black", type = "n"))
with(mydf, lines(fulltime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = "", col = "black"), type = "l", pch = 20)
with(mydf, lines(fulltime, Sub_metering_2, xlab = "", ylab = "Energy sub metering", main = "", col = "red"), type = "l", pch = 20)
with(mydf, lines(fulltime, Sub_metering_3, xlab = "", ylab = "Energy sub metering", main = "", col = "blue"), type = "l", pch = 20)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), text.col = "black", lty = c(1, 1, 1))

dev.off()