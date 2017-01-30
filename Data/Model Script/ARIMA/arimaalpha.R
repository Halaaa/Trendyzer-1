#######################################################################
#Tractor
# path <- "Tractor-Sales.csv"
# plot(diff(d))
# plot(log10(d))
# plot(diff(log10(d)))
# pred <- predict(ar, n.ahead = 36)
# plot(d,type="l",xlim=c(2004,2018),ylim=c(1,1600))
# lines(10^(pred$pred),col="blue")
# lines(10^(pred$pred+2*pred$se),col="orange")
# lines(10^(pred$pred-2*pred$se),col="red")

#######################################################################
#twitter
#######logged######
#d <- log10(d)
###################
# get 95% high max
#val <- fcst$upper[1,2]


#######################################################################

# arima alpha
library(forecast)
library(xts)

# path <- "Twitteraug.csv"
path <- "Twittersep.csv"
# path <- "Twitteroct.csv"
# path <- "Twitternov.csv"
# path <- "Twitterdec.csv"
# path <- "Twitterfeb.csv"
# path <- "Twitterjan.csv"
# path <- "Twittermarch.csv"

data <- read.csv(path)
data$X <- NULL
data$t <- as.POSIXct(data$t)
d <- xts(data$n, order.by = data$t)
d <- log10(d)




# par(mfrow = c(1, 2))
###################
# plot(d)
###################
ar <- auto.arima(d)
fcst <- forecast(ar)
# plot(fcst, type = "l")
###################

# get 95% high mean
confmean <- mean(fcst$upper[,2])
uppmin <-  min(fcst$upper[,2])
uppmax <- max(fcst$upper[,2])
temp <- c()
tempList <- list()
boolean <- FALSE


print(uppmax)
for(i in 1:length(d))
{
  val <- d[[i]]
  
  if(val > uppmax)
  {
     nex <- d[[i + 1]]
     nex2 <- d[[i + 2]]

    if( (nex > uppmax & nex2 > uppmax) | 
    ( ((nex < uppmax & nex > confmean) & nex2 > uppmax)| ((nex2 < uppmax & nex2 > confmean) & nex > uppmax) ) )
    {
      trend <- timeDate(time(d[i]))
      trend <- attr(trend, "Data")
      temp <- c(trend)
      temp < unique(temp)
      
      tempList <- list(temp)
      
      
      boolean <- TRUE
    } 
    else
    {
      boolean <- FALSE
    }
  
  }
  
  if(boolean)
  {
    print( tempList)
  }
  else
  {
    print("FALSE TREND")
  }
  
  
  
  
  
} 





  
