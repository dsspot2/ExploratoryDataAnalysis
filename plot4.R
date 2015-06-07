plot4 <- function(dir, filename) {
        powerData <- read.table(file = paste0(dir,"/", filename), header = TRUE, sep = ";", na.strings = "?")
        powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
        powerData$Time <- strptime(paste0(powerData$Date," ",powerData$Time), "%Y-%m-%d %H:%M:%S")
        
        subData <- powerData[powerData$Date >= "2007-02-01" & powerData$Date < "2007-02-03",]
        par(mfrow = c(2,2))
        with(subData, plot(Time, Global_active_power,  xlab = "datetime", ylab = "Global Active Power (kilowatts)", type = "n"))
        with(subData, lines(Time, Global_active_power))
        with(subData, plot(Time, Voltage,  xlab = "datetime", ylab = "Voltage", type = "n"))
        with(subData, lines(Time, Voltage))
        with(subData, plot(Time, Sub_metering_1, xlab = "datetime", ylab = "Enery sub metering", type = "n"))
        with(subData, lines(Time, Sub_metering_1, col = "black"))
        with(subData, lines(Time, Sub_metering_2, col = "red"))
        with(subData, lines(Time, Sub_metering_3, col = "blue"))
        legend("topright", pch = "___", pt.cex=1, cex=0.5, box.lwd = 0, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        with(subData, plot(Time, Global_reactive_power,  xlab = "datetime", ylab = "Global_reactive_power", type = "n"))
        with(subData, lines(Time, Global_reactive_power))
        dev.copy(png, file= "plot4.png", width = 480, height = 480)
        dev.off()
}