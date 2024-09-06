simulate_bernoulli <- function(k, p, n_simulations = 10000) {
  # Generate n_simulations samples of Bernoulli random variable X with probability p
  X <- rbinom(n_simulations, 1, p)
  
  # Compute X^k
  X_k <- X^k
  
  # Estimate the expectation
  expectation <- mean(X_k)
  
  return(expectation)
}

# Parameters
k <- 1 # Power k
p <- 0.7  # Probability p
n_simulations <- 100000  # Number of simulations

# Simulate and compute the expectation
estimated_expectation <- simulate_bernoulli(k, p, n_simulations)
cat("Estimated E[X^", k, "] =", estimated_expectation, "\n")
cat("Theoretical E[X^", k, "] =", p, "\n")

