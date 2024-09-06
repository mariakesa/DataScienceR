library(dplyr)

filename <- "/home/maria/Documents/DataScienceR/femaleMiceWeights.csv"
dat<-read.csv(filename)
colnames(dat)
control<-filter(dat, Diet=="chow") %>% dplyr::select(Bodyweight) %>% unlist
treatment<-filter(dat, Diet=="hf") %>% dplyr::select(Bodyweight) %>% unlist

mean(control)
mean(treatment)

obs<-mean(treatment)-mean(control)

t.test(control,treatment)

population<-read.csv("/home/maria/Documents/DataScienceR/femaleControlsPopulation.csv")
population<-unlist(population)

mean<-mean(population)

s<-sample(population,12)
mean(s)

mean(p)

set.seed(5)
s<-sample(population,5)
abs(mean(s)-mean)

set.seed(7)


# Define the function to calculate the sample mean
sample_mean <- function(n, population) {
  sample_data <- sample(population, n)
  mean(sample_data)
}

par(mfrow = c(1,1))
# Number of samples to take in each iteration
n <- 5

# Use replicate to generate 10,000 sample means
means_array <- replicate(10000, sample_mean(n, population))

# Check the result
head(means_array)

hist(means_array, breaks = 50, col = "lightblue", main = "Histogram of Sample Means", xlab = "Sample Mean")
abline(v = mean(treatment), col = "red", lwd = 2, lty = 2)
obs
mean(treatment)
sum(means_array > mean(treatment))/10000
mean(means_array)-mean(treatment)
qqnorm(means_array)
qqline(means_array)
normalized <- (means_array - mean(means_array)) / (sd(means_array))

# Plot and check standard deviation
hist(normalized)
sd(normalized)

normalized <- sqrt(5)*(means_array - mean(population)) / (sd(population))

# Plot and check standard deviation
hist(normalized)
sd(normalized)

1-pnorm(sqrt(5)*(mean(treatment)-mean(population))/sd(population))
sqrt(5)*(mean(treatment)-mean(population))/sd(population)

1-pnorm((mean(treatment)-mean(means_array))/sd(means_array))

population
#Null hypothesis is true, no high fat diet effect
#They are coming from the same population
control_mice<-sample(population,12)
treatment_mice<-sample(population,12)
mean(treatment_mice)-mean(control_mice)

m<-10000
nulls<-vector("numeric",m)
for(i in 1:m){
    control_mice<-sample(population,12)
    treatment_mice<-sample(population,12)
    nulls[i]<-mean(treatment_mice)-mean(control_mice)
}
nulls
max(nulls)
normalized_diffs<-(nulls-mean(nulls))/sd(nulls)
hist(normalized_diffs)
normalized_obs<-(obs-mean(nulls))/sd(nulls)
dnorm(normalized_obs)
1-pnorm(normalized_obs)

hist(nulls)
sum(nulls>obs) /m
mean(abs(nulls)>obs)

set.seed(1)

vec<-vector("numeric",1000)
for (i in 1:1000){
    vec[i]<-mean(sample(population,5))}
mean(abs(vec-mean(population))>1)
set.seed(1)

vec<-vector("numeric",10000)
for (i in 1:10000){
    vec[i]<-mean(sample(population,5))}
mean(abs(vec-mean(population))>1)
