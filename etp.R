# Load necessary libraries
library(ggplot2)
library(caret)
library(randomForest)

# Load the dataset
dataset <- read.csv('Position_Salaries.csv')

# Visualize the dataset
ggplot(dataset, aes(x = Level, y = Salary)) +
    geom_point(color = 'blue') +
    ggtitle('Position vs Salary') +
    xlab('Position Level') +
    ylab('Salary')

# Linear Regression
linear_model <- lm(Salary ~ Level, data = dataset)
linear_pred <- predict(linear_model, newdata = dataset)

# Polynomial Regression
dataset$Level2 <- dataset$Level^2
dataset$Level3 <- dataset$Level^3
poly_model <- lm(Salary ~ Level + Level2 + Level3, data = dataset)
poly_pred <- predict(poly_model, newdata = dataset)

# Random Forest Regression
set.seed(1234)
rf_model <- randomForest(Salary ~ Level, data = dataset, ntree = 500)
rf_pred <- predict(rf_model, newdata = dataset)

# Visualize the results
ggplot() +
    geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'blue') +
    geom_line(aes(x = dataset$Level, y = linear_pred), color = 'red') +
    geom_line(aes(x = dataset$Level, y = poly_pred), color = 'green') +
    geom_line(aes(x = dataset$Level, y = rf_pred), color = 'purple') +
    ggtitle('Regression Models Comparison') +
    xlab('Position Level') +
    ylab('Salary') +
    scale_color_manual(name = "Models", values = c("Linear" = "red", "Polynomial" = "green", "Random Forest" = "purple"))

# Compare the results
results <- data.frame(
    Level = dataset$Level,
    Actual = dataset$Salary,
    Linear_Pred = linear_pred,
    Poly_Pred = poly_pred,
    RF_Pred = rf_pred
)

print(results)