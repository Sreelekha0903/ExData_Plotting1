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

##Opening graphic device
dev.new(width = 480,height= 480, unit = "px")

##Plotting the fourth plot
par(mfrow = c(2,2))
##First sub plot
plot(as.POSIXct(DataForPlot2$DateTimeCol), DataForPlot2$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

##Second sub plot
plot(as.POSIXct(DataForPlot2$DateTimeCol), DataForPlot2$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

##Third plot
with(DataForPlot2 , plot(as.POSIXct(DateTimeCol), Sub_metering_1, type = "l" , ylab = "Energy sub metering", xlab = ""))
with(DataForPlot2, lines(as.POSIXct(DateTimeCol), Sub_metering_2, type = "l", col = "red"))
with(DataForPlot2, lines(as.POSIXct(DateTimeCol), Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red", "blue") , lty = 1, bty = "n")

##Fourth sub plot
plot(as.POSIXct(DataForPlot2$DateTimeCol), DataForPlot2$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

##closing the connetion
dev.off()
