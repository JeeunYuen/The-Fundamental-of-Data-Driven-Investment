setwd("C:/Users/yjcla/Documents/R test")

if(!("tidyverse" %in% as.character(installed.packages()[,1]))) {
  install.packages("tidyverse") 
  } 

library(tidyverse)

ff_url <- "https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/F-F_Research_Data_Factors_CSV.zip"

temp_file <- tempfile()
download.file(ff_url, temp_file)

ff_factors_raw_data <- unzip(temp_file)
ff_factors_raw_data <- read.csv(ff_factors_raw_data, skip = 3)

head(ff_factors_raw_data)
tail(ff_factors_raw_data)
dim(ff_factors_raw_data)

#
FF <- ff_factors_raw_data[1:1122,]
colnames(FF)
colnames(FF)[1] <- "YearMonth"
is(FF$YearMonth)

date.index <- as.Date(paste(substr(FF$YearMonth,1,4),"-",
                            substr(FF$YearMonth,5,6),"-01",sep=""))
FF.xts <- xts(FF, date.index)

save(FF.xts, file = "./RData/FF.xts.RData")




