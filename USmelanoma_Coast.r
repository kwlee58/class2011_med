#attach(USmelanoma)
dyes<-density(mortality[ocean=="yes"])
dno<-density(mortality[ocean=="no"])
xr<-range(mortality)*c(0.9,1.1)
yr<-c(0,max(c(max(dyes$y),max(dno$y)))*1.1)
#jpeg("USmelanoma_Coast.jpg",width=480,height=720)
layout(matrix(1:3,nrow=3))
plot(mortality~ocean,xlab="Contiguity to an ocean",ylab="Mortality",ylim=xr,horizontal=TRUE,varwidth=TRUE)
plot(dyes,xlim=xr,ylim=yr,main="",xlab="Mortality")
lines(dno,lty=2)
legend("topright",c("Coastal State","Land State"),lty=1:2,bty="n")
plot(ecdf(mortality[ocean=="yes"]),xlim=xr,main="",xlab="Mortality",ylab="Cumulative Percentage",yaxt="n",pch=1)
lines(ecdf(mortality[ocean=="no"]),pch=2)
abline(h=seq(0,1,0.25),lty=2)
axis(side=2,at=seq(0,1,0.25),labels=paste(seq(0,100,25),"%", sep=""))
legend("topleft",c("Coastal State","Land State"),pch=1:2,bty="n")
#legend(x=77,y=0.95,c("Coastal State","Land State"),pch=1:2,bty="n")
#dev.off()
#detach(USmelanoma)