
# plot4.R
# Load data
data_file <- "household_power_consumption.txt"
col_names <- read.table(data_file, sep=";", nrows=1, header=TRUE)
dates <- read.table(data_file, sep=";", colClasses=c("character", rep("NULL", 8)), header=TRUE)
target_dates <- which(dates$Date == "1/2/2007" | dates$Date == "2/2/2007")
start_row <- min(target_dates)
num_rows <- length(target_dates)
data <- read.table(data_file, sep=";", skip=start_row, nrows=num_rows, na.strings="?",
                   col.names=names(col_names))
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Create 2x2 plot grid
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# Top-left: Global Active Power
plot(data$DateTime, data$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

# Top-right: Voltage
plot(data$DateTime, data$Voltage, type="l", xlab="Datetime", ylab="Voltage")

# Bottom-left: Sub-metering
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty="n")

# Bottom-right: Global Reactive Power
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="Datetime",
     ylab="Global_reactive_power")

dev.off()