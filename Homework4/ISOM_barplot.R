
library("readxl")
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library("syuzhet")
library("sentimentr")
library("ggplot2")
library("dplyr")


## Executive summary


# Import text file from the documents computer folder and view data
MD_AY_1920_GeneralComments <- read_excel("Data/MD-AY19-20-GeneralCommentscopy.xlsx")

set.seed(124125)
n <- nrow(MD_AY_1920_GeneralComments)
new_dat <- MD_AY_1920_GeneralComments
for(j in 1:ncol(MD_AY_1920_GeneralComments)){
  shuffle_idx <- sample(1:n)
  new_dat[,j] <- MD_AY_1920_GeneralComments[shuffle_idx, j]
}

# Create a variable for the comments section of the MD AY 19-20 General Comments dataset
Comments <- MD_AY_1920_GeneralComments$Comments
# Load the data as a corpus
Core_comments_1920 <- Corpus(VectorSource(Comments))



#Cleaning up Text Data
#Replacing "/", "@" and "|" with space
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
Core_comments_1920 <- tm_map(Core_comments_1920, toSpace, "/")
Core_comments_1920 <- tm_map(Core_comments_1920, toSpace, "@")
Core_comments_1920 <- tm_map(Core_comments_1920, toSpace, "\\|")
# Convert the text to lower case
Core_comments_1920 <- tm_map(Core_comments_1920, content_transformer(tolower))
# Remove numbers
Core_comments_1920 <- tm_map(Core_comments_1920, removeNumbers)
# Remove english common stopwords
Core_comments_1920 <- tm_map(Core_comments_1920, removeWords, stopwords("english"))
# Remove punctuations
Core_comments_1920 <- tm_map(Core_comments_1920, removePunctuation)
# Eliminate extra white spaces
Core_comments_1920 <- tm_map(Core_comments_1920, stripWhitespace)
# Text stemming - which reduces words to their root form
Core_comments_1920 <- tm_map(Core_comments_1920, stemDocument)


#Building the term document matrix
Core_comments_1920_dtm <- TermDocumentMatrix(Core_comments_1920)
# identify terms that appear in each sentence, # of columns = # of sentences
dtm_1920_m <- as.matrix(Core_comments_1920_dtm)
# Sort by decreasing value of frequency
dtm_1920_v <- sort(rowSums(dtm_1920_m),decreasing=TRUE)
#convert vector type to data frame 
dtm_1920_d <- data.frame(word = names(dtm_1920_v),freq=dtm_1920_v)
# Display the top 5 most frequent words
head(dtm_1920_d, 5)


# Plot the most frequent words
barplot(dtm_1920_d[1:5,]$freq, las = 2, names.arg = dtm_1920_d[1:5,]$word,
        col ="lightblue", main ="Top 5 most frequent words",
        ylab = "Word frequencies")


# Based on the barplot created, the top five most frequent words found in the data are patient, work, great, team, and well. However since the data are comments from evaluations, most of the words should be student-focused. It doesn't seem that all of the most frequent words found are focused on student behavior and rather the environment the student is in. So implementing custom stop words may be helpful in determining the most frequent words evalutors used to describe student behavior. 
