library(readr)
library(dplyr)
household_power_consumption <- read_delim("~/Downloads/household_power_consumption.txt",";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), Time = col_time(format = "%H:%M:%S")), trim_ws = TRUE)

HH_Power_ConsumptionFILTERED <- filter(household_power_consumption, Date == "2007-02-01" | Date == "2007-02-02" )

HH_Power_ConsumptionFILTERED$DateTime <- as.POSIXct(paste(HH_Power_ConsumptionFILTERED$Date, HH_Power_ConsumptionFILTERED$Time))


#plot 1

#set par 
par(mar = c(4, 4, 1, 1))
hist(HH_Power_ConsumptionFILTERED$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.print(png, "plot1.png", width = 480, height = 480)
dev.off()

#plot 2

#set par
par(mar = c(2, 4, 1, 1))
plot(HH_Power_ConsumptionFILTERED$DateTime,HH_Power_ConsumptionFILTERED$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
dev.print(png, "plot2.png", width = 480, height = 480)
dev.off()

#plot 3
plot(HH_Power_ConsumptionFILTERED$DateTime,HH_Power_ConsumptionFILTERED$Sub_metering_1, type = "l", col = "green", xlab = "", ylab = "Energy sub metering")
lines(HH_Power_ConsumptionFILTERED$DateTime,HH_Power_ConsumptionFILTERED$Sub_metering_2, type = "l", col = "red")
lines(HH_Power_ConsumptionFILTERED$DateTime,HH_Power_ConsumptionFILTERED$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_mettering_1","Sub_mettering_2", "Sub_mettering_3"), lty=c(1,1), lwd=c(2,2,2),col=c("green", "red", "blue"), cex = .75, inset = 0)
dev.print(png, "plot3.png", width = 480, height = 480)
dev.off()

#plot 4
#png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
par(mar = c(4, 4, 1, 1))
plot(HH_Power_ConsumptionFILTERED$DateTime,HH_Power_ConsumptionFILTERED$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(HH_Power_ConsumptionFILTERED$DateTime,HH_Power_ConsumptionFILTERED$Voltage, type = "l", ylab = "Voltage", xlab = "Datetime")
plot(HH_Power_ConsumptionFILTERED$DateTime,HH_Power_ConsumptionFILTERED$Sub_metering_1, type = "l", col = "green", xlab = "", ylab = "Energy sub metering")
lines(HH_Power_ConsumptionFILTERED$DateTime,HH_Power_ConsumptionFILTERED$Sub_metering_2, type = "l", col = "red")
lines(HH_Power_ConsumptionFILTERED$DateTime,HH_Power_ConsumptionFILTERED$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_mettering_1","Sub_mettering_2", "Sub_mettering_3"), lty=c(1,1), lwd=c(2,2,2),col=c("green", "red", "blue"), cex = .7, inset = 0, bty = "n")
plot(HH_Power_ConsumptionFILTERED$DateTime,HH_Power_ConsumptionFILTERED$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "Datetime")
dev.print(png, "plot4.png", width = 480, height = 480)
dev.off()
