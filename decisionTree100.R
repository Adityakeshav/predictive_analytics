library(rpart)
library(rpart.plot)

data(iris)
str(iris)
summary(iris)
iris$Species=as.factor(iris$Species)

set.seed(123)

sample_index=sample(1:nrow(iris),size = 0.7*nrow(iris))

train_data=iris[sample_index,]
test_data=iris[-sample_index,]

decision_tree_model=rpart(Species ~.,data=train_data,method = "class")

tree_pred=predict(decision_tree_model,test_data,type = "class")

confu_matrix=table(tree_pred,test_data$Species)
print(confu_matrix)

accracy=sum(diag(confu_matrix))/sum(confu_matrix)
print(accracy)
