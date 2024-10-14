library(class)
library(ggplot2)
library(GGally)
data(iris)
str(iris)
summary(iris)
set.seed(1234)
head(iris)
random<-runif(150)
iris_random<-iris[order(random),]
print(iris_random)
head(iris_random)
normal<-function(x)(
  return((x-min(x))/max(x)-min(x))
)
normal(1:5)
iris_new<-as.data.frame(lapply(iris_random[,5],normal))

