# load file
data <- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?",
                 colClasses=c("character", "character", rep("numeric",7)))

# convert to times and dates class
data$Time <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# subset for specific dates
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)

# plot 1
hist(data$Global_active_power, main="Global Acive Power", 
     xlab="Global Active Power(kilowatts)", 
     ylab="Frequency", col="Red")

# save as png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
