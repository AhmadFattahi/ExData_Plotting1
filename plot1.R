
#Plot 1
#Reading the data

fulldf <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
mydf <- subset(fulldf, as.character(Date) %in% c("1/2/2007", "2/2/2007")) #Separating the dates of interest

#Generating the plot on screen
with(mydf, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red"))

#Writing the same plot into the png file
png("plot1.png", width = 480, height = 480, units = "px")
with(mydf, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red"))
dev.off()