getwd()
setwd("C:/Users/yjcla/Documents/R test")
load(file="./RData/DIS.RData")

#calculating daily return

price.t1 <- DIS$Adj.Close[-dim(DIS)[1]]
price.t2 <- DIS$Adj.Close[-1]
daily.return <- (price.t2-price.t1)/price.t1

dim(DIS)[1]
length(daily.return)

DIS$daily.return <- c(NaN, daily.return)

#calculating cumulative return

DIS$cumulative.return <- rep(NaN, dim(DIS)[1])

for (i in 2:dim(DIS)[1]) {
  DIS$cumulative.return[i] <- prod(1+DIS$daily.return[2:i])-1
}

#draw cumulative return
plot(DIS$cumulative.return[-1], main="Cumulative Return", xlab="date", ylab = "cumulative return")
plot(DIS$date.format[-1],DIS$cumulative.return[-1], main="Cumulative Return", xlab="date", ylab = "cumulative return")

#annualized return
(1+DIS$cumulative.return[dim(DIS)[1]])^(1/58)-1

#Partial data

DIS2000 <- DIS[DIS$date.format >= as.Date("2000-01-01"), ]
head(DIS2000)
tail(DIS2000)

save(DIS, file = "./RData/DIS.RData")

