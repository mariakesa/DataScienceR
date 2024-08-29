library(dplyr)
dat <- read.csv("femaleMiceWeights.csv")
dat
treatment<-dat%>%filter(Diet=="hf")%>%select(Bodyweight)%>%unlist%>%mean
treatment
control<-dat%>%filter(Diet=="chow")%>%select(Bodyweight)%>%unlist%>%mean
control
obsdiff<-treatment-control
obsdiff


library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- "femaleControlsPopulation.csv"
if (!file.exists(filename)) download(url,destfile=filename)
population <- read.csv(filename)
population <- unlist(population) # turn it into a numeric

control<-sample(population, 12)%>%mean
control

# Define a function to sample 12 individuals and calculate the mean
sample_mean <- function() {
  mean(sample(population, 12))
}

# Use sapply to repeat the sampling 100 times
sample_means <- sapply(1:100, function(x) sample_mean())

# Display the first few sample means
head(sample_means)
#Statisticians refer to this phenomenon as the null hypothesis.

n <- 10000
null <- vector("numeric",n)
for (i in 1:n) {
  control <- sample(population,12)
  treatment <- sample(population,12)
  null[i] <- mean(treatment) - mean(control)
}

mean(null >= obsdiff)

sample_mean<- function() {
    control <- sample(population,12)
    treatment <- sample(population,12)
    null <- mean(treatment) - mean(control)
}

null <- sapply(1:10000, function(x) sample_mean())
null
mean(null >= obsdiff)

#distributions
library(UsingR)
x <- father.son$fheight
x
hist(x, col = "lightblue", main = "Histogram of father's height", xlab = "Height (inches)")
