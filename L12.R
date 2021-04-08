setwd("C:/Users/yjcla/Documents/R test")

library(quantmod)
tickers <- c("IVV","IDEV","IUSB","IEMG","IAGG","IJH","IJR")
getSymbols(tickers, from="2015-01-01", to="2019-12-31", periodicity = "daily")

#Make adjusted price data frame
get.AdPrices <- function(x) {Ad(get(x))}
AdClosePrices <- do.call(merge, lapply(tickers, get.AdPrices))
head(AdClosePrices)

#Make return data frame
get.AdReturns <- function(x) {dailyReturn(Ad(get(x)))}
AdCloseReturns <- do.call(merge, lapply(tickers, get.AdReturns))
colnames(AdCloseReturns) <- tickers
head(AdCloseReturns)

save(AdCloseReturns, file = './rdata/AdCloseReturns.RData')
save(AdClosePrices, file = "./rdata/AdClosePrices.RData")
