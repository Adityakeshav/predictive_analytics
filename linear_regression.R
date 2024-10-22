# Load necessary libraries
library(MASS)
library(caret)

# Load the California housing dataset
data("Boston", package = "MASS")

# Inspect the dataset
head(Boston)

# Split the data into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(Boston$medv, p = 0.8, list = FALSE)
trainData <- Boston[trainIndex, ]
testData <- Boston[-trainIndex, ]

# Fit a linear regression model
model <- lm(medv ~ ., data = trainData)

# Summarize the model
summary(model)

# Make predictions on the test set
predictions <- predict(model, newdata = testData)

# Evaluate the model
mse <- mean((predictions - testData$medv)^2)
cat("Mean Squared Error:", mse, "\n")

