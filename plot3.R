# Set WD
#setwd("/Users/avlaplicativos/Google Drive/Coursera/Data Science/Exploratory Data Analysis")

# Load the data (only the lines corresponding to dates from 2007-02-01 to 2007-02-02)
dataPowerConsumption <- read.table("./household_power_consumption.txt", header = FALSE, skip = 66637, nrows = 2880, sep = ";")
names(dataPowerConsumption) <- c('date','time','globalActivePower','globalReactivePower','voltage','globalIntensity','subMetering1','subMetering2','subMetering3')
dataPowerConsumption$date <- as.Date(dataPowerConsumption$date, "%d/%m/%Y")
dataPowerConsumption$datetime <- strptime(paste(dataPowerConsumption$date, dataPowerConsumption$time), format = "%Y-%m-%d %H:%M:%S")

# System Locale
Sys.setlocale("LC_TIME", "en_US.UTF-8")

# Plot
png(filename = "plot3.png", width = 480, height = 480)
plot(dataPowerConsumption$datetime, as.numeric(as.character(dataPowerConsumption$subMetering1)), xlab = "", ylab = "Energy sub metering", type = "l")
lines(dataPowerConsumption$datetime, as.numeric(as.character(dataPowerConsumption$subMetering2)), col = "red")
lines(dataPowerConsumption$datetime, as.numeric(as.character(dataPowerConsumption$subMetering3)), col = "blue")
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty = c(1,1,1), col = c('black', 'red', 'blue'))
dev.off()