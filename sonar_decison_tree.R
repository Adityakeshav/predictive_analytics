library(rpart)
library(rpart.plot)

data <- read.csv(file.choose())
View(data)

head(data)

sample.index <- sample(1:nrow(data), 0.7 * nrow(data))

train.data <- data[sample.index, ]
test.data <- data[-sample.index, ]

decision.tree.model <- rpart(R ~ ., data = train.data, method = "class")

rpart.plot(decision.tree.model)

predictions <- predict(decision.tree.model, test.data, type = "class")

confusion_matrix <- table(test.data$R, predictions)
print(confusion_matrix)

accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(accuracy)
