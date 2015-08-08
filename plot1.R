# Assumptions : The household_power_consumption.txt is in the working directory.
# Note        : Date in format dd/mm/yyyy

# Step-1: Reads the file, and removes missing values are coded as ?
fileName <- "household_power_consumption.txt"
classes <- c("character", "character", rep("numeric", 7))
myData <- read.table(fileName, header = TRUE, colClasses = classes, sep = ";", na.strings = "?")

# Step-2: Subset data from the dates 2007-02-01 and 2007-02-02. 
newData <- subset(myData, Date == "1/2/2007" | Date == "2/2/2007")
rm(myData)

# Step-3: Generate Plot 1
hist(newData$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     main = "Global Active Power") 

# Step-4: Saving to PNG file
dev.copy(png, file="plot1.png", height = 480, width = 480)
dev.off()






