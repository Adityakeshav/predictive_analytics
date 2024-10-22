library(e1071)

data(iris)
View(iris)

iris$Species=as.factor(iris$Species)

set.seed(123)
sample_index=sample(1:nrow(iris),size = 0.7*nrow(iris))
train_data=iris[sample_index,]
test_data=iris[-sample_index,]

naive_bayes_model=naiveBayes(Species ~.,data = train_data)

naive_predictions=predict(naive_bayes_model,test_data)

confusion_matrix=table(naive_predictions,test_data$Species)
print(confusion_matrix)
accurancy=mean(naive_predictions==test_data$Species)
print(confusion_matrix)
accurancy_from_conf=sum(diag(confusion_matrix))/sum(confusion_matrix)
print(accurancy_from_conf)
