
clcl<-(c("character", "character", rep("numeric",7)))
c_names<-colnames(read.table("household_power_consumption.txt",sep=";",
                    colClasses="character", nrow = 1,header=T)) 

cons<-read.table("household_power_consumption.txt",sep=";",na.strings="?",
                 colClasses=clcl,skip = 66637, nrow = 2880,col.names=c_names)
d_t<-strptime(paste(cons$Date,cons$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png",width = 480, height = 480)
plot(d_t,cons[,7],ylab="Energy sub metering",type="l",xlab="")
lines(d_t,cons[,8],type="l",col="red")
lines(d_t,cons[,9],type="l",col="blue")
legend("topright",                      #legend location  
       legend=c("Sub_metering_1", "Sub_metering_2",
                "Sub_metering_3"), #labels  
       col=c("black", "red", "blue"),   # Color of lines  
       cex=.9,                         # Size
       lty=c(1,1,1),                    # Line type  
       lwd=c(1,1,1)                     # Line width  
)
dev.off()


