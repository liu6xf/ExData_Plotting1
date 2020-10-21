# plot 2

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

# plot daily change of global active power
png("plot2.png", width=480, height=480)
with(sub_pw, plot(TimeDate, Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
