library(lubridate)
myt<-read.table("./mydata.txt",header=TRUE,sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
par(mfrow=c(2,2))
plot(dmy_hms(paste(myt[,1],myt[,2],sep=" ")),myt[,3],main="",ylab="Global Active Power",xlab="",type="l")
plot(dmy_hms(paste(myt[,1],myt[,2],sep=" ")),myt[,5],main="",ylab="Voltage",xlab="datetime",type="l")
plot(dmy_hms(paste(myt[,1],myt[,2],sep=" ")),myt[,7],main="",ylab="Energy sub metering",xlab="",type="l",col="black")
lines(dmy_hms(paste(myt[,1],myt[,2],sep=" ")),myt[,8],col="red")
lines(dmy_hms(paste(myt[,1],myt[,2],sep=" ")),myt[,9],col="blue")
legend("topright",names(myt)[7:9],col=c("black","red","blue"),lwd=c(1,1,1),text.width = strwidth("Sub_metering_xxxxxxxxxxxxx")) #need to add some x'es for nice PNG plot
plot(dmy_hms(paste(myt[,1],myt[,2],sep=" ")),myt[,4],main="",ylab=names(myt)[4],xlab="datetime",type="l",col="black")
unlink("./plot4.png") #need to delete since fails to overwrite in next step (Linux Debian 9)
dev.copy(png,filename="./plot4.png",width=480,height=480)
dev.off()
par(mfrow=c(1,1)) #restore to no subplots
