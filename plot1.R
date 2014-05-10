hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";",na.strings="?" ,
                  stringsAsFactors=FALSE,
                  col.names = colnames(read.table(
                    "household_power_consumption.txt",
                    nrow = 1, header = TRUE, sep=";")))


#hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

hpc <- cbind(hpc, DateTime=paste(hpc$Date,hpc$Time, sep=" "))

hpc$DateTime <- strptime(hpc$DateTime, "%d/%m/%Y %H:%M:%S") 

#plot 1
png(filename ="plot1.png",width = 480, height = 480)
hist(hpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()