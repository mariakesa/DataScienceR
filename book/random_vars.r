library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

all_mean<-mean(x)
sqrt(var(x))

set.seed(1)

mean_sample1<-mean(sample(x,5))

abs(mean_sample1-all_mean)

set.seed(5)

mean_sample2<-mean(sample(x,5))

abs(mean_sample2-all_mean)

set.seed(1)
n=1000
means<-vector("numeric",n)

for (i in 1:n) {
    means[i]<-mean(sample(x,5))
}

sum(abs(means-all_mean)>1)/n

set.seed(1)
n=10000
means<-vector("numeric",n)

for (i in 1:n) {
    means[i]<-mean(sample(x,5))
}

sum(abs(means-all_mean)>1)/n
