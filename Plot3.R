#Going to use a couple libraries to make things easier
library(readr) #best way to read in the data, i think
library(dplyr) #useful for filtering data
#URL for the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#Downloading to local zip !!Don't upload zip to github as it is big!!
download.file(fileUrl, destfile = "./data.zip", method = "curl")
#reading in date
household_power_consumption <- read_delim("data.zip",";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), Time = col_time(format = "%H:%M:%S")), trim_ws = TRUE)
#filtering data down to just days we need
HH_Power_ConsumptionFILTERED <- filter(household_power_consumption, Date == "2007-02-01" | Date == "2007-02-02" )
#adding combined date&time variable
HH_Power_ConsumptionFILTERED$DateTime <- as.POSIXct(paste(HH_Power_ConsumptionFILTERED$Date, HH_Power_ConsumptionFILTERED$Time))


#plot 
png(filename = "plot3.png", width = 480, height = 480)
par(mfrow = c(1,1))
plot(HH_Power_ConsumptionFILTERED$DateTime,HH_Power_ConsumptionFILTERED$Sub_metering_1, type = "l", col = "green", xlab = "", ylab = "Energy sub metering")
lines(HH_Power_ConsumptionFILTERED$DateTime,HH_Power_ConsumptionFILTERED$Sub_metering_2, type = "l", col = "red")
lines(HH_Power_ConsumptionFILTERED$DateTime,HH_Power_ConsumptionFILTERED$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_mettering_1","Sub_mettering_2", "Sub_mettering_3"), lty=c(1,1), lwd=c(2,2,2),col=c("green", "red", "blue"), cex = .9, inset = 0)
#dev.print(png, "plot3.png", width = 480, height = 480)
dev.off()

