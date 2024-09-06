# Parameters for the normal distribution
mean_value <- 0
variance_value <- 1
sd_value <- sqrt(variance_value)  # Standard deviation is the square root of the variance

# Function to calculate the density at a specific point
x <- 1.5  # Example point where we want to calculate the density
density_at_x <- dnorm(x, mean = mean_value, sd = sd_value)
print(paste("The density at x =", x, "is", density_at_x))

# Alternatively, you can calculate the density over a range of values
x_values <- seq(-2, 6, by = 0.1)  # Sequence of x values
density_values <- dnorm(x_values, mean = mean_value, sd = sd_value)

# Plotting the density function
plot(x_values, density_values, type = "l", col = "blue", lwd = 2,
     main = "Density of Normal Distribution (Mean = 2, Variance = 2)",
     xlab = "x", ylab = "Density")

x<-2
x<--2.17009
qnorm(0.02, mean = mean_value, sd = sd_value)
pnorm()

#Important for calculating quantiles
qnorm(1-0.02)
2*qnorm(1-0.5)
qnorm(1-0.05)
qnorm(0.9, mean=70,sd=10, lower.tail=TRUE)
