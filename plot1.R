# Read the file from current directory
data_all <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

# Subset the data for specific date range
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Data for plotting
globalActivePower <- as.numeric(data$Global_active_power)

# Construct the plot in PNG format
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()