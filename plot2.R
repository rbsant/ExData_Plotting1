hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";",na.strings="?" ,
                  stringsAsFactors=FALSE,
                  col.names = colnames(read.table(
                    "household_power_consumption.txt",
                    nrow = 1, header = TRUE, sep=";")))


#hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

hpc <- cbind(hpc, DateTime=paste(hpc$Date,hpc$Time, sep=" "))

hpc$DateTime <- strptime(hpc$DateTime, "%d/%m/%Y %H:%M:%S") 

#plot 2
png(filename ="plot2.png",width = 480, height = 480)
plot(hpc$DateTime,hpc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()