# Load necessary libraries
library(rpart)
library(rpart.plot)

# Load the iris dataset
data(iris)

# Inspect the first few rows of the dataset
head(iris)

# Split the data into training and testing sets
set.seed(123)  # For reproducibility
sample_index <- sample(1:nrow(iris), 0.7 * nrow(iris))

train_data <- iris[sample_index, ]
test_data <- iris[-sample_index, ]

# Train a decision tree model
decision_tree_model <- rpart(Species ~ ., data = train_data, method = "class")

# Print the model summary
print(summary(decision_tree_model))

# Visualize the decision tree
rpart.plot(decision_tree_model)

# Make predictions on the test set
predictions <- predict(decision_tree_model, test_data, type = "class")

# Evaluate the model's performance
confusion_matrix <- table(test_data$Species, predictions)
print(confusion_matrix)

# Calculate accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy:", round(accuracy, 2)))
