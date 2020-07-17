x <- readline()
##C:\Users\sreel\Downloads\Data Science Data\ExploratoryDataAnalysis -- Replace working directory here
setwd(x)


##getting the raw data
rawData <- read.table('household_power_consumption.txt', sep = ";",header = TRUE)

##Formatting the Date column
rawData$Date <- as.Date(as.character(rawData$Date), "%d/%m/%Y")

##Getting 1st FEb 2007 and 2nd Feb 2007 data
rawData <- subset(rawData, (Date >= as.Date('2007/02/01') & (Date <= as.Date('2007/02/02'))))

##Opening graphic device
dev.new(width = 480,height= 480, unit = "px")
##Plotting the first plot
hist(as.numeric(rawData$Global_active_power), col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

##closing the connetion
dev.off()
