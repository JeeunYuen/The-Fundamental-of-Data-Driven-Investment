setwd("C:/Users/yjcla/Documents/R test")
load(file = "./RData/SP500.RData")

#making a new dataframe


summary(SP500[, c("annualReturn", "dividendYield")])

summary(SP500$annualReturn[SP500$annualReturn > 0])
summary(SP500$annualReturn[SP500$annualReturn < 0])


hist(SP500$annualReturn, main="S&P500 Annual Return Histogram")

qqnorm(SP500$annualReturn, 
       ylab="S&P500 Annual Return", 
       xlab="Normal Scores", 
       main="S&P500 annual return normal probability plot") 
qqline(SP500$annualReturn)


DY.lm <- lm(SP500$annualReturn[-1] ~ SP500$dividendYield[-dim(SP500)[1]])
DY.lm.summary <- summary(DY.lm)

names(DY.lm.summary)
DY.lm.summary$coefficients
DY.lm.summary$coefficients[2,]
data.frame((DY.lm.summary$coefficients[2,]),DY.lm.summary$adj.r.squared) 
DY.output <- data.frame(t(DY.lm.summary$coefficients[2,]),DY.lm.summary$adj.r.squared) 
DY.output
colnames(DY.output) <- c("DY coefficient","std.error","t.value","p.value","adj.rsquared")
DY.output


