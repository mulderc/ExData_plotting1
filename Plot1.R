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


#plot 1

#set par for both being a single plot and margins for the plot
par(mfrow = c(1,1))
par(mar = c(4, 4, 1, 1))
#Histogram plot
hist(HH_Power_ConsumptionFILTERED$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
#print to PNG
dev.print(png, "plot1.png", width = 480, height = 480)
dev.off()

