library(rpart)
data(ToothGrowth)
View(ToothGrowth)

ToothGrowth$growth=ifelse(ToothGrowth$len>20,"High","low")
ToothGrowth$growth=as.factor(ToothGrowth$growth)

View(ToothGrowth)

sample_index=sample(1:nrow(ToothGrowth),0.7*nrow(ToothGrowth))
train_data=ToothGrowth[sample_index,]
test_data=ToothGrowth[-sample_index,]

tree_model=rpart(growth ~supp+dose,train_data,method = "class")

Predictions=predict(tree_model,test_data,type = "class")

confux_matrix=table(Predictions,test_data$growth)
print(confux_matrix)

accuracy=sum(diag(confux_matrix))/sum(confux_matrix)
print(accuracy)
