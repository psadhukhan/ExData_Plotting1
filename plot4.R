library("data.table")

DT <- fread(input="household_power_consumption.txt", na.strings = "?")
DT <- DT[, FullDate := as.POSIXct(paste(Date, Time, sep = " "), 
                                  format = "%d/%m/%Y %H:%M:%S")]
DT <- DT[FullDate >= "2007-02-01" & FullDate <= "2007-02-03",]

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

plot(x = DT[, FullDate], 
     y = DT[, Global_active_power], 
     type="l", 
     xlab="", 
     ylab="Global Active Power")


plot(x = DT[, FullDate], 
     y = DT[, Voltage], 
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

plot(x = DT[, FullDate], 
     y = DT[, Sub_metering_1],
     col = "black",
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(x = DT[, FullDate], 
      y = DT[, Sub_metering_2],
      col = "red")
lines(x = DT[, FullDate], 
      y = DT[, Sub_metering_3],
      col = "blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), 
       lty = c(1,1),
       bty = "n",
       cex = 0.4)

plot(x = DT[, FullDate], 
     y = DT[, Global_reactive_power], 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()

