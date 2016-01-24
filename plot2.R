
pow_con <- read.csv("household_power_consumption.txt",  sep = ";", stringsAsFactors=FALSE)
pow_con_2days <- subset(pow_con, Date %in% c("1/2/2007","2/2/2007"))

date_time <- paste(pow_con_2days$Date, pow_con_2days$Time, sep = " ")
date_time <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

active_power <- as.numeric(pow_con_2days$Global_active_power)

png("plot2.png", width=480, height=480)
plot(date_time, active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()