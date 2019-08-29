library(readr)
#Variacion durante horas inactivas
#Open - Low
vha.tsla_stock.ol <- (vha.tsla_stock$Low - vha.tsla_stock$Open)
df.vha.tsla_stock.ol <- data.frame(vha.tsla_stock.ol)
names(df.vha.tsla_stock.ol) <- c("Open-Low")

#Open-Low Intervals
#####
#Open - Low
#0 - -5
df.vha.tsla_stock.ol.val0_m5 <- subset(
  x = df.vha.tsla_stock.ol,
  subset = `Open-Low` < 0 & `Open-Low` >= -5,
  select = c("Open-Low")
)
#-5 - -10
df.vha.tsla_stock.ol.valm5_m10 <- subset(
  x = df.vha.tsla_stock.ol,
  subset = `Open-Low` < -5 & `Open-Low` >= -10,
  select = c("Open-Low")
)
#-10 - -15
df.vha.tsla_stock.ol.valm10_m15 <- subset(
  x = df.vha.tsla_stock.ol,
  subset = `Open-Low` < -10 & `Open-Low` >= -15,
  select = c("Open-Low")
)
#-15 - -20
df.vha.tsla_stock.ol.valm15_m20 <- subset(
  x = df.vha.tsla_stock.ol,
  subset = `Open-Low` < -15 & `Open-Low` >= -20,
  select = c("Open-Low")
)
#-20 - -25
df.vha.tsla_stock.ol.valm20_m25 <- subset(
  x = df.vha.tsla_stock.ol,
  subset = `Open-Low` < -20 & `Open-Low` >= -25,
  select = c("Open-Low")
)
#-25 - -37
df.vha.tsla_stock.ol.valm25_m37 <- subset(
  x = df.vha.tsla_stock.ol,
  subset = `Open-Low` < -25 & `Open-Low` >= -37,
  select = c("Open-Low")
)
##### 

#Seleccion de fechas igual al precio mas alto entre la diferencia de precio
#de: Open-High & Low
#0_m5
#####
hdate0_m5 <- ifelse(
  max(df.vha.tsla_stock.ol.val0_m5$`Open-Low`) == 
    (vha.tsla_stock$Low-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
ldate0_m5 <- ifelse(
  min(df.vha.tsla_stock.ol.val0_m5$`Open-Low`) == 
    (vha.tsla_stock$Low-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
df.hdate0_m5 <- data.frame(
  subset(
    x = hdate0_m5,
    subset = hdate0_m5 != "",
    select = hdate0_m5
  ),
  stringsAsFactors = FALSE
)
df.ldate0_m5 <- data.frame(
  subset(
    x = ldate0_m5,
    subset = ldate0_m5 != "",
    select = ldate0_m5
  ),
  stringsAsFactors = FALSE
)
names(df.hdate0_m5) <- c("Dates")
names(df.ldate0_m5) <- c("Dates")
df.hdate0_m5 <- as.Date(df.hdate0_m5$Dates, "%d/%m/%Y")
df.ldate0_m5 <- as.Date(df.ldate0_m5$Dates, "%d/%m/%Y")
#####

#m5_m10
#####
hdatem5_m10 <- ifelse(
  max(df.vha.tsla_stock.ol.valm5_m10$`Open-Low`) == 
    (vha.tsla_stock$Low-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
ldatem5_m10 <- ifelse(
  min(df.vha.tsla_stock.ol.valm5_m10$`Open-Low`) == 
    (vha.tsla_stock$Low-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
df.hdatem5_m10 <- data.frame(
  subset(
    x = hdatem5_m10,
    subset = hdatem5_m10 != "",
    select = hdatem5_m10
  ),
  stringsAsFactors = FALSE
)
df.ldatem5_m10 <- data.frame(
  subset(
    x = ldatem5_m10,
    subset = ldatem5_m10 != "",
    select = ldatem5_m10
  ),
  stringsAsFactors = FALSE
)
names(df.hdatem5_m10) <- c("Dates")
names(df.ldatem5_m10) <- c("Dates")
df.hdatem5_m10 <- as.Date(df.hdatem5_m10$Dates, "%d/%m/%Y")
df.ldatem5_m10 <- as.Date(df.ldatem5_m10$Dates, "%d/%m/%Y")
#####

#m10_m15
#####
hdatem10_m15 <- ifelse(
  max(df.vha.tsla_stock.ol.valm10_m15$`Open-Low`) == 
    (vha.tsla_stock$Low-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
ldatem10_m15 <- ifelse(
  min(df.vha.tsla_stock.ol.valm10_m15$`Open-Low`) == 
    (vha.tsla_stock$Low-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
df.hdatem10_m15 <- data.frame(
  subset(
    x = hdatem10_m15,
    subset = hdatem10_m15 != "",
    select = hdatem10_m15
  ),
  stringsAsFactors = FALSE
)
df.ldatem10_m15 <- data.frame(
  subset(
    x = ldatem10_m15,
    subset = ldatem10_m15 != "",
    select = ldatem10_m15
  ),
  stringsAsFactors = FALSE
)
names(df.hdatem10_m15) <- c("Dates")
names(df.ldatem10_m15) <- c("Dates")
df.hdatem10_m15 <- as.Date(df.hdatem10_m15$Dates, "%d/%m/%Y")
df.ldatem10_m15 <- as.Date(df.ldatem10_m15$Dates, "%d/%m/%Y")
#####

#m15_m20
#####
hdatem15_m20 <- ifelse(
  max(df.vha.tsla_stock.ol.valm15_m20$`Open-Low`) == 
    (vha.tsla_stock$Low-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
ldatem15_m20 <- ifelse(
  min(df.vha.tsla_stock.ol.valm15_m20$`Open-Low`) == 
    (vha.tsla_stock$Low-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
df.hdatem15_m20 <- data.frame(
  subset(
    x = hdatem15_m20,
    subset = hdatem15_m20 != "",
    select = hdatem15_m20
  ),
  stringsAsFactors = FALSE
)
df.ldatem15_m20 <- data.frame(
  subset(
    x = ldatem15_m20,
    subset = ldatem15_m20 != "",
    select = ldatem15_m20
  ),
  stringsAsFactors = FALSE
)
names(df.hdatem15_m20) <- c("Dates")
names(df.ldatem15_m20) <- c("Dates")
df.hdatem15_m20 <- as.Date(df.hdatem15_m20$Dates, "%d/%m/%Y")
df.ldatem15_m20 <- as.Date(df.ldatem15_m20$Dates, "%d/%m/%Y")
#####

#20_25
#####
hdatem20_m25 <- ifelse(
  max(df.vha.tsla_stock.ol.valm20_m25$`Open-Low`) == 
    (vha.tsla_stock$Low-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
ldatem20_m25 <- ifelse(
  min(df.vha.tsla_stock.ol.valm20_m25$`Open-Low`) == 
    (vha.tsla_stock$Low-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
df.hdatem20_m25 <- data.frame(
  subset(
    x = hdatem20_m25,
    subset = hdatem20_m25 != "",
    select = hdatem20_m25
  ),
  stringsAsFactors = FALSE
)
df.ldatem20_m25 <- data.frame(
  subset(
    x = ldatem20_m25,
    subset = ldatem20_m25 != "",
    select = ldatem20_m25
  ),
  stringsAsFactors = FALSE
)
names(df.hdatem20_m25) <- c("Dates")
names(df.ldatem20_m25) <- c("Dates")
df.hdatem20_m25 <- as.Date(df.hdatem20_m25$Dates, "%d/%m/%Y")
df.ldatem20_m25 <- as.Date(df.ldatem20_m25$Dates, "%d/%m/%Y")
#####

#25_37
#####
hdatem25_m37 <- ifelse(
  max(df.vha.tsla_stock.ol.valm25_m37$`Open-Low`) == 
    (vha.tsla_stock$Low-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
ldatem25_m37 <- ifelse(
  min(df.vha.tsla_stock.ol.valm25_m37$`Open-Low`) == 
    (vha.tsla_stock$Low-vha.tsla_stock$Open),
  vha.tsla_stock$Date,
  ""
)
df.hdatem25_m37 <- data.frame(
  subset(
    x = hdatem25_m37,
    subset = hdatem25_m37 != "",
    select = hdatem25_m37
  ),
  stringsAsFactors = FALSE
)
df.ldatem25_m37 <- data.frame(
  subset(
    x = ldatem25_m37,
    subset = ldatem25_m37 != "",
    select = ldatem25_m37
  ),
  stringsAsFactors = FALSE
)
names(df.hdatem25_m37) <- c("Dates")
names(df.ldatem25_m37) <- c("Dates")
df.hdatem25_m37 <- as.Date(df.hdatem25_m37$Dates, "%d/%m/%Y")
df.ldatem25_m37 <- as.Date(df.ldatem25_m37$Dates, "%d/%m/%Y")
#####


#Cant. values of Intervals
#####
vha.tsla_stock.cantl <- c(
  nrow(df.vha.tsla_stock.ol.val0_m5),
  nrow(df.vha.tsla_stock.ol.valm5_m10),
  nrow(df.vha.tsla_stock.ol.valm10_m15),
  nrow(df.vha.tsla_stock.ol.valm15_m20),
  nrow(df.vha.tsla_stock.ol.valm20_m25),
  nrow(df.vha.tsla_stock.ol.valm25_m37)
)
#####

#Avg. values of Intervals
#####
vha.tsla_stock.avgl <- c(
  mean(df.vha.tsla_stock.ol.val0_m5$`Open-Low`),
  mean(df.vha.tsla_stock.ol.valm5_m10$`Open-Low`),
  mean(df.vha.tsla_stock.ol.valm10_m15$`Open-Low`),
  mean(df.vha.tsla_stock.ol.valm15_m20$`Open-Low`),
  mean(df.vha.tsla_stock.ol.valm20_m25$`Open-Low`),
  mean(df.vha.tsla_stock.ol.valm25_m37$`Open-Low`)
)
#####

#High-Date values of Intervals
#####
vha.tsla_stock.hdatel <- c(
  df.hdate0_m5[1],
  df.hdatem5_m10[1],
  df.hdatem10_m15[1],
  df.hdatem15_m20[1],
  df.hdatem20_m25[1],
  df.hdatem25_m37[1]
)
#####

#High-Price values of Intervals
#####
vha.tsla_stock.hpricel <- c(
  max(df.vha.tsla_stock.ol.val0_m5$`Open-Low`),
  max(df.vha.tsla_stock.ol.valm5_m10$`Open-Low`),
  max(df.vha.tsla_stock.ol.valm10_m15$`Open-Low`),
  max(df.vha.tsla_stock.ol.valm15_m20$`Open-Low`),
  max(df.vha.tsla_stock.ol.valm20_m25$`Open-Low`),
  max(df.vha.tsla_stock.ol.valm25_m37$`Open-Low`)
)
#####

#Low-Date values of Intervals
#####
vha.tsla_stock.ldatel <- c(
  df.ldate0_m5[1],
  df.ldatem5_m10[1],
  df.ldatem10_m15[1],
  df.ldatem15_m20[1],
  df.ldatem20_m25[1],
  df.ldatem25_m37[1]
)
#####

#Low-Price values of Intervals
#####
vha.tsla_stock.lpricel <- c(
  min(df.vha.tsla_stock.ol.val0_m5$`Open-Low`),
  min(df.vha.tsla_stock.ol.valm5_m10$`Open-Low`),
  min(df.vha.tsla_stock.ol.valm10_m15$`Open-Low`),
  min(df.vha.tsla_stock.ol.valm15_m20$`Open-Low`),
  min(df.vha.tsla_stock.ol.valm20_m25$`Open-Low`),
  min(df.vha.tsla_stock.ol.valm25_m37$`Open-Low`)
)
#####

df.vha.tsla_stock.statsl <- data.frame(
  vha.tsla_stock.cantl,
  vha.tsla_stock.avgl,
  vha.tsla_stock.hdatel,
  vha.tsla_stock.hpricel,
  vha.tsla_stock.ldatel,
  vha.tsla_stock.lpricel
)
names(df.vha.tsla_stock.statsl) <- 
  c("Cant","Average","High-Date","High-Price","Low-Date","Low-Price")
View(df.vha.tsla_stock.statsl)












