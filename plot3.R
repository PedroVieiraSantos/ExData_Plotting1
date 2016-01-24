
pow_con <- read.csv("household_power_consumption.txt",  sep = ";", stringsAsFactors=FALSE)
pow_con_2days <- subset(pow_con, Date %in% c("1/2/2007","2/2/2007"))

date_time <- paste(pow_con_2days$Date, pow_con_2days$Time, sep = " ")
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

sub_met_1 <- as.numeric(pow_con_2days$Sub_metering_1)
sub_met_2 <- as.numeric(pow_con_2days$Sub_metering_2)
sub_met_3 <- as.numeric(pow_con_2days$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(date_time, sub_met_1, type="l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(date_time, sub_met_2, type="l", col="red")
lines(date_time, sub_met_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
