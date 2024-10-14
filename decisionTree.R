library(rpart)
library(rpart.plot)

data(iris)

head(iris)

set.seed(123)

sample.index=sample(1:nrow(iris),0.7*nrow(iris))
sample.index

train.data=iris[sample.index,]
test.data=iris[-sample.index,]

decision.tree.model=rpart(Species ~ .,data=train.data,method = "class")

rpart.plot(decision.tree.model)
print(summary(decision.tree.model))

predictions=predict(decision.tree.model,test.data,type = "class")
predictions
confusion.matrix=table(test.data$Species,predictions)
print(confusion.matrix)

accuracy=sum(diag(confusion.matrix))/sum(confusion.matrix)
print(paste("Accuracy : ",round(accuracy,2)))

