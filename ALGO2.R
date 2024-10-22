# Load necessary library
install.packages("e1071")
library(e1071)

# Sample data
data <- data.frame(
    outlook = c('sunny', 'sunny', 'overcast', 'rainy', 'rainy', 'rainy', 'overcast', 'sunny', 'sunny', 'rainy', 'sunny', 'overcast', 'overcast', 'rainy'),
    temperature = c('hot', 'hot', 'hot', 'mild', 'cool', 'cool', 'cool', 'mild', 'cool', 'mild', 'mild', 'mild', 'hot', 'mild'),
    humidity = c('high', 'high', 'high', 'high', 'normal', 'normal', 'normal', 'high', 'normal', 'normal', 'normal', 'high', 'normal', 'high'),
    windy = c(FALSE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE),
    play = c('no', 'no', 'yes', 'yes', 'yes', 'no', 'yes', 'no', 'yes', 'yes', 'yes', 'yes', 'yes', 'no')
)
data
set.seed(123)
sample_index=sample(1:nrow(data),  size= 0.7*nrow(data))
train.data=data[sample_index,]
test.data=data[-sample_index,]

# Train Naive Bayes model
model <- naiveBayes(play ~ ., data = data)

# Predict using the model
predictions <- predict(model, test.data)
test.data
print(predictions)

# Evaluate the model
confusion_matrix <- table(predictions, test.data$play)
print(confusion_matrix)

# Calculate accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)*100
print(paste("Accuracy:", accuracy))
