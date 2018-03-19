library(readr)
library(dplyr)
household_power_consumption <- read_delim("~/Downloads/household_power_consumption.txt",";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), Time = col_time(format = "%H:%M:%S")), trim_ws = TRUE)

HH_Power_ConsumptionFILTERED <- filter(household_power_consumption, Date == "2007-02-01" | Date == "2007-02-02" )

HH_Power_ConsumptionFILTERED$DateTime <- as.POSIXct(paste(HH_Power_ConsumptionFILTERED$Date, HH_Power_ConsumptionFILTERED$Time))

#plot 2

#set par
par(mar = c(2, 4, 1, 1))
plot(HH_Power_ConsumptionFILTERED$DateTime,HH_Power_ConsumptionFILTERED$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
dev.print(png, "plot2.png", width = 480, height = 480)
dev.off()