# Function to generate a single realization of T_n
generate_T_n <- function(n) {
  lower_bound <- 5 - 1/(2*n)
  upper_bound <- 5 + 1/(2*n)
  return(runif(1, lower_bound, upper_bound))
}

# Example: Simulate 1000 realizations of T_n for a specific n
n <- 2  # Set the value of n
simulations <- replicate(1000, generate_T_n(n))

# Display a histogram of the simulations
hist(simulations, main=paste("Histogram of T_n with n =", n), xlab="T_n", col="lightblue", border="black")

# Display the first few values of the simulations
head(simulations)
max(simulations)

# Function to calculate the CDF F_n(t) of T_n
F_n <- function(t, n) {
  lower_bound <- 5 - 1/(2*n)
  upper_bound <- 5 + 1/(2*n)
  
  if (t < lower_bound) {
    return(0)
  } else if (t > upper_bound) {
    return(1)
  } else {
    return((t - lower_bound) / (upper_bound - lower_bound))
  }
}

# Function to calculate the CDF F(t) of the constant limit
F <- function(t) {
  if (t < 5) {
    return(0)
  } else {
    return(1)
  }
}

# Example: Plotting the CDFs for specific values of n and comparison with the limit
n_values <- c(1, 5, 10, 50)  # Different n values to observe convergence
t_values <- seq(4, 6, length.out = 1000)  # t values for plotting

# Plot the CDFs
plot(NULL, xlim=c(4, 6), ylim=c(0, 1), xlab="t", ylab="CDF", main="CDFs of T_n and Limit CDF F(t)")

# Add CDFs for different n values
colors <- rainbow(length(n_values))
for (i in 1:length(n_values)) {
  n <- n_values[i]
  cdf_values <- sapply(t_values, F_n, n=n)
  lines(t_values, cdf_values, col=colors[i], lwd=2, type="l", lty=1)
}

# Add the CDF of the constant limit
cdf_limit_values <- sapply(t_values, F)
lines(t_values, cdf_limit_values, col="black", lwd=2, lty=2)

# Add legend
legend("bottomright", legend=c(paste("F_n(t), n =", n_values), "F(t) (Limit)"), 
       col=c(colors, "black"), lty=c(rep(1, length(n_values)), 2), lwd=2)
