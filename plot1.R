plot1 <- function(dir, filename) {
        powerData <- read.table(file = paste0(dir,"/", filename), header = TRUE, sep = ";", na.strings = "?")
        powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
        powerData$Time <- strptime(powerData$Time, "%H:%M:%S")
        
        subData <- powerData[powerData$Date >= "2007-02-01" & powerData$Date < "2007-02-03",]
        hist(subData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
        dev.copy(png, file = "plot1.png", width = 480, height = 480)
        dev.off()
}