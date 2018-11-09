library(lubridate)
myt<-read.table("./mydata.txt",header=TRUE,sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
plot(dmy_hms(paste(myt[,1],myt[,2],sep=" ")),myt[,7],main="",ylab="Energy sub metering",xlab="",type="l",col="black")
lines(dmy_hms(paste(myt[,1],myt[,2],sep=" ")),myt[,8],col="red")
lines(dmy_hms(paste(myt[,1],myt[,2],sep=" ")),myt[,9],col="blue")
legend("topright",names(myt)[7:9],col=c("black","red","blue"),lwd=c(1,1,1),text.width = strwidth("Sub_metering_xxxxxxxxxxxxx")) #need to add some x'es for nice PNG plot
unlink("./plot3.png") #need to delete since fails to overwrite in next step (Linux Debian 9)
dev.copy(png,filename="./plot3.png",width=480,height=480)
dev.off()
