## 2 variables that set class and colnames for read.table
clcl<-(c("character", "character", rep("numeric",7)))
c_names<-colnames(read.table("household_power_consumption.txt",sep=";",
                    colClasses="character", nrow = 1,header=T)) 

## household_power_consumption.txt has to be in the working directory
cons<-read.table("household_power_consumption.txt",sep=";",na.strings="?",
                 colClasses=clcl,skip = 66637, nrow = 2880,col.names=c_names)
##vector of times for the x axis
d_t<-strptime(paste(cons$Date,cons$Time), "%d/%m/%Y %H:%M:%S")

##creting the histogram on png file
png(filename = "plot2.png",width = 480, height = 480)
plot(d_t,cons$Global_active_power,ylab="Global Active Power (kilowatts)",
     type="l",xlab="")
dev.off()



