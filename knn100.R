library(class)

data(iris)

str(iris)
summary(iris)
View(iris)

iris_normalised=as.data.frame(scale(iris[,-5]))

head(iris_normalised)

iris_normalised$Species=iris$Species

head(iris_normalised)

set.seed(123)
sample_index=sample(1:nrow(iris),size = 0.7*nrow(iris))
train_data=iris_normalised[sample_index,]
test_data=iris_normalised[-sample_index,]
train_label=train_data$Species
head(train_label)
test_label=test_data$Species
train_data=train_data[,-5]
test_data=test_data[,-5]


knn_predictions=knn(train_data,test_data,train_label,k=5)

confusion_matrix=table(Predicted=knn_predictions,Actual=test_label)
print(confusion_matrix)

accurancy=mean(knn_predictions==test_label)
print(paste("Knn Accuracy",accurancy))
