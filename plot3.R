library("data.table")

DT <- fread(input="household_power_consumption.txt", na.strings = "?")
DT <- DT[, FullDate := as.POSIXct(paste(Date, Time, sep = " "), 
                                  format = "%d/%m/%Y %H:%M:%S")]
DT <- DT[FullDate >= "2007-02-01" & FullDate <= "2007-02-03",]


png("plot3.png", width=480, height=480)
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
       cex = 0.5)
dev.off()
