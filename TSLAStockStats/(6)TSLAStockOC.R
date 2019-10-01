#Variacion durante horas Inactivas
#Open - Close
df.vhia.tsla_stock.oc <- data.frame(
  "Date" = as.Date(TSLAStock$Date, "%d/%m/%Y"),
  "Open" = TSLAStock$Open,
  "Close" = TSLAStock$Close
)

df.vhia.tsla_stock.oc.dif <- 0

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
  "Date" = df.vhia.tsla_stock.oc$Date,
  "Open" = df.vhia.tsla_stock.oc$Open,
  "Close" = df.vhia.tsla_stock.oc$Close,
  "Difference" = df.vhia.tsla_stock.oc.dif <- as.double(df.vhia.tsla_stock.oc.dif),
  stringsAsFactors = FALSE
)

str(df.vhia.tsla_stock.oc.c)

#Open - Close
#-45 - -25
df.vhia.tsla_stock.oc.c.val45_25 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (
    `Difference` > -45 & `Difference` <= -25
  )
)

#-25 - -20
df.vhia.tsla_stock.oc.c.val25_20 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (
    `Difference` > -45 & `Difference` <= -25
  )
)

#-20 - -15
df.vhia.tsla_stock.oc.c.val20_15 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (
    `Difference` > -20 & `Difference` <= -15
  )
)

#-15 - -10
df.vhia.tsla_stock.oc.c.val15_10 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (
    `Difference` > -15 & `Difference` <= -10
  )
)

#-10 - -5
df.vhia.tsla_stock.oc.c.val10_5 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (
    `Difference` > -10 & `Difference` <= -5
  )
)

#-5 - 0
df.vhia.tsla_stock.oc.c.val5_0 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (
    `Difference` > -5 & `Difference` < 0
  )
)

#0-5
df.vhia.tsla_stock.oc.c.val0_5 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (
    `Difference` > 0 & `Difference` <= 5
  )
)

#5-10
df.vhia.tsla_stock.oc.c.val5_10 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (
    `Difference` > 5 & `Difference` <= 10
  )
)

#10-15
df.vhia.tsla_stock.oc.c.val10_15 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (
    `Difference` > 10 & `Difference` <= 15
  )
)

#15-20
df.vhia.tsla_stock.oc.c.val15_20 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (
    `Difference` > 15 & `Difference` <= 20
  )
)

#20-25
df.vhia.tsla_stock.oc.c.val20_25 <- ifelse(
  test = length((df.vhia.tsla_stock.oc.c$`Difference` > 20) && (df.vhia.tsla_stock.oc.c$`Difference` <= 25)) > 1,
  yes = subset(
    x = df.vhia.tsla_stock.oc.c,
    subset = df.vhia.tsla_stock.oc.c$`Difference` > 20 & df.vhia.tsla_stock.oc.c$`Difference` <= 25
  ),
  no = NA
)

#25-45
df.vhia.tsla_stock.oc.c.val25_45 <- subset(
  x = df.vhia.tsla_stock.oc.c,
  subset = (`Difference` > 25) & (`Difference` <= 45)
)

#Seleccion de fechas igual a la varicion entre los dias
#de: Open-High & Low
#-45 - -25
vhia.hdate45_25 <- ifelse(
  test = max(df.vhia.tsla_stock.oc.c.val45_25$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character(df.vhia.tsla_stock.oc.c$Date),
  no = ""
)

vhia.ldate45_25 <- ifelse(
  test = min(df.vhia.tsla_stock.oc.c.val45_25$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character((df.vhia.tsla_stock.oc.c$Date)),
  no = ""
)

df.vhia.hdate45_25 <- data.frame(
  "Dates" = subset(
    x = vhia.hdate45_25,
    subset = vhia.hdate45_25 != ""
  ),
  stringsAsFactors = FALSE
)

df.vhia.ldate45_25 <- data.frame(
  "Dates" = subset(
    x = vhia.ldate45_25,
    subset = vhia.ldate45_25 != ""
  ),
  stringsAsFactors = FALSE
)

#-25 - -20
vhia.hdate25_20 <- ifelse(
  test = max(df.vhia.tsla_stock.oc.c.val25_20$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character(df.vhia.tsla_stock.oc.c$Date),
  no = ""
)

vhia.ldate25_20 <- ifelse(
  test = min(df.vhia.tsla_stock.oc.c.val25_20$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character((df.vhia.tsla_stock.oc.c$Date)),
  no = ""
)

df.vhia.hdate25_20 <- data.frame(
  "Dates" = subset(
    x = vhia.hdate25_20,
    subset = vhia.hdate25_20 != ""
  ),
  stringsAsFactors = FALSE
)

df.vhia.ldate25_20 <- data.frame(
  "Dates" = subset(
    x = vhia.ldate25_20,
    subset = vhia.ldate25_20 != ""
  ),
  stringsAsFactors = FALSE
)

#-20 - -15
vhia.hdate20_15 <- ifelse(
  test = max(df.vhia.tsla_stock.oc.c.val20_15$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character(df.vhia.tsla_stock.oc.c$Date),
  no = ""
)

vhia.ldate20_15 <- ifelse(
  test = min(df.vhia.tsla_stock.oc.c.val20_15$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character((df.vhia.tsla_stock.oc.c$Date)),
  no = ""
)

df.vhia.hdate20_15 <- data.frame(
  "Dates" = subset(
    x = vhia.hdate20_15,
    subset = vhia.hdate20_15 != ""
  ),
  stringsAsFactors = FALSE
)

df.vhia.ldate20_15 <- data.frame(
  "Dates" = subset(
    x = vhia.ldate20_15,
    subset = vhia.ldate20_15 != ""
  ),
  stringsAsFactors = FALSE
)

#-15 - -10
vhia.hdate15_10 <- ifelse(
  test = max(df.vhia.tsla_stock.oc.c.val15_10$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character(df.vhia.tsla_stock.oc.c$Date),
  no = ""
)

vhia.ldate15_10<- ifelse(
  test = min(df.vhia.tsla_stock.oc.c.val15_10$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character((df.vhia.tsla_stock.oc.c$Date)),
  no = ""
)

df.vhia.hdate15_10 <- data.frame(
  "Dates" = subset(
    x = vhia.hdate15_10,
    subset = vhia.hdate15_10 != ""
  ),
  stringsAsFactors = FALSE
)

df.vhia.ldate15_10 <- data.frame(
  "Dates" = subset(
    x = vhia.ldate15_10,
    subset = vhia.ldate15_10 != ""
  ),
  stringsAsFactors = FALSE
)

#-10 - -5
vhia.hdate10_5 <- ifelse(
  test = max(df.vhia.tsla_stock.oc.c.val10_5$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character(df.vhia.tsla_stock.oc.c$Date),
  no = ""
)

vhia.ldate10_5<- ifelse(
  test = min(df.vhia.tsla_stock.oc.c.val10_5$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character((df.vhia.tsla_stock.oc.c$Date)),
  no = ""
)

df.vhia.hdate10_5<- data.frame(
  "Dates" = subset(
    x = vhia.hdate10_5,
    subset = vhia.hdate10_5 != ""
  ),
  stringsAsFactors = FALSE
)

df.vhia.ldate10_5 <- data.frame(
  "Dates" = subset(
    x = vhia.ldate10_5,
    subset = vhia.ldate10_5 != ""
  ),
  stringsAsFactors = FALSE
)

#-5 - 0
vhia.hdate5_0 <- ifelse(
  test = max(df.vhia.tsla_stock.oc.c.val5_0$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character(df.vhia.tsla_stock.oc.c$Date),
  no = ""
)

vhia.ldate5_0<- ifelse(
  test = min(df.vhia.tsla_stock.oc.c.val5_0$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character((df.vhia.tsla_stock.oc.c$Date)),
  no = ""
)

df.vhia.hdate5_0<- data.frame(
  "Dates" = subset(
    x = vhia.hdate5_0,
    subset = vhia.hdate5_0 != ""
  ),
  stringsAsFactors = FALSE
)

df.vhia.ldate5_0 <- data.frame(
  "Dates" = subset(
    x = vhia.ldate5_0,
    subset = vhia.ldate5_0 != ""
  ),
  stringsAsFactors = FALSE
)

#0 - 5
vhia.hdate0_5 <- ifelse(
  test = max(df.vhia.tsla_stock.oc.c.val0_5$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character(df.vhia.tsla_stock.oc.c$Date),
  no = ""
)

vhia.ldate0_5<- ifelse(
  test = min(df.vhia.tsla_stock.oc.c.val0_5$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character((df.vhia.tsla_stock.oc.c$Date)),
  no = ""
)

df.vhia.hdate0_5<- data.frame(
  "Dates" = subset(
    x = vhia.hdate0_5,
    subset = vhia.hdate0_5 != ""
  ),
  stringsAsFactors = FALSE
)

df.vhia.ldate0_5 <- data.frame(
  "Dates" = subset(
    x = vhia.ldate0_5,
    subset = vhia.ldate0_5 != ""
  ),
  stringsAsFactors = FALSE
)

#5 - 10
vhia.hdate5_10 <- ifelse(
  test = max(df.vhia.tsla_stock.oc.c.val5_10$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character(df.vhia.tsla_stock.oc.c$Date),
  no = ""
)

vhia.ldate5_10 <- ifelse(
  test = min(df.vhia.tsla_stock.oc.c.val5_10$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character((df.vhia.tsla_stock.oc.c$Date)),
  no = ""
)

df.vhia.hdate5_10 <- data.frame(
  "Dates" = subset(
    x = vhia.hdate5_10,
    subset = vhia.hdate5_10 != ""
  ),
  stringsAsFactors = FALSE
)

df.vhia.ldate5_10 <- data.frame(
  "Dates" = subset(
    x = vhia.ldate5_10,
    subset = vhia.ldate5_10 != ""
  ),
  stringsAsFactors = FALSE
)

#10 - 15
vhia.hdate10_15 <- ifelse(
  test = max(df.vhia.tsla_stock.oc.c.val10_15$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character(df.vhia.tsla_stock.oc.c$Date),
  no = ""
)

vhia.ldate10_15 <- ifelse(
  test = min(df.vhia.tsla_stock.oc.c.val10_15$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character((df.vhia.tsla_stock.oc.c$Date)),
  no = ""
)

df.vhia.hdate10_15 <- data.frame(
  "Dates" = subset(
    x = vhia.hdate10_15,
    subset = vhia.hdate10_15 != ""
  ),
  stringsAsFactors = FALSE
)

df.vhia.ldate10_15 <- data.frame(
  "Dates" = subset(
    x = vhia.ldate10_15,
    subset = vhia.ldate10_15 != ""
  ),
  stringsAsFactors = FALSE
)

#15 - 20
vhia.hdate15_20 <- ifelse(
  test = max(df.vhia.tsla_stock.oc.c.val15_20$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character(df.vhia.tsla_stock.oc.c$Date),
  no = ""
)

vhia.ldate15_20 <- ifelse(
  test = min(df.vhia.tsla_stock.oc.c.val15_20$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character((df.vhia.tsla_stock.oc.c$Date)),
  no = ""
)

df.vhia.hdate15_20 <- data.frame(
  "Dates" = subset(
    x = vhia.hdate15_20,
    subset = vhia.hdate15_20 != ""
  ),
  stringsAsFactors = FALSE
)

df.vhia.ldate15_20 <- data.frame(
  "Dates" = subset(
    x = vhia.ldate15_20,
    subset = vhia.ldate15_20 != ""
  ),
  stringsAsFactors = FALSE
)


df.vhia.tsla_stock.oc.c.val20_25

#20 - 25
vhia.hdate20_25 <- ifelse(
  test = max(df.vhia.tsla_stock.oc.c.val20_25) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character(df.vhia.tsla_stock.oc.c$Date),
  no = ""
)

vhia.ldate20_25 <- ifelse(
  test = min(df.vhia.tsla_stock.oc.c.val20_25) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character((df.vhia.tsla_stock.oc.c$Date)),
  no = ""
)

df.vhia.hdate20_25 <- data.frame(
  "Dates" = subset(
    x = vhia.hdate20_25,
    subset = vhia.hdate20_25 != ""
  ),
  stringsAsFactors = FALSE
)

df.vhia.ldate20_25 <- data.frame(
  "Dates" = subset(
    x = vhia.ldate20_25,
    subset = vhia.ldate20_25 != ""
  ),
  stringsAsFactors = FALSE
)

#25 - 45
vhia.hdate25_45 <- ifelse(
  test = max(df.vhia.tsla_stock.oc.c.val25_45$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character(df.vhia.tsla_stock.oc.c$Date),
  no = ""
)

vhia.ldate25_45 <- ifelse(
  test = min(df.vhia.tsla_stock.oc.c.val25_45$Difference) == (df.vhia.tsla_stock.oc.c$Difference),
  yes = as.character((df.vhia.tsla_stock.oc.c$Date)),
  no = ""
)

df.vhia.hdate25_45 <- data.frame(
  "Dates" = subset(
    x = vhia.hdate25_45,
    subset = vhia.hdate25_45 != ""
  ),
  stringsAsFactors = FALSE
)

df.vhia.ldate25_45 <- data.frame(
  "Dates" = subset(
    x = vhia.ldate25_45,
    subset = vhia.ldate25_45 != ""
  ),
  stringsAsFactors = FALSE
)

#Rango de variables
vhia.tsla_stock.rango.OC <- c(
  "-45 - -25",
  "-25 - -20",
  "-20 - -15",
  "-15 - -10",
  "-10 - -5",
  "-5 - 0",
  "0 - 5",
  "5 - 10",
  "10 - 15",
  "15 - 20",
  "20 - 25",
  "25 - 45"
)

#Cantidad de elementos por rango
vhia.tsla_stock.cant.OC <- c(
  nrow(df.vhia.tsla_stock.oc.c.val45_25),
  nrow(df.vhia.tsla_stock.oc.c.val25_20),
  nrow(df.vhia.tsla_stock.oc.c.val20_15),
  nrow(df.vhia.tsla_stock.oc.c.val15_10),
  nrow(df.vhia.tsla_stock.oc.c.val10_5),
  nrow(df.vhia.tsla_stock.oc.c.val5_0),
  nrow(df.vhia.tsla_stock.oc.c.val0_5),
  nrow(df.vhia.tsla_stock.oc.c.val5_10),
  nrow(df.vhia.tsla_stock.oc.c.val10_15),
  nrow(df.vhia.tsla_stock.oc.c.val15_20),
  ifelse(is.na(df.vhia.tsla_stock.oc.c.val20_25), "0", nrow(df.vhia.tsla_stock.oc.c.val20_25)),
  nrow(df.vhia.tsla_stock.oc.c.val25_45)
)

#Promedio de rango
vhia.tsla_stock.avg.OC <- c(
  mean(df.vhia.tsla_stock.oc.c.val45_25$Difference),
  mean(df.vhia.tsla_stock.oc.c.val25_20$Difference),
  mean(df.vhia.tsla_stock.oc.c.val20_15$Difference),
  mean(df.vhia.tsla_stock.oc.c.val15_10$Difference),
  mean(df.vhia.tsla_stock.oc.c.val10_5$Difference),
  mean(df.vhia.tsla_stock.oc.c.val5_0$Difference),
  mean(df.vhia.tsla_stock.oc.c.val0_5$Difference),
  mean(df.vhia.tsla_stock.oc.c.val5_10$Difference),
  mean(df.vhia.tsla_stock.oc.c.val10_15$Difference),
  mean(df.vhia.tsla_stock.oc.c.val15_20$Difference),
  ifelse(is.na(df.vhia.tsla_stock.oc.c.val20_25), "0", mean(df.vhia.tsla_stock.oc.c.val20_25)),
  mean(df.vhia.tsla_stock.oc.c.val25_45$Difference)
)

#Desviasion estandar de rango
vhia.tsla_stock.de.OC <- c(
  sd(as.double(df.vhia.tsla_stock.oc.c.val45_25$Difference)),
  sd(as.double(df.vhia.tsla_stock.oc.c.val25_20$Difference)),
  sd(as.double(df.vhia.tsla_stock.oc.c.val20_15$Difference)),
  sd(as.double(df.vhia.tsla_stock.oc.c.val15_10$Difference)),
  sd(as.double(df.vhia.tsla_stock.oc.c.val10_5$Difference)),
  sd(as.double(df.vhia.tsla_stock.oc.c.val5_0$Difference)),
  sd(as.double(df.vhia.tsla_stock.oc.c.val0_5$Difference)),
  sd(as.double(df.vhia.tsla_stock.oc.c.val5_10$Difference)),
  sd(as.double(df.vhia.tsla_stock.oc.c.val10_15$Difference)),
  sd(as.double(df.vhia.tsla_stock.oc.c.val15_20$Difference)),
  ifelse(is.na((as.double(df.vhia.tsla_stock.oc.c.val20_25))), "0", sd(as.double(df.vhia.tsla_stock.oc.c.val20_25))),
  sd(as.double(df.vhia.tsla_stock.oc.c.val25_45$Difference))
)

#In range of sd
vhia.tsla_stock.ir.OC <- c(
  nrow(subset(x = df.vhia.tsla_stock.oc.c, subset = `Difference` >= (vha.tsla_stock.avg.OC[1]-vha.tsla_stock.de.OC[1]) & `Difference` <= (vha.tsla_stock.avg.OC[1]+vha.tsla_stock.de.OC[1]))),
  nrow(subset(x = df.vhia.tsla_stock.oc.c, subset = `Difference` >= (vha.tsla_stock.avg.OC[2]-vha.tsla_stock.de.OC[2]) & `Difference` <= (vha.tsla_stock.avg.OC[2]+vha.tsla_stock.de.OC[2]))),
  nrow(subset(x = df.vhia.tsla_stock.oc.c, subset = `Difference` >= (vha.tsla_stock.avg.OC[3]-vha.tsla_stock.de.OC[3]) & `Difference` <= (vha.tsla_stock.avg.OC[3]+vha.tsla_stock.de.OC[3]))),
  nrow(subset(x = df.vhia.tsla_stock.oc.c, subset = `Difference` >= (vha.tsla_stock.avg.OC[4]-vha.tsla_stock.de.OC[4]) & `Difference` <= (vha.tsla_stock.avg.OC[4]+vha.tsla_stock.de.OC[4]))),
  nrow(subset(x = df.vhia.tsla_stock.oc.c, subset = `Difference` >= (vha.tsla_stock.avg.OC[5]-vha.tsla_stock.de.OC[5]) & `Difference` <= (vha.tsla_stock.avg.OC[5]+vha.tsla_stock.de.OC[5]))),
  nrow(subset(x = df.vhia.tsla_stock.oc.c, subset = `Difference` >= (vha.tsla_stock.avg.OC[6]-vha.tsla_stock.de.OC[6]) & `Difference` <= (vha.tsla_stock.avg.OC[6]+vha.tsla_stock.de.OC[6]))),
  nrow(subset(x = df.vhia.tsla_stock.oc.c, subset = `Difference` >= (vha.tsla_stock.avg.OC[7]-vha.tsla_stock.de.OC[7]) & `Difference` <= (vha.tsla_stock.avg.OC[7]+vha.tsla_stock.de.OC[7]))),
  nrow(subset(x = df.vhia.tsla_stock.oc.c, subset = `Difference` >= (vha.tsla_stock.avg.OC[8]-vha.tsla_stock.de.OC[8]) & `Difference` <= (vha.tsla_stock.avg.OC[8]+vha.tsla_stock.de.OC[8]))),
  nrow(subset(x = df.vhia.tsla_stock.oc.c, subset = `Difference` >= (vha.tsla_stock.avg.OC[9]-vha.tsla_stock.de.OC[9]) & `Difference` <= (vha.tsla_stock.avg.OC[9]+vha.tsla_stock.de.OC[9]))),
  nrow(subset(x = df.vhia.tsla_stock.oc.c, subset = `Difference` >= (vha.tsla_stock.avg.OC[10]-vha.tsla_stock.de.OC[10]) & `Difference` <= (vha.tsla_stock.avg.OC[10]+vha.tsla_stock.de.OC[10]))),
  nrow(subset(x = df.vhia.tsla_stock.oc.c, subset = `Difference` >= (vha.tsla_stock.avg.OC[11]-vha.tsla_stock.de.OC[11]) & `Difference` <= (vha.tsla_stock.avg.OC[11]+vha.tsla_stock.de.OC[11]))),
  nrow(subset(x = df.vhia.tsla_stock.oc.c, subset = `Difference` >= (vha.tsla_stock.avg.OC[12]-vha.tsla_stock.de.OC[12]) & `Difference` <= (vha.tsla_stock.avg.OC[12]+vha.tsla_stock.de.OC[12])))
)

#Fecha de precio mas alto
vhia.tsla_stock.hdate.OC <- c(
  df.vhia.hdate45_25[1],
  df.vhia.hdate25_20[1],
  df.vhia.hdate20_15[1],
  df.vhia.hdate15_10[1],
  df.vhia.hdate10_5[1,1],
  df.vhia.hdate5_0[1],
  df.vhia.hdate0_5[1],
  df.vhia.hdate5_10[1],
  df.vhia.hdate10_15[1],
  df.vhia.hdate15_20[1],
  df.vhia.hdate20_25[1],
  df.vhia.hdate25_45[1]
)

#Precio mas alto
vhia.tsla_stock.hprice.OC <- c(
  max(df.vhia.tsla_stock.oc.c.val45_25$Difference),
  max(df.vhia.tsla_stock.oc.c.val25_20$Difference),
  max(df.vhia.tsla_stock.oc.c.val20_15$Difference),
  max(df.vhia.tsla_stock.oc.c.val15_10$Difference),
  max(df.vhia.tsla_stock.oc.c.val10_5$Difference),
  max(df.vhia.tsla_stock.oc.c.val5_0$Difference),
  max(df.vhia.tsla_stock.oc.c.val0_5$Difference),
  max(df.vhia.tsla_stock.oc.c.val5_10$Difference),
  max(df.vhia.tsla_stock.oc.c.val10_15$Difference),
  max(df.vhia.tsla_stock.oc.c.val15_20$Difference),
  ifelse(is.na((df.vhia.tsla_stock.oc.c.val20_25)), "", max(df.vhia.tsla_stock.oc.c.val20_25)),
  max(df.vhia.tsla_stock.oc.c.val25_45$Difference)
)

vhia.tsla_stock.ldate.OC <- c(
  df.vhia.ldate45_25[1],
  df.vhia.ldate25_20[1],
  df.vhia.ldate20_15[1],
  df.vhia.ldate15_10[1],
  df.vhia.ldate10_5[1],
  df.vhia.ldate5_0[1],
  df.vhia.ldate0_5[1],
  df.vhia.ldate5_10[1],
  df.vhia.ldate10_15[1],
  df.vhia.ldate15_20[1],
  df.vhia.ldate20_25[1],
  df.vhia.ldate25_45[1]
)

vhia.tsla_stock.lprice.OC <- c(
  min(df.vhia.tsla_stock.oc.c.val45_25$Difference),
  min(df.vhia.tsla_stock.oc.c.val25_20$Difference),
  min(df.vhia.tsla_stock.oc.c.val20_15$Difference),
  min(df.vhia.tsla_stock.oc.c.val15_10$Difference),
  min(df.vhia.tsla_stock.oc.c.val10_5$Difference),
  min(df.vhia.tsla_stock.oc.c.val5_0$Difference),
  min(df.vhia.tsla_stock.oc.c.val0_5$Difference),
  min(df.vhia.tsla_stock.oc.c.val5_10$Difference),
  min(df.vhia.tsla_stock.oc.c.val10_15$Difference),
  min(df.vhia.tsla_stock.oc.c.val15_20$Difference),
  min(df.vhia.tsla_stock.oc.c.val20_25),
  min(df.vhia.tsla_stock.oc.c.val25_45)
)

df.vha.tsla_stock.stats.OC <- data.frame(
  vhia.tsla_stock.rango.OC,
  vhia.tsla_stock.cant.OC,
  vhia.tsla_stock.avg.OC,
  vhia.tsla_stock.de.OC,
  vhia.tsla_stock.ir.OC,
  vhia.tsla_stock.hdate.OC,
  vhia.tsla_stock.hprice.OC,
  vhia.tsla_stock.ldate.OC,
  vhia.tsla_stock.lprice.OC
)

names(df.vha.tsla_stock.stats.OC) <- 
  c("Rango","Cantidad","Promedio", "Desviacion Estandar", "Dentro del rango","High-Date","High-Price")#,"Low-Date")#,"Low-Price")

View(df.vha.tsla_stock.stats.OC)

write.table(
  x = df.vha.tsla_stock.stats, 
  file = "TSLAStockStats/(5)OCStockStats.csv",
  sep = ","
)




