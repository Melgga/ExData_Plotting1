## 2 variables that set class and colnames for read.table
clcl<-(c("character", "character", rep("numeric",7)))
c_names<-colnames(read.table("household_power_consumption.txt",sep=";",
                             colClasses="character", nrow = 1,header=T)) 

## household_power_consumption.txt has to be in the working directory
cons<-read.table("household_power_consumption.txt",sep=";",na.strings="?",
                 colClasses=clcl,skip = 66637, nrow = 2880,col.names=c_names)
##vector of times for the x axis
d_t<-strptime(paste(cons$Date,cons$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
plot(d_t,cons$Global_active_power,ylab="Global Active Power",
     type="l",xlab="")
plot(d_t,cons[,5],ylab="Voltage", type="l",xlab="datetime")
plot(d_t,cons[,7],ylab="Energy sub metering",type="l",xlab="")
lines(d_t,cons[,8],type="l",col="red")
lines(d_t,cons[,9],type="l",col="blue")
legend("topright",                      #legend location  
       legend=c("Sub_metering_1", "Sub_metering_2",
                "Sub_metering_3"), #labels  
       col=c("black", "red", "blue"),   # Color of lines  
       cex=.9,                         # Size
       lty=c(1,1,1),                    # Line type  
       lwd=c(1,1,1),                     # Line width
       bty="n"
)
plot(d_t,cons[,4],ylab="Global_reactive_power", type="l",xlab="datetime")
dev.off()