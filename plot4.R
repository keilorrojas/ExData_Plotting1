# load file
data <- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?",
                 colClasses=c("character", "character", rep("numeric",7)))

# convert to times and dates class
data$Time <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# subset for specific dates
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)

# plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(data$Time, data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
plot(data$Time, data$Voltage, type="l",
     xlab="datetime", ylab="Voltage")
plot(data$Time, data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$Time, data$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

# save as png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
