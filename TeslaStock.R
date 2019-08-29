library(readr)
#TeslaStock
tsla_stock <- read.csv(
  file = "TSLAStock 06-2014-06-2019_Original_Ready.csv",
  header = TRUE,
  sep = ",",
  stringsAsFactors = FALSE
)
View(tsla_stock)

#Setup
tsla_stock.setup <- subset(
  x = tsla_stock,
  select = c(Date, Open, High, Low, Close, Adj.Close, Volume)
)

#Variacion durante horas activas
vha.tsla_stock <- tsla_stock.setup

#Open - High
vha.tsla_stock.oh <- (vha.tsla_stock$High - vha.tsla_stock$Open)
#Open - Low
vha.tsla_stock.ol <- (vha.tsla_stock$Low - vha.tsla_stock$Open)
#Open - Close
vha.tsla_stock.oc <- (vha.tsla_stock$Close - vha.tsla_stock$Open)

#Set c
c <- 0
c5 <- 0
c10 <- 0
c15 <- 0
c20 <- 0
c25 <- 0

#Cant. Open - High 0-5
vha.tsla_stock.oh.val0_5 <- 
  sum(ifelse(vha.tsla_stock.oh>0,
       ifelse(vha.tsla_stock.oh<=5,
              c <- c+1,
              c <- 0),
       c <- c))

#Cant. Open - High 5-10
vha.tsla_stock.oh.val5_10 <- 
  sum(ifelse(vha.tsla_stock.oh>5,
             ifelse(vha.tsla_stock.oh<=10,
                    c5 <- c5+1,
                    c5 <- 0),
             c5 <- c5))

#Cant. Open - High 10-15
vha.tsla_stock.oh.val10_15 <- 
  sum(ifelse(vha.tsla_stock.oh>10,
             ifelse(vha.tsla_stock.oh<=15,
                    c10 <- c10+1,
                    c10 <- 0),
             c10 <- c10))

#Cant. Open - High 15-20
vha.tsla_stock.oh.val15_20 <- 
  sum(ifelse(vha.tsla_stock.oh>15,
             ifelse(vha.tsla_stock.oh<=20,
                    c15 <- c15+1,
                    c15 <- 0),
             c15 <- c15))

#Cant. Open - High 20-25
vha.tsla_stock.oh.val20_25 <- 
  sum(ifelse(vha.tsla_stock.oh>20,
             ifelse(vha.tsla_stock.oh<=25,
                    c20 <- c20+1,
                    c20 <- 0),
             c20 <- c20))

#Cant. Open - High 25-37
vha.tsla_stock.oh.val25_37 <- 
  sum(ifelse(vha.tsla_stock.oh>25,
             ifelse(vha.tsla_stock.oh<=37,
                    c25 <- c25+1,
                    c25 <- 0),
             c25 <- c25))

