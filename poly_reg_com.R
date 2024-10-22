# Load necessary libraries
library(ggplot2)

# Generate a complex dataset
set.seed(123)
x <- rnorm(100)
y <- 3*x^10 + 2*x^9 + x^8 + rnorm(100, sd=2)
data <- data.frame(x, y)

# Fit a polynomial regression model
poly_model <- lm(y ~ poly(x, 10, raw=TRUE), data=data)

# Summarize the model
summary(poly_model)

# Predict using the model
data$predicted <- predict(poly_model, data)

# Plot the results
ggplot(data, aes(x=x, y=y)) +
    geom_point() +
    geom_line(aes(y=predicted), color='blue') +
    labs(title='Polynomial Regression', x='X', y='Y')

