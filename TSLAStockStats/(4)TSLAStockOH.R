library(readr)

#TeslaStock
TSLAStock <- read.csv(
  file = "TSLAStockStats/(1)TSLAStock.csv",
  header = TRUE,
  sep = ",",
  stringsAsFactors = FALSE,
)

TSLAStockSelect <- c("Date", "Open", "High", "Low", "Close", "Adj.Close", "Volume")

#Setup
TSLAStock <- subset(
  x = TSLAStock,
  select = TSLAStockSelect
)

#Variacion durante horas activas
#Open - High
df.TSLAStock.OH <- data.frame(
  "Open_High" = as.double((TSLAStock$High - TSLAStock$Open))
)

#Open-High Intervals
df.vha.tsla_stock.oh.val0_5 <- subset(
  x = df.TSLAStock.OH,
  subset = `Open_High` > 0 & `Open_High` <= 5
)

df.vha.tsla_stock.oh.val5_10 <- subset(
  x = df.TSLAStock.OH,
  subset = `Open_High` > 5 & `Open_High` <= 10
)

df.vha.tsla_stock.oh.val10_15 <- subset(
  x = df.TSLAStock.OH,
  subset = `Open_High` > 10 & `Open_High` <= 15
)

df.vha.tsla_stock.oh.val15_20 <- subset(
  x = df.TSLAStock.OH,
  subset = `Open_High` > 15 & `Open_High` <= 20
)

df.vha.tsla_stock.oh.val20_25 <- subset(
  x = df.TSLAStock.OH,
  subset = `Open_High` > 20 & `Open_High` <= 25
)

df.vha.tsla_stock.oh.val25_37 <- subset(
  x = df.TSLAStock.OH,
  subset = `Open_High` > 25 & `Open_High` <= 37
)


#Seleccion de fechas igual al precio mas alto entre la diferencia de precio
#de: Open-High & Low
#0_5
#####
vha.hdate0_5 <- ifelse(
  max(df.vha.tsla_stock.oh.val0_5$`Open_High`) == 
    (TSLAStock$High-TSLAStock$Open),
  TSLAStock$Date,
  ""
)
vha.ldate0_5 <- ifelse(
  min(df.vha.tsla_stock.oh.val0_5$`Open_High`) ==
    (TSLAStock$High-TSLAStock$Open),
  TSLAStock$Date,
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
  max(df.vha.tsla_stock.oh.val5_10$`Open_High`) == 
    (TSLAStock$High-TSLAStock$Open),
  TSLAStock$Date,
  ""
)
vha.ldate5_10 <- ifelse(
  min(df.vha.tsla_stock.oh.val0_5$`Open_High`) ==
    (TSLAStock$High-TSLAStock$Open),
  TSLAStock$Date,
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
  max(df.vha.tsla_stock.oh.val10_15$`Open_High`) == 
    (TSLAStock$High-TSLAStock$Open),
  TSLAStock$Date,
  ""
)
vha.ldate10_15 <- ifelse(
  min(df.vha.tsla_stock.oh.val10_15$`Open_High`) ==
    (TSLAStock$High-TSLAStock$Open),
  TSLAStock$Date,
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
  max(df.vha.tsla_stock.oh.val15_20$`Open_High`) == 
    (TSLAStock$High-TSLAStock$Open),
  TSLAStock$Date,
  ""
)
vha.ldate15_20 <- ifelse(
  min(df.vha.tsla_stock.oh.val15_20$`Open_High`) == 
    (TSLAStock$High-TSLAStock$Open),
  TSLAStock$Date,
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
  max(df.vha.tsla_stock.oh.val20_25$`Open_High`) == 
    (TSLAStock$High-TSLAStock$Open),
  TSLAStock$Date,
  ""
)
vha.ldate20_25 <- ifelse(
  min(df.vha.tsla_stock.oh.val20_25$`Open_High`) == 
    (TSLAStock$High-TSLAStock$Open),
  TSLAStock$Date,
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
  max(df.vha.tsla_stock.oh.val25_37$`Open_High`) == 
    (TSLAStock$High-TSLAStock$Open),
  TSLAStock$Date,
  ""
)
vha.ldate25_37 <- ifelse(
  min(df.vha.tsla_stock.oh.val25_37$`Open_High`) == 
    (TSLAStock$High-TSLAStock$Open),
  TSLAStock$Date,
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

#Rango
vha.tsla_stock.rango.OH <- c(
  "0-5",
  "5-10",
  "10-15",
  "15-20",
  "20-25",
  "25-37"
)

#Cant. values of Intervals
#####
vha.tsla_stock.cant.OH <- c(
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
vha.tsla_stock.avg.OH <- c(
  mean(df.vha.tsla_stock.oh.val0_5$`Open_High`),
  mean(df.vha.tsla_stock.oh.val5_10$`Open_High`),
  mean(df.vha.tsla_stock.oh.val10_15$`Open_High`),
  mean(df.vha.tsla_stock.oh.val15_20$`Open_High`),
  mean(df.vha.tsla_stock.oh.val20_25$`Open_High`),
  mean(df.vha.tsla_stock.oh.val25_37$`Open_High`)
)
#####

#####
#Standard deviation
vha.tsla_stock.de.OH <- c(
  sd(as.double(df.vha.tsla_stock.oh.val0_5$Open_High)),
  sd(as.double(df.vha.tsla_stock.oh.val5_10$Open_High)),
  sd(as.double(df.vha.tsla_stock.oh.val10_15$Open_High)),
  sd(as.double(df.vha.tsla_stock.oh.val15_20$Open_High)),
  sd(as.double(df.vha.tsla_stock.oh.val20_25$Open_High)),
  sd(as.double(df.vha.tsla_stock.oh.val25_37$Open_High))
)
#####

#####
#In range 
vha.tsla_stock.ir.OH <- c(
   nrow(subset(x = df.TSLAStock.OH, subset = `Open_High` >= (vha.tsla_stock.avg[1]-vha.tsla_stock.de[1]) & `Open_High` <= (vha.tsla_stock.avg[1]+vha.tsla_stock.de[1]))),
   nrow(subset(x = df.TSLAStock.OH, subset = `Open_High` >= (vha.tsla_stock.avg[2]-vha.tsla_stock.de[2]) & `Open_High` <= (vha.tsla_stock.avg[2]+vha.tsla_stock.de[2]))),
   nrow(subset(x = df.TSLAStock.OH, subset = `Open_High` >= (vha.tsla_stock.avg[3]-vha.tsla_stock.de[3]) & `Open_High` <= (vha.tsla_stock.avg[3]+vha.tsla_stock.de[3]))),
   nrow(subset(x = df.TSLAStock.OH, subset = `Open_High` >= (vha.tsla_stock.avg[4]-vha.tsla_stock.de[4]) & `Open_High` <= (vha.tsla_stock.avg[4]+vha.tsla_stock.de[4]))),
   nrow(subset(x = df.TSLAStock.OH, subset = `Open_High` >= (vha.tsla_stock.avg[5]-vha.tsla_stock.de[5]) & `Open_High` <= (vha.tsla_stock.avg[5]+vha.tsla_stock.de[5]))),
   nrow(subset(x = df.TSLAStock.OH, subset = `Open_High` >= (vha.tsla_stock.avg[6]-vha.tsla_stock.de[6]) & `Open_High` <= (vha.tsla_stock.avg[6]+vha.tsla_stock.de[6])))
)


#####


#High-Date values of Intervals
#####
vha.tsla_stock.hdate.OH <- c(
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
vha.tsla_stock.hprice.OH <- c(
  max(df.vha.tsla_stock.oh.val0_5$`Open_High`),
  max(df.vha.tsla_stock.oh.val5_10$`Open_High`),
  max(df.vha.tsla_stock.oh.val10_15$`Open_High`),
  max(df.vha.tsla_stock.oh.val15_20$`Open_High`),
  max(df.vha.tsla_stock.oh.val20_25$`Open_High`),
  max(df.vha.tsla_stock.oh.val25_37$`Open_High`)
)
#####

#Low-Date values of Intervals
#####
vha.tsla_stock.ldate.OH <- c(
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
vha.tsla_stock.lprice.OH <- c(
  min(df.vha.tsla_stock.oh.val0_5$`Open_High`),
  min(df.vha.tsla_stock.oh.val5_10$`Open_High`),
  min(df.vha.tsla_stock.oh.val10_15$`Open_High`),
  min(df.vha.tsla_stock.oh.val15_20$`Open_High`),
  min(df.vha.tsla_stock.oh.val20_25$`Open_High`),
  min(df.vha.tsla_stock.oh.val25_37$`Open_High`)
)
#####

df.vha.tsla_stock.stats.OH <- data.frame(
  vha.tsla_stock.rango.OH,
  vha.tsla_stock.cant.OH,
  vha.tsla_stock.avg.OH,
  vha.tsla_stock.de.OH,
  vha.tsla_stock.ir.OH,
  vha.tsla_stock.hdate.OH,
  vha.tsla_stock.hprice.OH,
  vha.tsla_stock.ldate.OH,
  vha.tsla_stock.lprice.OH
)
names(df.vha.tsla_stock.stats.OH) <- 
  c("Rango","Cantidad","Promedio", "Desviacion Estandar", "Dentro del rango","High-Date","High-Price","Low-Date","Low-Price")
View(df.vha.tsla_stock.stats.OH)

write.table(
  x = df.vha.tsla_stock.stats, 
  file = "TSLAStockStats/(3)OHStockStats.csv",
  sep = ","
)
