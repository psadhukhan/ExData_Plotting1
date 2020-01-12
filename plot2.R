library("data.table")

DT <- fread(input="household_power_consumption.txt", na.strings = "?")
DT <- DT[, FullDate := as.POSIXct(paste(Date, Time, sep = " "), 
                                  format = "%d/%m/%Y %H:%M:%S")]
DT <- DT[FullDate >= "2007-02-01" & FullDate <= "2007-02-03",]

png("plot2.png", width=480, height=480)
plot(x = DT[, FullDate], 
     y = DT[, Global_active_power], 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()


