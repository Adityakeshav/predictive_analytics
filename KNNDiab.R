rm(list=ls()) # to clear all variables
setwd('C:\\Users\\Aditya\\OneDrive\\Desktop\\CSE234') # setting working directory to 'D' drive where data is present
library('class') # loading Package 'class' for KNN algorithm
library('caret') # loading Package 'caret' for confusion matrix for validation of the knn model
# install.packages('caret', dependencies = TRUE) You can install packages in case they are not present.
diabetes = read.csv('pima-indians-diabetes.csv') # loading the data 
class(diabetes$mass) # class() to know the datatype of the feature mass in diabetes dataset
str(diabetes) # str() to know the structure of the data
diabetes[,'class']=factor(diabetes[,'class']) # converting the 'class' feature into factor type
str(diabetes) # checking the changes made to 'class' feature
mean(diabetes$age) # finding the mean age of patients
summary(diabetes) # gives the info about mean, median and other descriptive measures
train=diabetes[1:500,] # building training data to train knn
test=diabetes[501:768,] # test data to test the performance
pred_test=knn(train[,-9],test[,-9],train$class,k=2) # After training on the train data we calculating the output labels for the test data for k=2.
pred_test # to see the output labels
confusion=table(pred_test,test$class) # table() gives us the correct and incorrect predictions
confusion
sum(diag(confusion))/nrow(test) # this gives us the accuracy of the model on the test data
confusionMatrix(pred_test,test$class) # Confusion matrix gives us the accuracy, sensitivity and other measures which helps us to interpret the model.
# ____________________END______________________

