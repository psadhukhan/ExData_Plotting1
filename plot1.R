library("data.table")

DT <- fread(input="household_power_consumption.txt", na.strings = "?")
DT$Date <- as.Date(DT$Date, "%d/%m/%Y")
DT <- DT[Date >= "2007-02-01" & Date <= "2007-02-02",]

png("plot1.png", width=480, height=480)
hist(DT[, Global_active_power], main = "Global Active Power", 
                                 xlab="Global Active Power (kilowatts)", 
                                 col = "red")
dev.off()