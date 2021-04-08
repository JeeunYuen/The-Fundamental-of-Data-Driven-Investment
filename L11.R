setwd("C:/Users/yjcla/Documents/R test")

library(quantmod)

# Having an international stock from Yahoo Finance - HTC Corporation
getSymbols(c("2498.TW"),from = "2015-01-01",periodicity = "monthly",auto.assign=TRUE)
HTC <- `2498.TW`

#Load currency pair
getSymbols(c("GBP=X","AUD=X","EUR=X"),src="yahoo",from="2010-01-01", to = "2019-12-31")

#Global ETF

tickers <- c("IVV","IDEV","IUSB","IEMG","IAGG","IJH","IJR")
getSymbols(tickers, from="2015-01-01", to="2019-12-31", periodicity = "daily")

plus.function <- function(x){x+100}
plus.function(1)

get.AdPrices <- function(x) {Ad(get(x))}
IVV.AdPrices <- get.AdPrices("IVV")




