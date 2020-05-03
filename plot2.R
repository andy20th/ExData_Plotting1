plot2<-function()
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
        png("plot2.png", width = 480, height = 480)
        with(period, plot(DateTime,Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l"))
        dev.off()
}