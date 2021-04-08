getwd()
setwd("C:/Users/yjcla/Documents/R test")

#data folder 
DIS <- read.csv(file = "C:/Users/yjcla/Documents/R test/Data/DIS.csv")
DIS <- read.csv(file = "./Data/DIS - Copy.csv")
#DIS <- read.csv(file = "./Data/DIS.csv", header = FALSE)


is(DIS$Date)
DIS$date.format <- as.Date(as.character(DIS$Date), format="%Y-%m-%d")
DIS$date.format <- as.Date(as.character(DIS$Date), format="%m/%d/%Y")

is(DIS$date.format)

save(DIS, file = "./RData/DIS.RData")