install.packages("dslabs")
library(dslabs)
library(dplyr)
data("heights")
h<-heights$height

hist(h,breaks=seq(floor(min(h)),ceiling(max(h)),1),col="lightblue",main="Histogram of father's height",xlab="Height (inches)")
