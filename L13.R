setwd("C:/Users/yjcla/Documents/R test")
load('./Rdata/AdCloseReturns.RData')
ls()

if(!("fPortfolio" %in% as.character(installed.packages()[,1])))
{ install.packages("fPortfolio") } 

library(fPortfolio)

is.na(AdCloseReturns)
hist.return <- AdCloseReturns[rowSums(is.na(AdCloseReturns))==0, ]
hist.return.ts <- as.timeSeries(hist.return)
ef <- portfolioFrontier(hist.return.ts, constraints = "LongOnly")

par(mfrow = c(1, 1)) 
plot(ef,1) 

save(hist.return.ts, file = "./Rdata/hist.return.ts.RData")
save(ef, file = "./Rdata/ef.RData")