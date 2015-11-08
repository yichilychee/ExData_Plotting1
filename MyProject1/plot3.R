data <- read.table("household_power_consumption.txt", sep=";", header=T)
Times <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
data$Times <- Times
data$Date <- as.Date(data$Date, "%d/%m/%Y")

newdata <- data
newdata <- subset(newdata, newdata$Date == "2007-02-01" | newdata$Date == "2007-02-02")
newdata$Global_active_power <- as.numeric(as.character(newdata$Global_active_power))

newdata$Sub_metering_1 <- as.numeric(as.character(newdata$Sub_metering_1))
newdata$Sub_metering_2 <- as.numeric(as.character(newdata$Sub_metering_2))
newdata$Sub_metering_3 <- as.numeric(as.character(newdata$Sub_metering_3))
png(file="plot3.png", width = 480, height = 480, bg="white")
plot(newdata$Times, newdata$Sub_metering_1, type="n", ylab="Energy Sub Metering", xlab="")
lines(newdata$Times, newdata$Sub_metering_1, col="black")
lines(newdata$Times, newdata$Sub_metering_2, col="red")
lines(newdata$Times, newdata$Sub_metering_3, col="blue")
legend("topright", lty=1, cex=0.8, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
