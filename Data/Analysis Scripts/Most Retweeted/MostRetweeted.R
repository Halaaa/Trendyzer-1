
library(dplyr)

clean_text = function(text)
{
  text = gsub("RT", "", text) # remove Retweet
  text = gsub("[[:digit:]]", "", text) # remove numbers/Digits
  text = gsub("[ |\t]{2,}", "", text) # remove tabs
  text = gsub("^ ", "", text)  # remove blank spaces at the beginning
  text = gsub(" $", "", text) # remove blank spaces at the end
  
  # text = gsub("@\\w+", "", text) # remove at(@)
  # text = gsub("[[:punct:]]", "", text) # remove punctuation
  # text = gsub("http\\w+", "", text)  # remove links http
}

path <- "D:/Fci/GP/Analysis/dataOScars.csv"
dataFile <- read.csv(file=path , header = TRUE , sep = ",")
dataFile <- select(dataFile , text , created , screenName , retweetCount)

dataFile <- unique(dataFile)

cleanText <- clean_text(dataFile$text)

dataFile <- data.frame(cleanText  ,dataFile$created ,  dataFile$screenName , dataFile$retweetCount)

colnames(dataFile) <- c("Text" , "Data"  ,"screenName" , "retweetCount")

write.csv( dataFile , file = "D:/Fci/GP/Analysis/MostRetweeted.csv")







