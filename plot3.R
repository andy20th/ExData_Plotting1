plot3<-function()
{
        # load data
        data <- read.table("/Users/Andreas/Desktop/R-Files/DataScienceSpec_Course4-ExploratoryDataAnalysis/Week1/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
        
        #subset table
        period<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
        
        
        #convert dates and times to R classes; 
        period$Date<-as.Date(period$Date,"%d/%m/%Y")
        #period$Time<-strptime(period$Time, "%H:%M:%S")
        
        period$DateTime <- as.POSIXct(paste(period$Date, period$Time))
        View(period)
        
        #plot
        png("plot3.png", width = 480, height = 480)
        plot(period$DateTime,period$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
        lines(period$DateTime,period$Sub_metering_2,type="l",col="red")
        lines(period$DateTime,period$Sub_metering_3,type="l",col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
        dev.off()
}