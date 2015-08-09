# Assumptions : The household_power_consumption.txt is in the working directory.
# Note        : Date in format dd/mm/yyyy

# Step-1: Reads the file, and removes missing values are coded as ?
fileName <- "household_power_consumption.txt"
classes <- c("character", "character", rep("numeric", 7))
myData <- read.table(fileName, header = TRUE, colClasses = classes, sep = ";", na.strings = "?")

# Step-2: Subset data from the dates 2007-02-01 and 2007-02-02. 
newData <- subset(myData, Date == "1/2/2007" | Date == "2/2/2007")
rm(myData)

# Step-3: Convert the Date and Time variables to Date/Time 
dateTime <- paste(newData$Date, newData$Time)
newData$dateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")

# Step-4: Control image dimensions 
png("plot3.png", width = 480, height = 480)

# Step-5: Generate Plot 3
plot(newData$dateTime, newData$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering") 

# Step-6: Add additional lines 
lines(newData$dateTime, newData$Sub_metering_2, type = "l", col = "red")
lines(newData$dateTime, newData$Sub_metering_3, type = "l", col = "blue")

# Step-7: Add the legends 
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()