# Load necessary libraries
library(tm)
library(SnowballC)
library(wordcloud)
library(e1071)
library(caret)

# Load the dataset
# Assuming you have a CSV file with columns 'text' and 'label'
data <- read.csv("path_to_your_dataset.csv", stringsAsFactors = FALSE)

# Create a text corpus
corpus <- Corpus(VectorSource(data$text))

# Text preprocessing
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, stemDocument)
corpus <- tm_map(corpus, stripWhitespace)

# Create a Document-Term Matrix
dtm <- DocumentTermMatrix(corpus)

# Convert DTM to a data frame
dtm_df <- as.data.frame(as.matrix(dtm))
dtm_df$label <- data$label

# Split the data into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(dtm_df$label, p = 0.8, list = FALSE)
trainData <- dtm_df[trainIndex, ]
testData <- dtm_df[-trainIndex, ]

# Train the Naive Bayes model
model <- naiveBayes(label ~ ., data = trainData)

# Predict on the test set
predictions <- predict(model, testData)

# Evaluate the model
confusionMatrix(predictions, testData$label)

# Visualize the most frequent words in the corpus
word_freq <- sort(colSums(as.matrix(dtm)), decreasing = TRUE)
wordcloud(names(word_freq), word_freq, max.words = 100, colors = brewer.pal(8, "Dark2"))

# Save the model for future use
saveRDS(model, "naive_bayes_model.rds")


