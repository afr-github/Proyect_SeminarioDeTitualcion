#Base Stats
View(TSLAStock) <- read.csv(
  file = "TSLAStockStats/(0)TSLAStock.csv",
  sep = ",",
  stringsAsFactors = FALSE
)

TSLAStockSelect <- c("Date", "Open", "High", "Low", "Close", "Adj.Close", "Volume")

#Setup
TSLAStock <- subset(
  x = TSLAStock,
  select = TSLAStockSelect
)

#Rango
tsla_stock.rango <- c(
  "140 - 165",
  "165 - 190",
  "190 - 215",
  "215 - 240",
  "240 - 265",
  "265 - 290",
  "290 - 315",
  "315 - 340",
  "340 - 365",
  "365 - 390"
)

#Cant. values of Intervals
tsla_stock.cant<- c(
  nrow(subset(x = TSLAStock, subset = Open > 140 & Open <= 165)),
  nrow(subset(x = TSLAStock, subset = Open > 165 & Open <= 190)),
  nrow(subset(x = TSLAStock, subset = Open > 190 & Open <= 215)),
  nrow(subset(x = TSLAStock, subset = Open > 215 & Open <= 240)),
  nrow(subset(x = TSLAStock, subset = Open > 240 & Open <= 265)),
  nrow(subset(x = TSLAStock, subset = Open > 265 & Open <= 290)),
  nrow(subset(x = TSLAStock, subset = Open > 290 & Open <= 315)),
  nrow(subset(x = TSLAStock, subset = Open > 315 & Open <= 340)),
  nrow(subset(x = TSLAStock, subset = Open > 340 & Open <= 365)),
  nrow(subset(x = TSLAStock, subset = Open > 365 & Open <= 390))
)

#Avg. values of Intervals
tsla_stock.avg <- c(
  mean(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 140 & TSLAStock$Open <= 165)),
  mean(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 165 & TSLAStock$Open <= 190)),
  mean(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 190 & TSLAStock$Open <= 215)),
  mean(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 215 & TSLAStock$Open <= 240)),
  mean(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 240 & TSLAStock$Open <= 265)),
  mean(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 265 & TSLAStock$Open <= 290)),
  mean(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 290 & TSLAStock$Open <= 315)),
  mean(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 315 & TSLAStock$Open <= 340)),
  mean(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 340 & TSLAStock$Open <= 365)),
  mean(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 365 & TSLAStock$Open <= 390))
)

#Standard deviation
tsla_stock.de <- c(
  sd(as.double(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 140 & TSLAStock$Open <= 165))),
  sd(as.double(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 165 & TSLAStock$Open <= 190))),
  sd(as.double(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 190 & TSLAStock$Open <= 215))),
  sd(as.double(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 215 & TSLAStock$Open <= 240))),
  sd(as.double(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 240 & TSLAStock$Open <= 265))),
  sd(as.double(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 265 & TSLAStock$Open <= 290))),
  sd(as.double(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 290 & TSLAStock$Open <= 315))),
  sd(as.double(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 315 & TSLAStock$Open <= 340))),
  sd(as.double(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 340 & TSLAStock$Open <= 365))),
  sd(as.double(subset(x = TSLAStock$Open, subset = TSLAStock$Open > 365 & TSLAStock$Open <= 390)))
)

#In range 
tsla_stock.ir <- c(
  length(subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[1]-tsla_stock.de[1]) & TSLAStock$Open <= (tsla_stock.avg[1]+tsla_stock.de[1]))),
  length(subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[2]-tsla_stock.de[2]) & TSLAStock$Open <= (tsla_stock.avg[2]+tsla_stock.de[2]))),
  length(subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[3]-tsla_stock.de[3]) & TSLAStock$Open <= (tsla_stock.avg[3]+tsla_stock.de[3]))),
  length(subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[4]-tsla_stock.de[4]) & TSLAStock$Open <= (tsla_stock.avg[4]+tsla_stock.de[4]))),
  length(subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[5]-tsla_stock.de[5]) & TSLAStock$Open <= (tsla_stock.avg[5]+tsla_stock.de[5]))),
  length(subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[6]-tsla_stock.de[6]) & TSLAStock$Open <= (tsla_stock.avg[6]+tsla_stock.de[6]))),
  length(subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[7]-tsla_stock.de[7]) & TSLAStock$Open <= (tsla_stock.avg[7]+tsla_stock.de[7]))),
  length(subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[8]-tsla_stock.de[8]) & TSLAStock$Open <= (tsla_stock.avg[8]+tsla_stock.de[8]))),
  length(subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[9]-tsla_stock.de[9]) & TSLAStock$Open <= (tsla_stock.avg[9]+tsla_stock.de[9]))),
  length(subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[10]-tsla_stock.de[10]) & TSLAStock$Open <= (tsla_stock.avg[10]+tsla_stock.de[10])))
)

tsla_stock.stats <- data.frame(
  "Rango" = tsla_stock.rango,
  "Cantidad" = tsla_stock.cant,
  "Promedio" = tsla_stock.avg,
  "Desviacion_Estandar" = tsla_stock.de,
  "Cantidad_dentro_de_desviacion" = tsla_stock.ir
)

View(tsla_stock.stats)

write.table(
  x = tsla_stock.stats, 
  file = "TSLAStockStats/(1)StockStats.csv",
  sep = ","
)