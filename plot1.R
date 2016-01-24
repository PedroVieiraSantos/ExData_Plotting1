
pow_con <- read.csv("household_power_consumption.txt",  sep = ";", stringsAsFactors=FALSE)
pow_con_2days <- subset(pow_con, Date %in% c("1/2/2007","2/2/2007"))
active_power <- as.numeric(pow_con_2days$Global_active_power)

png("plot1.png", width=480, height=480)
hist(active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
