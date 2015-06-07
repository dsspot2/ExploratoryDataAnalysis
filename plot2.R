plot2 <- function(dir, filename) {
        powerData <- read.table(file = paste0(dir,"/", filename), header = TRUE, sep = ";", na.strings = "?")
        powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
        powerData$Time <- strptime(paste0(powerData$Date," ",powerData$Time), "%Y-%m-%d %H:%M:%S")
        
        subData <- powerData[powerData$Date >= "2007-02-01" & powerData$Date < "2007-02-03",]
        with(subData, plot(Time, Global_active_power,  xlab = "datetime", ylab = "Global Active Power (kilowatts)", type = "n"))
        with(subData, lines(Time, Global_active_power))
        dev.copy(png, file= "plot2.png", width = 480, height = 480)
        dev.off()
}