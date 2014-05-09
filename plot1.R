## 2 variables that set class and colnames for read.table
clcl<-(c("character", "character", rep("numeric",7)))
c_names<-colnames(read.table("household_power_consumption.txt",sep=";",
                    colClasses="character", nrow = 1,header=T)) 

## household_power_consumption.txt has to be in the working directory
cons<-read.table("household_power_consumption.txt",sep=";",na.strings="?",
                 colClasses=clcl,skip = 66637, nrow = 2880,col.names=c_names)

##creting the histogram on png file
png(filename = "plot1.png",width = 480, height = 480)
hist(cons$Global_active_power,main="Global Active Power",col=2,
     xlab="Global Active Power (kilowatts)")
dev.off()


