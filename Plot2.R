x <- readline()
##C:\Users\sreel\Downloads\Data Science Data\ExploratoryDataAnalysis -- Replace working directory here
setwd(x)


##getting the raw data
rawData <- read.table('household_power_consumption.txt', sep = ";",header = TRUE)

##Formatting the Date column
rawData$Date <- as.Date(as.character(rawData$Date), "%d/%m/%Y")

##Getting 1st FEb 2007 and 2nd Feb 2007 data
rawData <- subset(rawData, (Date >= as.Date('2007/02/01') & (Date <= as.Date('2007/02/02'))))

##Creating a new column merging date and time column
DataForPlot2$DateTimeCol <- paste(DataForPlot2$Date,DataForPlot2$Time, sep = " ")


##Plotting the second plot
plot(as.POSIXct(DataForPlot2$DateTimeCol), DataForPlot2$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
