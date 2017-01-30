# # Install
# install.packages("tm")  # for text mining
# install.packages("SnowballC") # for text stemming
# install.packages("wordcloud") # word-cloud generator 
# install.packages("RColorBrewer") # color palettes

# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library(dplyr)

clean_text = function(text)
{
  text = gsub("RT", "", text) # remove Retweet
  text = gsub("[[:digit:]]", "", text) # remove numbers/Digits
  text = gsub("[ |\t]{2,}", "", text) # remove tabs
  text = gsub("^ ", "", text)  # remove blank spaces at the beginning
  text = gsub(" $", "", text) # remove blank spaces at the end
  text = gsub("@\\w+", "", text) # remove at(@)
  text = gsub("[[:punct:]]", "", text) # remove punctuation
  text = gsub("http\\w+", "", text)  # remove links http
}

path <- "D:/Fci/GP/wordCloud/dataOScars.csv"
dataFile <- read.csv(file=path , header = TRUE , sep = ",")
dataFile <- select(dataFile , text)

dataFile <- unique(dataFile)
cleanText <- clean_text(dataFile$text)

# Load the data as a corpus
docs <- Corpus(VectorSource(cleanText))
# inspect(docs)

#Build a term-document matrix
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)

# write.csv(d , file = "D:/Fci/GP/wordCloud/text.csv" )


# Generate the Word cloud
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,max.words=200, random.order=FALSE, rot.per=0.35, colors=brewer.pal(8, "Dark2"))

