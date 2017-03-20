
#Plot 2
#Reading the data

fulldf <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
mydf <- subset(fulldf, as.character(Date) %in% c("1/2/2007", "2/2/2007")) #Separating the dates of interest

#Converting Date and Time columns from text to PSIXct an dadding to the dataframe
mydf$fulltime <- paste(mydf$Date, mydf$Time)
mydf$fulltime <- as.POSIXct(mydf$fulltime, format = "%d/%m/%Y %H:%M:%S")

#Generating the plot on screen
dev.off()
with(mydf, plot(fulltime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", main = "", col = "black", type = "n"))
with(mydf, lines(fulltime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", main = "", col = "black"), type = "l", pch = 20)

#Writing the same plot into the png file
png("plot2.png", width = 480, height = 480, units = "px")
with(mydf, plot(fulltime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", main = "", col = "black", type = "n"))
with(mydf, lines(fulltime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", main = "", col = "black"), type = "l", pch = 20)
dev.off()