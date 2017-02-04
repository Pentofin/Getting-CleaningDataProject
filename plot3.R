data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data2 <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
GAP <- as.numeric(data2$Global_active_power)
dt <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y%H:%M:%S") 

subM1 <- as.numeric(data2$Sub_metering_1)
subM2 <- as.numeric(data2$Sub_metering_2)
subM3 <- as.numeric(data2$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dt, subM1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, subM2, type="l", col="red")
lines(dt, subM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.8, col=c("black", "red", "blue"))
dev.off()