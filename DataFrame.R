Name<-c("A","B","C","D","E")
RegNo<-c(1234,1245,1256,1267,1278)
RollNo<-c(12,13,14,15,16)
Marks<-c(50,60,65,70,80)
data<-data.frame(Name,RegNo,RollNo,Marks)
data
data$RollNo[RollNo==14 | RollNo==15]=0
data
Sq<-data[4:5,2:3]
Sq
Rect<-data[1:2,1:3]
Rect
#ROW1,3,4
#Column1,2,4
# Extract rows 1, 3,4 and columns 1,2 and 4
pt<-data[c(1,3,4), c(1,2,4)]
pt
pr<-data[c(1:5),c(1,3)]
pr
#Name of the A,B and C and marks ?
# 2 Print RollNo of all Students , have marks
# 3 varun,Vikas,vinod ,Sameer and peer 
install.packages("sqldf")
library(sqldf)
q1 <- sqldf("SELECT Name,Marks FROM data LIMIT 3")
q1
q2<-sqldf("SELECT RollNo FROM data where marks>70")
q2
sqldf("Select CASE when Name ='A' then 'Vikas' else name as name )








