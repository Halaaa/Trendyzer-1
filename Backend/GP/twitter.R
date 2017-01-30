#! C:/Program Files/R/R-3.3.1/bin

# Load Data
path <- "D:/Fci/GP/Backend/Django/GP/tweets.csv"
data <- read.csv(file = path)

# subset timestamp col from data
timestamp <- data$created
timestamp <- as.POSIXct(timestamp)

# turn into time-frequency (hour break) style
timeseries <- table(cut(timestamp, breaks = "hour"))
timeseries <- as.data.frame.table(timeseries)
colnames(timeseries) <- c("date", "frequancy")

# write to csv
write.csv(timeseries, file = "D:/Fci/GP/Backend/Django/GP/retailt2months.csv")







