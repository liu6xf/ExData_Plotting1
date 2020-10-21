# plot 1

# loading data
pw_csmp <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

# changing classes
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

# plot histogram of global active power
png("plot1.png", width=480, height=480)
hist(sub_pw$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
