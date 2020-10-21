# plot 4

# load data
pw_csmp <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

# merge date and time
TimeDate <- strptime(paste(pw_csmp$Date, pw_csmp$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
pw_csmp <- cbind(pw_csmp, TimeDate)

# change classes
pw_csmp$Date <- as.Date(pw_csmp$Date, format="%d/%m/%Y")
pw_csmp$Time <- format(pw_csmp$Time, format="%H:%M:%S")
pw_csmp$Global_active_power <- as.numeric(pw_csmp$Global_active_power)
pw_csmp$Global_reactive_power <- as.numeric(pw_csmp$Global_reactive_power)
pw_csmp$Voltage <- as.numeric(pw_csmp$Voltage)
pw_csmp$Global_intensity <- as.numeric(pw_csmp$Global_intensity)
pw_csmp$Sub_metering_1 <- as.numeric(pw_csmp$Sub_metering_1)
pw_csmp$Sub_metering_2 <- as.numeric(pw_csmp$Sub_metering_2)
pw_csmp$Sub_metering_3 <- as.numeric(pw_csmp$Sub_metering_3)

# subset data from 2007-02-01 and 2007-02-02
sub_pw <- subset(pw_csmp, Date == "2007-02-01" | Date =="2007-02-02")

# plot daily change of different types
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(sub_pw, plot(TimeDate, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
with(sub_pw, plot(TimeDate, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(sub_pw, plot(TimeDate, Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering"))
lines(sub_pw$TimeDate, sub_pw$Sub_metering_2, type = "l", col = "red")
lines(sub_pw$TimeDate, sub_pw$Sub_metering_3, type = "l", col = "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
with(sub_pw, plot(TimeDate, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()
