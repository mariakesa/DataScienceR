#install.packages("swirl")
#library(swirl)

vec<-c(2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23)
mean(vec)

my_sum<-0
for (i in 1:25){
    my_sum<-my_sum+i**2
}
my_sum

cars
class(cars)
length(cars[,1])
colnames(cars)
mean(cars[,2])
which(cars[,2]==85)
