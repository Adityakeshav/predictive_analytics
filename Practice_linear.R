data=read.csv(file.choose())
View(data)

head(data)

sample_index=sample(1:nrow(data),0.7*nrow(data))
train_data=data[sample_index,]
test_data=data[-sample_index,]

linear_model=lm(price ~.,train_data)
predictions=predict(linear_model,test_data)

mse=mean(predictions-test_data$price^2)
print(paste("mean squared error ",mse))

