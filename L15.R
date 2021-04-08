setwd("C:/Users/yjcla/Documents/R test")
load('./Rdata/ef.RData')
library(fPortfolio)


return.risk.frontier <- frontierPoints(ef)
colnames(return.risk.frontier)
annualized.return.risk.frontier <- data.frame(target.risk = return.risk.frontier[,"targetRisk"]*sqrt(250),
                                              target.return = return.risk.frontier[,"targetReturn"]*250)
annualized.return.risk.frontier


par(mfrow = c(1, 1)) 
plot(annualized.return.risk.frontier, xlab = "Risk", ylab = "Return", main = "Annualized Frontier")

riskfree <- rep(0, dim(annualized.return.risk.frontier)[1])
annualized.sharpe <- (annualized.return.risk.frontier$target.return - riskfree) / annualized.return.risk.frontier$target.risk

max.sharpe.return.risk <- annualized.return.risk.frontier[annualized.sharpe == max(annualized.sharpe), ]


plot(annualized.return.risk.frontier$target.risk,annualized.sharpe, xlab="Risk", ylab="Sharpe Ratio")
points(max.sharpe.return.risk[,1], max(annualized.sharpe), col="red")

weightsPlot(ef)
weightedReturnsPlot(ef)

write.csv(annualized.return.risk.frontier, file = "frontier.csv")





