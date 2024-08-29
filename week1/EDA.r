install.packages("UsingR")
library(UsingR)
x <- father.son$fheight
x=father.son$fheight
x
length(x)
round(sample(x,20),2)

hist(x,breaks=seq(floor(min(x)),ceiling(max(x))+2,2),col="lightblue",main="Histogram of father's height",xlab="Height (inches)")
?seq
length(seq(floor(min(x)),ceiling(max(x))))
seq(floor(min(x)),ceiling(max(x)),2)

xs<-seq(floor(min(x)),ceiling(max(x)),0.1)
plot(xs,ecdf(x)(xs),type="l",col="blue",main="Empirical CDF of father's height",xlab="Height (inches)",ylab="F(x)")
