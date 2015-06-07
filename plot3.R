plot3 <- function(dir, filename) {
        powerData <- read.table(file = paste0(dir,"/", filename), header = TRUE, sep = ";", na.strings = "?")
        powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
        powerData$Time <- strptime(paste0(powerData$Date," ",powerData$Time), "%Y-%m-%d %H:%M:%S")
        
        subData <- powerData[powerData$Date >= "2007-02-01" & powerData$Date < "2007-02-03",]
        with(subData, plot(Time, Sub_metering_1, xlab = "datetime", ylab = "Enery sub metering", type = "n"))
        with(subData, lines(Time, Sub_metering_1, col = "black"))
        with(subData, lines(Time, Sub_metering_2, col = "red"))
        with(subData, lines(Time, Sub_metering_3, col = "blue"))
        legend("topright", pch = "___", pt.cex=1, cex=0.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.copy(png, file= "plot3.png", width = 480, height = 480)
        dev.off()
}