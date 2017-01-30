#! C:/Program Files/R/R-3.3.1/bin

# Tweets scraping script



# Required packages
# twitterR, RCurl, RJSONIO, stringr


library(twitteR)
library(RCurl)
library(RJSONIO)
library(stringr)

# twitter credentials

api_key <- "BflNHjI0sOWWzYBm7YuBn2r9l"
api_secret <- "Hf81TAJ4WEZek4LkeKLFF9qNRRrWIyjr5b3HShilnzMZHLpofh"
token <- 	"4909528328-k8uEg7XAnKyLD2NW1ZAKm5HNibDDFVdwZcRmTZQ"
token_secret <- "WGPijACZb0chgmxJwT0VjnfR3ButkOBDFWvP8dJlGiQWR"

# connect Rstrudio with twitter searchAPI
setup_twitter_oauth(api_key, api_secret, token, token_secret)


# search tweets

path <- "D:/Fci/GP/Backend/Django/GP/test.txt"
query <- readChar(path, file.info(path)$size)
tweets <- searchTwitter(query, n=20000 , lang="en", retryOnRateLimit = 1 ,since="2016-10-07")

# tweets to dataframe
tweets.df <- twListToDF(tweets)

write.csv(tweets.df, file = "D:/Fci/GP/Backend/Django/GP/tweets.csv")

