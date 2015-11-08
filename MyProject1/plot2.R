data <- read.table("household_power_consumption.txt", sep=";", header=T)
Times <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
data$Times <- Times
data$Date <- as.Date(data$Date, "%d/%m/%Y")

newdata <- data
newdata <- subset(newdata, newdata$Date == "2007-02-01" | newdata$Date == "2007-02-02")
newdata$Global_active_power <- as.numeric(as.character(newdata$Global_active_power))

png(file="plot2.png", width = 480, height = 480, bg="white")
plot(newdata$Times, newdata$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(newdata$Times, newdata$Global_active_power)
dev.off()
