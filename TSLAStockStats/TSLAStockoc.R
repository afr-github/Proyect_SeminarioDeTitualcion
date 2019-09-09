#Variacion durante horas Inactivas
#Open - Close
df.vhia.tsla_stock.oc <- data.frame(
  as.Date(vha.tsla_stock$Date, "%d/%m/%Y"),
  vha.tsla_stock$Open,
  vha.tsla_stock$Close
)
names(df.vhia.tsla_stock.oc) <- c("Date", "Open", "Close")

#Get variation from Open current and close previous day
for(i in 1:nrow(df.vhia.tsla_stock.oc)){
  ifelse(
    df.vhia.tsla_stock.oc$Date[i] != as.Date("02/06/2014", "%d/%m/%Y"),
    df.vhia.tsla_stock.oc.dif[i] <- c(df.vhia.tsla_stock.oc$Open[i] - df.vhia.tsla_stock.oc$Close[i-1]),
    df.vhia.tsla_stock.oc.dif[i] <- c("0")
  )
}

#Create data frame with variation
df.vhia.tsla_stock.oc.c <- data.frame(
  df.vhia.tsla_stock.oc$Date,
  df.vhia.tsla_stock.oc$Open,
  df.vhia.tsla_stock.oc$Close,
  df.vhia.tsla_stock.oc.dif <- as.double(df.vhia.tsla_stock.oc.dif),
  stringsAsFactors = FALSE
)

names(df.vhia.tsla_stock.oc.c) <- 
  c("Date","Open","Close","Diference")
View(df.vhia.tsla_stock.oc.c)

#Open - Close
#0-5
df.vhia.tsla_stock.oc.c.val0_5 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (
      df.vhia.tsla_stock.oc.c$Diference > 0 & df.vhia.tsla_stock.oc.c$Diference <= 5
  ),
  select = c("Date","Open","Close","Diference")
)

#5-10
df.vhia.tsla_stock.oc.c.val5_10 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (
    df.vhia.tsla_stock.oc.c$Diference > 5 & df.vhia.tsla_stock.oc.c$Diference <= 10
  ),
  select = c("Date","Open","Close","Diference")
)

#10-15
df.vhia.tsla_stock.oc.c.val10_15 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (
    df.vhia.tsla_stock.oc.c$Diference > 10 & df.vhia.tsla_stock.oc.c$Diference <= 15
  ),
  select = c("Date","Open","Close","Diference")
)

#15-20
df.vhia.tsla_stock.oc.c.val15_20 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (
    df.vhia.tsla_stock.oc.c$Diference > 15 & df.vhia.tsla_stock.oc.c$Diference <= 20
  ),
  select = c("Date","Open","Close","Diference")
)

#20-25
df.vhia.tsla_stock.oc.c.val20_25 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (
    df.vhia.tsla_stock.oc.c$Diference > 20 & df.vhia.tsla_stock.oc.c$Diference <= 25
  ),
  select = c("Date","Open","Close","Diference")
)

#25-37
df.vhia.tsla_stock.oc.c.val25_37 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (
    df.vhia.tsla_stock.oc.c$Diference > 25 & df.vhia.tsla_stock.oc.c$Diference <= 37
  ),
  select = c("Date","Open","Close","Diference")
)

#Seleccion de fechas igual a la varicion entre los dias
#de: Open-High & Low
#0-5
vhia.hdate0_5 <- ifelse(
  (max(df.vhia.tsla_stock.oc.c.val0_5$Diference) == 
    (df.vhia.tsla_stock.oc.c.val0_5$Diference)),
  df.vhia.tsla_stock.oc.c.val0_5$Date,
  ""
)

str(df.vhia.tsla_stock.oc.c.val0_5)

View(vhia.hdate0_5)













