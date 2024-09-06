install.packages("Ryacas")
library(Ryacas)

# Define symbols
mu <- yacas("mu")
sigma <- yacas("sigma")
t <- yacas("t")

# Define the MGF
MGF <- yacas("Exp(mu * t + 0.5 * sigma^2 * t^2)")

# Compute derivatives
first_derivative <- yacas(deriv(MGF, t))
second_derivative <- yacas(deriv(first_derivative, t))
third_derivative <- yacas(deriv(second_derivative, t))
fourth_derivative <- yacas(deriv(third_derivative, t))

# Evaluate derivatives at t = 0
E_X <- yacas(Replace(first_derivative, list(t=0)))
E_X2 <- yacas(Replace(second_derivative, list(t=0)))
E_X3 <- yacas(Replace(third_derivative, list(t=0)))
E_X4 <- yacas(Replace(fourth_derivative, list(t=0)))

# Display the results
cat("E[X] =", as.character(E_X), "\n")
cat("E[X^2] =", as.character(E_X2), "\n")
cat("E[X^3] =", as.character(E_X3), "\n")
cat("E[X^4] =", as.character(E_X4), "\n")