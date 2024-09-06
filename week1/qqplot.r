install.packages("UsingR")
library(UsingR)
x <- father.son$fheight
x=father.son$fheight

mean(x>70)
1-pnorm(70,mean=mean(x),sd=sd(x))
pnorm(70,mean=mean(x),sd=sd(x),lower.tail=FALSE)
mean(x)
sd(x)
mean(x<70)
pnorm(70,mean=mean(x),sd=sd(x))

ps<-seq(0.01,0.99,0.01)
qs<-quantile(x,ps)
normalqs<-qnorm(ps,mean=mean(x),sd=sd(x))
plot(normalqs,qs,xlab="normal percentiles", ylab="height percentiles")
abline(0,1)

qqnorm(x)
qqline(x)


load("/home/maria/Documents/DataScienceR/week1/skew.RData")
dim(dat)
par(mfrow = c(3,3))
for (i in 1:9) {
    qqnorm(dat[,i])
    qqline(dat[,i])
}
