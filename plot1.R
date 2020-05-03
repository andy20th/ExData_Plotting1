plot1<-function()
{
        # load data
        data <- read.table("/Users/Andreas/Desktop/R-Files/DataScienceSpec_Course4-ExploratoryDataAnalysis/Week1/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
        
        #subset table
        period<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
        
        #convert dates and times to R classes; NOT CONVERTED AS I PREFER THE ORIGINAL VERSION
        #period$Date<-as.Date(period$Date,"%m/%d/%y")
        #period$Time<-strptime(period$Time, "%H:%M:%S")
        
        #plot
        png("plot1.png", width = 480, height = 480)
        with(period, hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)", type="l"))
        dev.off()
}