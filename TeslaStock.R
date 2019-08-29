library(readr)
#TeslaStock
tsla_stock <- read.csv(
  file = "TSLAStock 06-2014-06-2019_Original_Ready.csv",
  header = TRUE,
  sep = ",",
  stringsAsFactors = FALSE
)

#Setup
tsla_stock <- subset(
  x = tsla_stock,
  select = c(Date, Open, High, Low, Close, Adj.Close, Volume)
)

#Variacion durante horas activas
##### 
vha.tsla_stock <- tsla_stock

#Open - High
vha.tsla_stock.oh <- (vha.tsla_stock$High - vha.tsla_stock$Open)
df.vha.tsla_stock.oh <- data.frame(vha.tsla_stock.oh)
names(df.vha.tsla_stock.oh) <- c("Open-High")
#Open - Low
vha.tsla_stock.ol <- (vha.tsla_stock$Low - vha.tsla_stock$Open)
df.vha.tsla_stock.ol <- data.frame(vha.tsla_stock.ol)
names(df.vha.tsla_stock.ol) <- c("Open-Low")
#Open - Close
vha.tsla_stock.oc <- (vha.tsla_stock$Close - vha.tsla_stock$Open)
df.vha.tsla_stock.oc <- data.frame(vha.tsla_stock.oc)
names(df.vha.tsla_stock.oc) <- c("Open-Close")

#Cant. Open - High 0-5
df.vha.tsla_stock.oh.val0_5 <- subset(
  x = df.vha.tsla_stock.oh,
  subset = `Open-High` > 0 & `Open-High` <= 5,
  select = c("Open-High")
)
#Cant. Open - High 5-10
df.vha.tsla_stock.oh.val5_10 <- subset(
  x = df.vha.tsla_stock.oh,
  subset = `Open-High` > 5 & `Open-High` <= 10,
  select = c("Open-High")
)
#Cant. Open - High 10-15
df.vha.tsla_stock.oh.val10_15 <- subset(
  x = df.vha.tsla_stock.oh,
  subset = `Open-High` > 10 & `Open-High` <= 15,
  select = c("Open-High")
)
#Cant. Open - High 15-20
df.vha.tsla_stock.oh.val15_20 <- subset(
  x = df.vha.tsla_stock.oh,
  subset = `Open-High` > 15 & `Open-High` <= 20,
  select = c("Open-High")
)
#Cant. Open - High 20-25
df.vha.tsla_stock.oh.val20_25 <- subset(
  x = df.vha.tsla_stock.oh,
  subset = `Open-High` > 20 & `Open-High` <= 25,
  select = c("Open-High")
)
#Cant. Open - High 25-37
df.vha.tsla_stock.oh.val25_37 <- subset(
  x = df.vha.tsla_stock.oh,
  subset = `Open-High` > 25 & `Open-High` <= 37,
  select = c("Open-High")
)

vha.tsla_stock.cant <- c(
  nrow(df.vha.tsla_stock.oh.val0_5),
  nrow(df.vha.tsla_stock.oh.val5_10),
  nrow(df.vha.tsla_stock.oh.val10_15),
  nrow(df.vha.tsla_stock.oh.val15_20),
  nrow(df.vha.tsla_stock.oh.val20_25),
  nrow(df.vha.tsla_stock.oh.val25_37)
)

vha.tsla_stock.avg <- c(
  mean(df.vha.tsla_stock.oh.val0_5$`Open-High`),
  mean(df.vha.tsla_stock.oh.val5_10$`Open-High`),
  mean(df.vha.tsla_stock.oh.val10_15$`Open-High`),
  mean(df.vha.tsla_stock.oh.val15_20$`Open-High`),
  mean(df.vha.tsla_stock.oh.val20_25$`Open-High`),
  mean(df.vha.tsla_stock.oh.val25_37$`Open-High`)
)

vha.tsla_stock.hdate <- c(
  
)

vha.tsla_stock.hprice <- c(
  max(df.vha.tsla_stock.oh.val0_5$`Open-High`),
  max(df.vha.tsla_stock.oh.val5_10$`Open-High`),
  max(df.vha.tsla_stock.oh.val10_15$`Open-High`),
  max(df.vha.tsla_stock.oh.val15_20$`Open-High`),
  max(df.vha.tsla_stock.oh.val20_25$`Open-High`),
  max(df.vha.tsla_stock.oh.val25_37$`Open-High`)
)

vha.tsla_stock.ldate <- c(
  
)

vha.tsla_stock.lprice <- c(
  
)


vha.tsla_stock.stats <- data.frame(
  vha.tsla_stock.t,
  vha.tsla_stock.avg,
  vha.tsla_stock.hdate,
  vha.tsla_stock.hprice,
  vha.tsla_stock.ldate,
  vha.tsla_stock.lprice
)
#####

#Variacion durante horas inactivas
#####


#####





