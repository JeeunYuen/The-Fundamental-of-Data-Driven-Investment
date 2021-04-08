setwd("C:/Users/yjcla/Documents/R test")
library(quantmod)

getSymbols(c('AAPL', '^GSPC','^IRX'),from = "2010-01-01",to = "2019-12-31",
                   periodicity = "monthly", auto.assign=TRUE)

capm.return <- merge(monthlyReturn(AAPL$AAPL.Adjusted),
                     monthlyReturn(GSPC$GSPC.Adjusted),
                     IRX$IRX.Adjusted)
colnames(capm.return) <- c("AAPL", "GSPC", "IRX")

capm.return$AAPL.rp <- capm.return$AAPL-capm.return$IRX
capm.return$GSPC.rp <- capm.return$GSPC-capm.return$IRX

#Plot of market return vs. apple return
plot.new()
plot(x=coredata(capm.return$GSPC.rp),y=coredata(capm.return$AAPL.rp),type="p",
     main = "Market vs. Apple risk premium",
     xlab= "Market",
     ylab = "Apple")

capm.lm <- lm(AAPL.rp ~ GSPC.rp, data = capm.return)
summary(capm.lm)

capm.beta <- cov(capm.return$AAPL.rp, capm.return$GSPC.rp, use="complete.obs")/var(capm.return$GSPC.rp)

#drawing the relationship
plot.new()
plot(x=coredata(capm.return$GSPC.rp),y=coredata(capm.return$AAPL.rp),type="p",
     main = "Market return vs. Apple return",
     xlab= "Market",
     ylab = "Apple")
abline(capm.lm, col = 2)

save(capm.return, file="./RData/capm.return.RData")
