filename <- "femaleMiceWeights.csv" 
dat<-read.csv(filename)
colnames(dat)
dat[12,2]
dat$Bodyweight[11]

length(dat[,1])
dat
mean(dat[seq(13,24),2])

set.seed(1)
sample(seq(13,24),1)

dat[,2][21]
