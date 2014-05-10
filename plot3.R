hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";",na.strings="?" ,
                  stringsAsFactors=FALSE,
                  col.names = colnames(read.table(
                    "household_power_consumption.txt",
                    nrow = 1, header = TRUE, sep=";")))


#hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

hpc <- cbind(hpc, DateTime=paste(hpc$Date,hpc$Time, sep=" "))

hpc$DateTime <- strptime(hpc$DateTime, "%d/%m/%Y %H:%M:%S") 

#plot 3
png(filename ="plot3.png",width = 480, height = 480)
plot(hpc$DateTime,hpc$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="" )
points(hpc$DateTime, hpc$Sub_metering_1, type="l")
points(hpc$DateTime, hpc$Sub_metering_2, type="l",col="red")
points(hpc$DateTime, hpc$Sub_metering_3, type="l",col="purple")
legend("topright",lwd=1, col = c("black","red","purple"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()