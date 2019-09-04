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
#####

#Open-High Intervals
#####
#Open - High 0-5
df.vha.tsla_stock.oh.val0_5 <- subset(
  x = df.vha.tsla_stock.oh,
  subset = `Open-High` > 0 & `Open-High` <= 5,
  select = c("Open-High")
)
#Open - High 5-10
df.vha.tsla_stock.oh.val5_10 <- subset(
  x = df.vha.tsla_stock.oh,
  subset = `Open-High` > 5 & `Open-High` <= 10,
  select = c("Open-High")
)
#Open - High 10-15
df.vha.tsla_stock.oh.val10_15 <- subset(
  x = df.vha.tsla_stock.oh,
  subset = `Open-High` > 10 & `Open-High` <= 15,
  select = c("Open-High")
)
#Open - High 15-20
df.vha.tsla_stock.oh.val15_20 <- subset(
  x = df.vha.tsla_stock.oh,
  subset = `Open-High` > 15 & `Open-High` <= 20,
  select = c("Open-High")
)
#Open - High 20-25
df.vha.tsla_stock.oh.val20_25 <- subset(
  x = df.vha.tsla_stock.oh,
  subset = `Open-High` > 20 & `Open-High` <= 25,
  select = c("Open-High")
)
#Open - High 25-37
df.vha.tsla_stock.oh.val25_37 <- subset(
  x = df.vha.tsla_stock.oh,
  subset = `Open-High` > 25 & `Open-High` <= 37,
  select = c("Open-High")
)
##### 

#Seleccion de fechas igual al precio mas alto entre la diferencia de precio
#de: Open-High & Low
#0_5
#####
vha.hdate0_5 <- ifelse(
  max(df.vha.tsla_stock.oh.val0_5$`Open-High`) == 
    (vha.tsla_stock$High-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
vha.ldate0_5 <- ifelse(
  min(df.vha.tsla_stock.oh.val0_5$`Open-High`) ==
    (vha.tsla_stock$High-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
df.hdate0_5 <- data.frame(
  subset(
    x = vha.hdate0_5,
    subset = vha.hdate0_5 != "",
    select = vha.hdate0_5
  ),
  stringsAsFactors = FALSE
)
df.ldate0_5 <- data.frame(
  subset(
    x = vha.ldate0_5,
    subset = vha.ldate0_5 != "",
    select = vha.ldate0_5,
  ),
  stringsAsFactors = FALSE
)
names(df.hdate0_5) <- c("Dates")
names(df.ldate0_5) <- c("Dates")
df.hdate0_5 <- as.Date(df.hdate0_5$Dates, "%d/%m/%Y")
df.ldate0_5 <- as.Date(df.ldate0_5$Dates, "%d/%m/%Y")

#####

#5_10
#####
vha.hdate5_10 <- ifelse(
  max(df.vha.tsla_stock.oh.val5_10$`Open-High`) == 
    (vha.tsla_stock$High-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
vha.ldate5_10 <- ifelse(
  min(df.vha.tsla_stock.oh.val0_5$`Open-High`) ==
    (vha.tsla_stock$High-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
df.hdate5_10 <- data.frame(
  subset(
    x = vha.hdate5_10,
    subset = vha.hdate5_10 != "",
    select = vha.hdate5_10
  ),
  stringsAsFactors = FALSE
)
df.ldate5_10 <- data.frame(
  subset(
    x = vha.ldate5_10,
    subset = vha.ldate5_10 != "",
    select = vha.ldate5_10
  ),
  stringsAsFactors = FALSE
)
names(df.hdate5_10) <- c("Dates")
names(df.ldate5_10) <- c("Dates")
df.hdate5_10 <- as.Date(df.hdate5_10$Dates, "%d/%m/%Y")
df.ldate5_10 <- as.Date(df.ldate5_10$Dates, "%d/%m/%Y")

#####

#10_15
#####
vha.hdate10_15 <- ifelse(
  max(df.vha.tsla_stock.oh.val10_15$`Open-High`) == 
    (vha.tsla_stock$High-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
vha.ldate10_15 <- ifelse(
  min(df.vha.tsla_stock.oh.val10_15$`Open-High`) ==
    (vha.tsla_stock$High-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
df.hdate10_15 <- data.frame(
  subset(
    x = vha.hdate10_15,
    subset = vha.hdate10_15 != "",
    select = vha.hdate10_15
  ),
  stringsAsFactors = FALSE
)
df.ldate10_15 <- data.frame(
  subset(
    x = vha.ldate10_15,
    subset = vha.ldate10_15 != "",
    select = vha.ldate10_15
  )
)
names(df.hdate10_15) <- c("Dates")
names(df.ldate10_15) <- c("Dates")
df.hdate10_15 <- as.Date(df.hdate10_15$Dates, "%d/%m/%Y")
df.ldate10_15 <- as.Date(df.ldate10_15$Dates, "%d/%m/%Y")
#####

#15_20
#####
vha.hdate15_20 <- ifelse(
  max(df.vha.tsla_stock.oh.val15_20$`Open-High`) == 
    (vha.tsla_stock$High-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
vha.ldate15_20 <- ifelse(
  min(df.vha.tsla_stock.oh.val15_20$`Open-High`) == 
    (vha.tsla_stock$High-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
df.hdate15_20 <- data.frame(
  subset(
    x = vha.hdate15_20,
    subset = vha.hdate15_20 != "",
    select = vha.hdate15_20
  ),
  stringsAsFactors = FALSE
)
df.ldate15_20 <- data.frame(
  subset(
    x = vha.ldate15_20,
    subset = vha.ldate15_20 != "",
    select = vha.ldate15_20
  )
)
names(df.hdate15_20) <- c("Dates")
names(df.ldate15_20) <- c("Dates")
df.hdate15_20 <- as.Date(df.hdate15_20$Dates, "%d/%m/%Y")
df.ldate15_20 <- as.Date(df.ldate15_20$Dates, "%d/%m/%Y")
#####

#20_25
#####
vha.hdate20_25 <- ifelse(
  max(df.vha.tsla_stock.oh.val20_25$`Open-High`) == 
    (vha.tsla_stock$High-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
vha.ldate20_25 <- ifelse(
  min(df.vha.tsla_stock.oh.val20_25$`Open-High`) == 
    (vha.tsla_stock$High-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  "" 
)
df.hdate20_25 <- data.frame(
  subset(
    x = vha.hdate20_25,
    subset = vha.hdate20_25 != "",
    select = vha.hdate20_25
  ),
  stringsAsFactors = FALSE
)
df.ldate20_25 <- data.frame(
  subset(
    x = vha.ldate20_25,
    subset = vha.ldate20_25 != "",
    select = vha.ldate20_25
  ),
  stringsAsFactors = FALSE
)
names(df.hdate20_25) <- c("Dates")
names(df.ldate20_25) <- c("Dates")
df.hdate20_25 <- as.Date(df.hdate20_25$Dates, "%d/%m/%Y")
df.ldate20_25 <- as.Date(df.ldate20_25$Dates, "%d/%m/%Y")
#####

#25_37
#####
vha.hdate25_37 <- ifelse(
  max(df.vha.tsla_stock.oh.val25_37$`Open-High`) == 
    (vha.tsla_stock$High-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
vha.ldate25_37 <- ifelse(
  min(df.vha.tsla_stock.oh.val25_37$`Open-High`) == 
    (vha.tsla_stock$High-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
df.hdate25_37 <- data.frame(
  subset(
    x = vha.hdate25_37,
    subset = vha.hdate25_37 != "",
    select = vha.hdate25_37
  ),
  stringsAsFactors = FALSE
)
df.ldate25_37 <- data.frame(
  subset(
    x = vha.ldate25_37,
    subset = vha.ldate25_37 != "",
    select = vha.ldate25_37
  ),
  stringsAsFactors = FALSE
)
names(df.hdate25_37) <- c("Dates")
names(df.ldate25_37) <- c("Dates")
df.hdate25_37 <- as.Date(df.hdate25_37$Dates, "%d/%m/%Y")
df.ldate25_37 <- as.Date(df.ldate25_37$Dates, "%d/%m/%Y")

#####
#####

#Cant. values of Intervals
#####
vha.tsla_stock.cant <- c(
  nrow(df.vha.tsla_stock.oh.val0_5),
  nrow(df.vha.tsla_stock.oh.val5_10),
  nrow(df.vha.tsla_stock.oh.val10_15),
  nrow(df.vha.tsla_stock.oh.val15_20),
  nrow(df.vha.tsla_stock.oh.val20_25),
  nrow(df.vha.tsla_stock.oh.val25_37)
)
#####

#Avg. values of Intervals
#####
vha.tsla_stock.avg <- c(
  mean(df.vha.tsla_stock.oh.val0_5$`Open-High`),
  mean(df.vha.tsla_stock.oh.val5_10$`Open-High`),
  mean(df.vha.tsla_stock.oh.val10_15$`Open-High`),
  mean(df.vha.tsla_stock.oh.val15_20$`Open-High`),
  mean(df.vha.tsla_stock.oh.val20_25$`Open-High`),
  mean(df.vha.tsla_stock.oh.val25_37$`Open-High`)
)
#####

#High-Date values of Intervals
#####
vha.tsla_stock.hdate <- c(
  df.hdate0_5[1],
  df.hdate5_10[1],
  df.hdate10_15[1],
  df.hdate15_20[1],
  df.hdate20_25[1],
  df.hdate25_37[1]
)
#####

#High-Price values of Intervals
#####
vha.tsla_stock.hprice <- c(
  max(df.vha.tsla_stock.oh.val0_5$`Open-High`),
  max(df.vha.tsla_stock.oh.val5_10$`Open-High`),
  max(df.vha.tsla_stock.oh.val10_15$`Open-High`),
  max(df.vha.tsla_stock.oh.val15_20$`Open-High`),
  max(df.vha.tsla_stock.oh.val20_25$`Open-High`),
  max(df.vha.tsla_stock.oh.val25_37$`Open-High`)
)
#####

#Low-Date values of Intervals
#####
vha.tsla_stock.ldate <- c(
  df.ldate0_5[1],
  df.ldate5_10[1],
  df.ldate10_15[1],
  df.ldate15_20[1],
  df.ldate20_25[1],
  df.ldate25_37[1]
)
#####

#Low-Price values of Intervals
#####
vha.tsla_stock.lprice <- c(
  min(df.vha.tsla_stock.oh.val0_5$`Open-High`),
  min(df.vha.tsla_stock.oh.val5_10$`Open-High`),
  min(df.vha.tsla_stock.oh.val10_15$`Open-High`),
  min(df.vha.tsla_stock.oh.val15_20$`Open-High`),
  min(df.vha.tsla_stock.oh.val20_25$`Open-High`),
  min(df.vha.tsla_stock.oh.val25_37$`Open-High`)
)
#####

df.vha.tsla_stock.stats <- data.frame(
  vha.tsla_stock.cant,
  vha.tsla_stock.avg,
  vha.tsla_stock.hdate,
  vha.tsla_stock.hprice,
  vha.tsla_stock.ldate,
  vha.tsla_stock.lprice
)
names(df.vha.tsla_stock.stats) <- 
  c("Cant","Average","High-Date","High-Price","Low-Date","Low-Price")
View(df.vha.tsla_stock.stats)

write.table(
  x = df.vha.tsla_stock.stats, 
  file = "Stats.csv",
  sep = ",")
