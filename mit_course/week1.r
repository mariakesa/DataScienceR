# Parameters for the normal distribution
mean_value <- 2
variance_value <- 2
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


# Load necessary library
# If you don't have the package installed, uncomment the next line to install it
# install.packages("ggplot2")

# Set parameters for the non-standardized normal distribution
mu <- 2
sigma <- sqrt(2)

# Function to calculate P(X > -x) for N(mu, sigma)
calc_non_standardized_prob <- function(x) {
  # Calculate the probability for the non-standardized normal distribution
  p_non_standardized <- 1 - pnorm(-x, mean = mu, sd = sigma)
  return(p_non_standardized)
}

# Function to calculate P(Z > -x) for N(0, 1)
calc_standardized_prob <- function(x) {
  # Standardize -x
  z_value <- (-x - mu) / sigma
  # Calculate the probability for the standardized normal distribution
  p_standardized <- 1 - pnorm(z_value)
  return(p_standardized)
}

# Values of x to test
x_values <- c(1, 2, 3, 4, 5)

# Print results
cat("x\tP(X > -x)\tP(Z > -x)\n")
for (x in x_values) {
  p_non_standardized <- calc_non_standardized_prob(x)
  p_standardized <- calc_standardized_prob(x)
  
  cat(x, "\t", round(p_non_standardized, 4), "\t", round(p_standardized, 4), "\n")
}
# Set parameters for the non-standardized normal distribution
mu <- 2
sigma <- sqrt(2)
                                
# say we have 1. 
# Function to calculate P(X > -x) for N(mu, sigma)
calc_non_standardized_prob <- function(x) {
  # Calculate the probability for the non-standardized normal distribution
    p_non_standardized <-pnorm(-x, mean = mu, sd = sigma, lower.tail = FALSE)
  return(p_non_standardized)
}

# Function to calculate P(Z > -(-x)) for N(0, 1)
# Function to calculate P(Z > -x) for N(0, 1)
calc_standardized_prob <- function(x) {
  # Calculate the standardized argument for the CDF
  z_value <- (x +mu) / sigma  # Corrected standardized value
  # Calculate the probability for the standardized normal distribution
  p_standardized <- pnorm(z_value)  # P(Z > z_value)
  return(p_standardized)
}

# Values of x to test
x_values <- c(1, 2, 3, 4, 5)

# Print results
cat("x\tP(X > -x)\tP(Z > -(-x))\n")
for (x in x_values) {
  p_non_standardized <- calc_non_standardized_prob(x)
  p_standardized <- calc_standardized_prob(x)
  
  cat(x, "\t", round(p_non_standardized, 4), "\t", round(p_standardized, 4), "\n")
}
p_non_standardized <- calc_non_standardized_prob(1)
p_non_standardized



