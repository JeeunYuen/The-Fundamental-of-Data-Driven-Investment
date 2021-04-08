setwd("C:/Users/yjcla/Documents/R test")
library(fPortfolio)

load(file = "./RData/hist.return.ts.RData")

tangency.portfolio <- tangencyPortfolio(hist.return.ts)
msp <- maxratioPortfolio(hist.return.ts)
mvp <- minvariancePortfolio(hist.return.ts)
msp.weights <- getWeights(msp)
barplot(msp.weights, main="Max Sharpe Portfolio Weights", xlab="Assset", ylab="Weight In Portfolio (%)",
        col=cm.colors(ncol(hist.return.ts)))

Spec  <- portfolioSpec() 
setTargetRisk(Spec) <- 0.02 
mrp <- maxreturnPortfolio(hist.return.ts, Spec)
mrp.weights <- getWeights(mrp)
barplot(mrp.weights, main="Max Return Portfolio Weights with 2% Risk", xlab="Assset", ylab="Weight In Portfolio (%)", col=cm.colors(ncol(hist.return.ts)))

length(msp.weights)
length(mrp.weights)
msp.mrp.weights <- rbind(msp.weights, mrp.weights)
rownames(msp.mrp.weights) <- c("Max Sharpe","Risk at 2%")
write.csv(msp.mrp.weights, file = "./Data/msp.mrp.weights.csv")
save(msp.mrp.weights, file = "./rdata/msp.mrp.weights.RData")



