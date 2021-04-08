setwd("C:/Users/yjcla/Documents/R test")

load(file = "./RData/FF.xts.RData")
load(file="./RData/capm.return.RData")

#Open the data and show

FF.xts.use <- FF.xts[index(FF.xts)>=min(index(capm.return)),]
factor.return <- merge(capm.return*100,FF.xts.use )
factor.model <- lm(AAPL ~ Mkt.RF + SMB + HML, data=factor.return)
summary(factor.model)

names(factor.model)
factor.model$coefficients
factor.exposure <- factor.model$coefficients[2:4]
idiosyncratic.risk <- sd(factor.model$residuals)

commonfactor.risk <- cov(factor.return[,c("Mkt.RF", "SMB", "HML")],use="complete.obs")

save(factor.return, file = "./RData/factor.return.RData")


