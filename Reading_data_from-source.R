# Read the dataset for specific dates
data_file <- "household_power_consumption.txt"

# Read the first row to get column names
col_names <- read.table(data_file, sep=";", nrows=1, header=TRUE)

# Find rows for 2007-02-01 and 2007-02-02
# First, read only the Date column to identify rows
dates <- read.table(data_file, sep=";", colClasses=c("character", rep("NULL", 8)), header=TRUE)
target_dates <- which(dates$Date == "1/2/2007" | dates$Date == "2/2/2007")
start_row <- min(target_dates)
num_rows <- length(target_dates)

# Read only the required rows
data <- read.table(data_file, sep=";", skip=start_row, nrows=num_rows, na.strings="?",
                   col.names=names(col_names))

# Convert Date and Time to a single POSIXct column
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")


# plot1.R
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

# Create histogram
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()



