setwd("C:/Users/yjcla/Documents/R test")
load(file = "./RData/SP500.RData")

#dividendYield > 0.03

SP500$port <- 0.6*SP500$annualReturn + 0.4*SP500$X10yearTyield
SP500$indicator <- SP500$dividendYield > 0.03

SP500$strat <- rep(0, dim(SP500)[1]) 

for (i in 1:(dim(SP500)[1]-1)) {
  if (SP500$dividendYield[i] > 0.03) {
    SP500$strat[i+1] <- 0.8*SP500$annualReturn[i+1]+0.2*SP500$X10yearTyield[i+1]
    } else {SP500$strat[i+1] <- 0.6*SP500$annualReturn[i+1]+0.4*SP500$X10yearTyield[i+1]
    }
}

summary(SP500[,c("port","strat")])

SP500$port.cr <- rep(NaN, dim(SP500)[1])
SP500$strat.cr <- rep(NaN, dim(SP500)[1])

for (i in 2:dim(SP500)[1]) {
  SP500$port.cr[i] <- prod(1+SP500$port[2:i])-1
  SP500$strat.cr[i] <- prod(1+SP500$strat[2:i])-1
  }

plot(SP500$year[-1],SP500$port.cr[-1],type="l",col="blue", main="Cumulative Return", xlab="date", ylab = "cumulative return")
lines(SP500$year[-1],SP500$strat.cr[-1], type="l", col="red")



