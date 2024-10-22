# Load necessary libraries
library(ggplot2)

# Generate some example data
set.seed(123)
x <- rnorm(100, mean = 0, sd = 1)
y <- 2 + 3 * x + 4 * x^2 + rnorm(100, mean = 0, sd = 1)

# Create a data frame
data <- data.frame(x = x, y = y)

# Fit a polynomial regression model of degree 2
model <- lm(y ~ poly(x, 2, raw = TRUE), data = data)

# Print the summary of the model
summary(model)

# Predict values using the model
data$predicted <- predict(model, data)

# Plot the data and the polynomial regression line
ggplot(data, aes(x = x, y = y)) +
    geom_point() +
    geom_line(aes(y = predicted), color = "blue") +
    labs(title = "Polynomial Regression", x = "X", y = "Y")