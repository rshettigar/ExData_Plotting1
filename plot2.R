# Read the file from current directory
data_all <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

# Subset the data for specific date range
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Data for plotting
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
globalActivePower <- as.numeric(data$Global_active_power)

# Construct the plot in PNG format
png("plot2.png", width=480, height=480)
plot(data$Datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()