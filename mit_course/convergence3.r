# Function to simulate M_n for a given n
simulate_M_n <- function(n, num_simulations=10000) {
  # Simulate num_simulations samples of M_n
  M_n_values <- replicate(num_simulations, max(runif(n)))
  return(M_n_values)
}

# Set parameters
n <- 100  # Set the value of n
num_simulations <- 10000  # Number of simulations to approximate the distribution

# Simulate the distribution of M_n
M_n_values <- simulate_M_n(n, num_simulations)

# Plot the distribution of M_n
hist(M_n_values, breaks=30, probability=TRUE, 
     main=paste("Distribution of M_n with n =", n), 
     xlab=expression(M[n]), col="lightblue", border="black")

# Add a density curve for better visualization
lines(density(M_n_values), col="red", lwd=2)

# Display the first few values of M_n for verification
head(M_n_values)

# Function to simulate M_n for a given n and calculate P(|M_n - 1| > delta)
calculate_probability <- function(n, delta, num_simulations=10000) {
  # Simulate the distribution of M_n
  M_n_values <- replicate(num_simulations, max(runif(n)))
  
  # Calculate the probability P(|M_n - 1| > delta)
  probability <- mean(abs(M_n_values-1) > delta)
  return(probability)
}

# Set parameters
n <- 100      # Set the value of n
delta <- 0.05 # Set the value of delta
num_simulations <- 10000  # Number of simulations

# Calculate the probability
probability <- calculate_probability(n, delta, num_simulations)

# Display the result
cat("P(|M_n - 1| > delta) for n =", n, "and delta =", delta, "is approximately:", probability, "\n", 
    "formula: ", (1-delta)^n, "\n")

simulate_and_plot_cdf <- function(n, num_simulations = 10000) {
  # Simulate the distribution of M_n
  M_n_values <- replicate(num_simulations, max(runif(n)))
  
  # Calculate the empirical CDF
  empirical_cdf <- ecdf(M_n_values)
  
  # Create a sequence of x values for the theoretical CDF
  x_values <- seq(0, 1, length.out = 100)
  theoretical_cdf <- x_values^n  # Theoretical CDF: F_{M_n}(x) = x^n
  
  # Plot the empirical CDF and theoretical CDF
  plot(empirical_cdf, main=paste("Empirical vs Theoretical CDF of M_n for n =", n),
       xlab="x", ylab="CDF", col="blue", lwd=2, verticals=TRUE)
  lines(x_values, theoretical_cdf, col="red", lwd=2, lty=2)
  
  # Add a legend
  legend("bottomright", legend=c("Empirical CDF", "Theoretical CDF: x^n"),
         col=c("blue", "red"), lty=c(1, 2), lwd=2)
}

# Set parameters
n <- 10         # Number of uniform random variables
num_simulations <- 10000  # Number of simulations to estimate the CDF

# Call the function to simulate and plot
simulate_and_plot_cdf(n, num_simulations)


# Function to calculate and print example values of the empirical and theoretical CDF
print_cdf_values <- function(n, num_simulations = 10000) {
  # Simulate the distribution of M_n
  M_n_values <- replicate(num_simulations, max(runif(n)))
  
  # Calculate the empirical CDF
  empirical_cdf <- ecdf(M_n_values)

  # Define a sequence of x values
  x_values <- seq(0, 1, length.out = 11)  # 11 points from 0 to 1
  theoretical_cdf <- x_values^n  # Theoretical CDF: F_{M_n}(x) = x^n

  # Print the example values
  cat("x values | Empirical CDF | Theoretical CDF\n")
  cat("---------------------------------------------\n")
  
  for (x in x_values) {
    emp_value <- empirical_cdf(x)
    theo_value <- x^n
    cat(sprintf("%.2f       | %.4f         | %.4f\n", x, emp_value, theo_value))
  }
}

# Set parameters
n <- 5  # Number of uniform random variables
num_simulations <- 10000  # Number of simulations to estimate the CDF

# Call the function to print example values
print_cdf_values(n, num_simulations)





