asd<- list("abc", 89.7)


asd




subject1 <- list(fullname = "John",
                 temperature = 98.6,
                 flu_status = "TRUE",
                 gender = "Male",
                 blood = 'O')


subject1



subject1[2]
subject1$temperature
subject1[c("temperature", "flu_status")]


list_data <- list("Red", "Green", c(21,32,11), TRUE, 51.23, 119.1)
print(list_data)

#to add item
thislist <- list("apple", "banana", "cherry")

"apple" %in% thislist

#to append
thislist <- list("apple", "banana", "cherry")


append(thislist, "orange")
thislist
#add at a location
new<-append(thislist, "orange", after = 2)
#remove
newlist <- thislist[-1]

