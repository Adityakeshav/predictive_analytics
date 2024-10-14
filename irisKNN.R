d=data(iris)
head(iris)
ran<-sample(1:nrow(iris),0.9*nrow(iris))
nor<-function(x){
  (x-min(x))/(max(x)-min(x))
}
iris_norm<-as.data.frame(lapply(iris[,c(1,2,3,4)],nor))
summary(iris_norm)

iris_train<-iris_norm[ran,]

iris_test<-iris_norm[-ran,]
#extract 5th column if test dataset to measure the accuracy
iris_target_category<-iris[ran,5]
iris_target_category
#load the package for knn
library(class)
pr<-knn(iris_train,iris_test,cl=iris_target_category,k=13)

tab<-table(pr,iris_target_category)

accuracy<-function(x){
  sum(diag(x)/(sum(rowSums(x))))*100
}
accuracy(tab)

