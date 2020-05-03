plot4<-function()
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
        
        #open graphics device
        png("plot4.png", width = 480, height = 480)
        #setup plot window
        par(mfcol=c(2,2),mar=c(5,4,2,1),oma=c(0,0,0,0))
        #plot1
        with(period, plot(DateTime,Global_active_power,ylab="Global Active Power",xlab="",type="l"))
        #plot2
        plot(period$DateTime,period$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
        lines(period$DateTime,period$Sub_metering_2,type="l",col="red")
        lines(period$DateTime,period$Sub_metering_3,type="l",col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
        #plot3
        with(period, plot(DateTime,Voltage,ylab="Voltage",xlab="datetime",type="l"))
        #plot4
        with(period, plot(DateTime,Global_reactive_power,xlab="datetime",type="l"))
        #close graphics device
        dev.off()
}