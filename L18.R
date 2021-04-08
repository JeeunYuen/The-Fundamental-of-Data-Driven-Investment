setwd("C:/Users/yjcla/Documents/R test")

library(PerformanceAnalytics)

load("./rdata/msp.mrp.weights.RData")
load('./rdata/AdCloseReturns.RData')

colnames(msp.mrp.weights)
colnames(AdCloseReturns)

match(c(1,2,3), c(3,2,1))

id <- match(colnames(msp.mrp.weights), colnames(AdCloseReturns))
hist.return.use <- AdCloseReturns[,id]

msp.return <- hist.return.use %*% msp.mrp.weights[1,]
mrp.return <- hist.return.use %*% msp.mrp.weights[2,]

hist.return.use$msp <- msp.return
hist.return.use$mrp <- mrp.return

table.AnnualizedReturns(hist.return.use, scale=252)
table.Drawdowns(hist.return.use[, c("msp")])

charts.RollingPerformance(hist.return.use[,c("mrp","msp")], 20,legend.loc="topright")
table.CalendarReturns(hist.return.use$mrp)

layout(rbind(c(1,2),c(3,4)))
chart.Histogram(hist.return.use$mrp, main = "Plain", methods = NULL)
chart.Histogram(hist.return.use$mrp, main = "Density", breaks=40,
                  methods = c("add.density", "add.normal"))
chart.Histogram(hist.return.use$mrp, main = "Skewness", methods = c("add.centered"))
chart.Histogram(hist.return.use$mrp, main = "Risk Measures", methods = c("add.risk"))


par(mfrow=c(1,1))
chart.CumReturns(hist.return.use[,c("msp","mrp")],
                 legend.loc="bottomright", main="Cumulative Returns")

table.DownsideRisk(hist.return.use[,c("msp","mrp")])



