
pow_con <- read.csv("household_power_consumption.txt",  sep = ";", stringsAsFactors=FALSE)
pow_con_2days <- subset(pow_con, Date %in% c("1/2/2007","2/2/2007"))

date_time <- paste(pow_con_2days$Date, pow_con_2days$Time, sep = " ")
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

active_power   <- as.numeric(pow_con_2days$Global_active_power)
reactive_power <- as.numeric(pow_con_2days$Global_reactive_power)
voltage        <- as.numeric(pow_con_2days$Voltage)
sub_met_1      <- as.numeric(pow_con_2days$Sub_metering_1)
sub_met_2      <- as.numeric(pow_con_2days$Sub_metering_2)
sub_met_3      <- as.numeric(pow_con_2days$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2))

plot(date_time, active_power, type="l", xlab="", ylab="Global Active Power")

plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, sub_met_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(date_time, sub_met_2, type="l", col="red")
lines(date_time, sub_met_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"), bty="n")

plot(date_time, reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
