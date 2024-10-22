data(mtcars)
str(mtcars)
summary(mtcars)

View(mtcars)

mtcars$mpg=as.numeric(mtcars$mpg)
mtcars$hp=as.numeric(mtcars$hp)

set.seed(123)
sample_index=sample(1:nrow(mtcars),0.7*nrow(mtcars))
train_data=mtcars[sample_index,]
test_data=mtcars[-sample_index,]

linear_model=lm(mpg ~hp,train_data)
linear_predictions=predict(linear_model,test_data)

mse=mean(linear_predictions-test_data$mpg^2)
print(paste("mean squared error ",mse))

rsq=summary(linear_model)$r.squared
cat("R sq",rsq)
