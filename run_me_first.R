# Reads the large file household_power_consumption.txt,
# extracts data for 2007-02-01 and 2007-02-02,
# then saves the extracted data onto mydata.txt

mydata=""
isf=TRUE
d1=as.Date("01/02/2007","%d/%m/%Y")
d2=as.Date("02/02/2007","%d/%m/%Y")
con<-file("./household_power_consumption.txt",open="r")
while(length(myline<-readLines(con,n=1,warn=FALSE))>0){
  if(isf){
    mydata=paste(myline,"\n",sep="")
    isf=FALSE
  } else {
    temp1<-substring(myline,1,10)
    temp2=as.Date(strsplit(temp1,";")[[1]],"%d/%m/%Y")
    if(temp2==d1|temp2==d2) mydata<-paste(mydata,myline,"\n",sep="")
  }
}
close(con)
write(mydata,"mydata.txt")
