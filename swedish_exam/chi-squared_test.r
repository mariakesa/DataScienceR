
theoretical<-c(36.8,36.8, 18.4,8.05)
observed<-c(38,33,26,3)
data <- data.frame(observed,theoretical)
data <- table(observed,theoretical)
chi_result <- chisq.test(data)
print(chi_result)
#Sture is wrong at rejecting the null hypothesis at this level
#Chi-Squared Goodness of Fit Test: This test checks whether an observed distribution matches an expected distribution. It's used to determine if a sample comes from a population with a specific distribution.