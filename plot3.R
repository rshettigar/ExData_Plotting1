# Read the file from current directory
data_all <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

# Subset the data for specific date range
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Data for plotting
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
globalActivePower <- as.numeric(data$Global_active_power)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

# Construct the plot in PNG format
png("plot3.png", width=480, height=480)
plot(data$Datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Datetime, subMetering2, type="l", col="red")
lines(data$Datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()