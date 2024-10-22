library(e1071)
library(rpart)
library(class)
data=read.csv(file.choose())
View(data)

set.seed(123)
sample_index=sample(1:nrow(data),size=0.7*nrow(data))
train_data=data[sample_index,]
test_data=data[-sample_index,]

head(data)
#naive
model=naiveBayes(X..50K ~.,data=train_data)
summary(model)
predictions=predict(model,test_data)
print(predictions)

confusion_matrix=table(predictions,test_data$X..50K)
print(confusion_matrix)

accuracy=sum(diag(confusion_matrix))/sum(confusion_matrix)*100
print(paste("naive ",accuracy))

#dt
dt_model=rpart(X..50K ~.,data=train_data,method = "class")
dt_predictions=predict(dt_model,test_data,type = "class")
print(dt_predictions)
dt_confusion_matrix=table(dt_predictions,test_data$X..50K)
print(dt_confusion_matrix)
dt_accuracy=sum(diag(dt_confusion_matrix))/sum(dt_confusion_matrix)*100
print(paste("decision Tree Accuracy",dt_accuracy))

#knn



