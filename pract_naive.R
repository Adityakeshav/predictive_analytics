library(e1071)
data(airquality)
View(airquality)
library(rpart)
# Check for NaN values
sum(is.na(airquality))  # Total number of NaN values
# Remove rows with NaN values
cleaned_data <- na.omit(airquality)

# Check the structure of the cleaned data
str(cleaned_data)

sum(is.na(airquality))
View(airquality)
airquality$Ozone[is.na(airquality$Ozone)] <- mean(airquality$Ozone, na.rm = TRUE)
airquality$Solar.R[is.na(airquality$Solar.R)] <- mean(airquality$Solar.R, na.rm = TRUE)
airquality$Wind[is.na(airquality$Wind)] <- mean(airquality$Wind, na.rm = TRUE)
airquality$Temp[is.na(airquality$Temp)] <- mean(airquality$Temp, na.rm = TRUE)
View(airquality)

airquality$Ozone=ifelse(airquality$Ozone>30,"High","Low")
airquality$Ozone=as.factor(airquality$Ozone)
View(airquality)

sample_index=sample(1:nrow(airquality),0.7*nrow(airquality))
train_data=airquality[sample_index,]
test_data=airquality[-sample_index,]




model=naiveBayes(Ozone ~.,train_data)
prediction=predict(model,test_data)
confu_matrix=table(prediction,test_data$Ozone)
print(confu_matrix)
ac=sum(diag(confu_matrix))/sum(confu_matrix)
print(ac)
acc=mean(prediction==test_data$Ozone)
  print(acc)
  
dt_model=rpart(Ozone ~.,train_data,method = "class")
dt_pred=predict(dt_model,test_data,type = "class")  
confu_dt=table(dt_pred,test_data$Ozone)  
print(confu_dt)
print(mean(dt_pred==test_data$Ozone))
