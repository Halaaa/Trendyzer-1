# Load Data
path <- "Twitter Script/tweets.csv"
data <- read.csv(file = path)

# subset timestamp col from data
timestamp <- test_set_tweets$V4
timestamp <- as.POSIXct(timestamp)

# turn into time-frequency (hour break) style
timeseries <- table(cut(timestamp, breaks = "hour"))
timeseries <- as.data.frame.table(timeseries)
colnames(timeseries) <- c("t", "n")

# write to csv
write.csv(timeseries, file = "timeseries.csv")
