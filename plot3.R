
# plot3.R
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

# Create line plot with multiple lines
png("plot3.png", width=480, height=480)
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
dev.off()