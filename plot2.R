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

# Step-4: Generate Plot 2
plot(newData$dateTime, newData$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)") 

# Step-5: Saving to PNG file
dev.copy(png, file="plot2.png", height = 480, width = 480)
dev.off()
