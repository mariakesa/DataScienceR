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

# Example: Plotting the CDFs for a large value of n to observe convergence
n_large <- 1000  # A large n to approximate convergence
t_values <- seq(4, 6, length.out = 1000)  # t values for plotting
tolerance <- 0.01  # Set a small tolerance for convergence

# Calculate CDFs for the large n and the limit
cdf_n_large <- sapply(t_values, F_n, n=n_large)
cdf_limit <- sapply(t_values, F)

# Plot the CDFs
plot(NULL, xlim=c(4, 6), ylim=c(0, 1), xlab="t", ylab="CDF", main=paste("CDFs for n =", n_large, "and Limit CDF F(t)"))

# Highlight areas of convergence where |F_n(t) - F(t)| < tolerance
converged <- abs(cdf_n_large - cdf_limit) < tolerance
lines(t_values[converged], cdf_n_large[converged], col="blue", lwd=2, type="l", lty=1)

# Plot the rest of the CDF n_large
lines(t_values[!converged], cdf_n_large[!converged], col="red", lwd=2, type="l", lty=2)

# Plot the CDF of the constant limit
lines(t_values, cdf_limit, col="black", lwd=2, lty=3)

# Add legend
legend("bottomright", legend=c("F_n(t) (Converged)", "F_n(t) (Not Converged)", "F(t) (Limit)"), 
       col=c("blue", "red", "black"), lty=c(1, 2, 3), lwd=2)




