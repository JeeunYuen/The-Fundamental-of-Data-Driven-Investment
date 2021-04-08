setwd("C:/Users/yjcla/Documents/R test")
load('./Rdata/ef.RData')
library(fPortfolio)

par(mfrow = c(1, 1)) 
plot(ef) 

plot.new()
par(mfrow = c(1, 1)) #If we want to make a clean graph
plot(ef) 

pdf("./Report/test plots.pdf")
par(mfrow = c(1, 1)) 
plot(ef,1) 
dev.off()


#Reading excel data
install.packages("readxl")
library(readxl)
sp500.monthly <- read_excel("./Data/SP500MonthlyExcel.xlsx")








