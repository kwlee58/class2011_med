jpeg("USmelanoma_mortality.jpg",width=480,height=720)
#layout(matrix(1:2,nrow=2))
#hist(USmelanoma$mortality)
#boxplot(USmelanoma$mortality)
#boxplot(USmelanoma$mortality,horizontal=TRUE)
xr<-range(USmelanoma$mortality)*c(0.9,1.1)
layout(matrix(1:3,nrow=3))
#hist(USmelanoma$mortality,xlab="",main="")
#hist(USmelanoma$mortality,xlim=xr,xlab="",main="")
#hist(USmelanoma$mortality,xlim=xr,xlab="",main="",yaxt="n")
#hist(USmelanoma$mortality,xlim=xr,xlab="",main="",ylab="")
hist(USmelanoma$mortality,xlim=xr,xlab="",main="",yaxt="n",ylab="")
#hist(USmelanoma$mortality,xlim=xr,xlab="",main="",ylab="",axes=FALSE)
#boxplot(USmelanoma$mortality,horizontal=TRUE)
#boxplot(USmelanoma$mortality,horizontal=TRUE,xlab="Mortality")
boxplot(USmelanoma$mortality,ylim=xr,horizontal=TRUE,xlab="Mortality")
#plot(ecdf(USmelanoma$mortality))
plot(ecdf(USmelanoma$mortality),xlim=xr,xlab="",main="",ylab="",yaxt="n",pch=1)
#axis(side=2,at=c(0.25,0.5,0.75))
axis(side=2,at=c(0.25,0.5,0.75),labels=c("25%","50%","75%"))
abline(h=c(0.25,0.5,0.75),lty=2)
abline(v=quantile(USmelanoma$mortality,prob=c(0,0.25,0.5,0.75,1)),lty=2)
#axis(side=1,at=quantile(USmelanoma$mortality,prob=seq(0,1,by=0.25)))
#axis(side=1,at=quantile(USmelanoma$mortality,prob=seq(0,1,by=0.25)),labels=c("min","Q1","med","Q3","max"))
axis(side=1,at=quantile(USmelanoma$mortality,prob=seq(0,1,by=0.25)),labels=c("min","Q1","med","Q3","max"),line=2)
dev.off()