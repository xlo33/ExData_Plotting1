df <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
df1 <- subset(df, Date %in% c("1/2/2007","2/2/2007"))
df1$Date <- as.Date(df1$Date, order = "dmy")
df1$Time <- strptime(df1$Time, "%H:%M:%S")
## plot 1
png("plot1.png", width=480, height=480)
hist(df1$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylim = c(0,1200))
dev.off()
## plot 2
png("plot2.png", width=480, height=480)
plot(df1$Time,df1$Global_active_power,
     type="l",
     xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
## plot 3
png("plot3.png", width=480, height=480)
plot(df1$Time,df1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(df1,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(df1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(df1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1",
                                                         "Sub_metering_2","Sub_metering_3"), cex = 0.4)

dev.off()
## plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(df1,{
        plot(df1$Time,as.numeric(as.character(df1$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
        plot(df1$Time,as.numeric(as.character(df1$Voltage)), type="l",xlab="datetime",ylab="Voltage")
        plot(df1$Time,df1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
        with(df1,lines(Time,as.numeric(as.character(Sub_metering_1))))
        with(df1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
        with(df1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
        legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.2)
        plot(df1$Time,as.numeric(as.character(df1$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()