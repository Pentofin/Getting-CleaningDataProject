data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data2 <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
GAP <- as.numeric(data2$Global_active_power)
dt <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y%H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(dt, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()