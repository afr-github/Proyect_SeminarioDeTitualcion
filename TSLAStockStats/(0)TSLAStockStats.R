#Base file

#NOTAS:
# Las tablas de las graficas independientes por si es requeido para poder procesar información independiente y se
# prestablece un nombre para la grafica para poder identificar la en caso de ser necesario.

TSLAStock <- read.csv(
  file = "TSLAStockStats/(0)TSLAStock.csv",
  sep = ",",
  stringsAsFactors = FALSE
)

#Cadena de columnas que se van utilizar
#No se inclue "Adj.Close" ya que es igual que el precio de "Close"

TSLAStockSelect <- c(
  "Date", "Open", "High", "Low", "Close", "Volume"
)

#Setup
TSLAStock <- subset(
  x = TSLAStock,
  select = TSLAStockSelect
)

##### Datos del precio de apertura 
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

#Grafica 1
#Cantidad de dias dentro de cada rango
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

#Tabla para la Grafica 1
tsla_stock.open_statsG1 <- data.frame(
  "Rango" = tsla_stock.rango,
  "Cantidad" = tsla_stock.cant 
)

#Grafica2
#Promedio del precio de apertura por cada rango
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

#Desviación estandar del precio de apertura por cada rango
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

#Cantidad de dias dentro de la desviacíon estandar de cada rango del precio de apertura
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

#Tabla para la Grafica 2
tsla_stock.open_statsG2 <- data.frame(
  "Promedio" = tsla_stock.avg,
  "Desviacion_Estandar" = tsla_stock.de,
  "Cantidad_dentro_de_desviacion" = tsla_stock.ir
)

#Grafica 3
#Cantidad de dias fuera de la desviación estandar del precio de apertura
tsla_stock.or <- c(
  tsla_stock.cant[1]-tsla_stock.ir[1],
  tsla_stock.cant[2]-tsla_stock.ir[2],
  tsla_stock.cant[3]-tsla_stock.ir[3],
  tsla_stock.cant[4]-tsla_stock.ir[4],
  tsla_stock.cant[5]-tsla_stock.ir[5],
  tsla_stock.cant[6]-tsla_stock.ir[6],
  tsla_stock.cant[7]-tsla_stock.ir[7],
  tsla_stock.cant[8]-tsla_stock.ir[8],
  tsla_stock.cant[9]-tsla_stock.ir[9],
  tsla_stock.cant[10]-tsla_stock.ir[10]
)

#Tabla para la Grafica 3
tsla_stock.open_statsG3 <- data.frame(
  "Cantidad_de_dias_fuera_de_la_desviacion_estandar" = tsla_stock.or
)

#Combinación de las 3 tablas anteriores
tsla_stock.open_stats <- cbind(
  tsla_stock.open_statsG1,
  tsla_stock.open_statsG2,
  tsla_stock.open_statsG3
)

#Creación del documento
write.table(
  x = tsla_stock.open_stats, 
  file = "TSLAStockStats/(1)OpenStockStats.csv",
  sep = ","
)

##### Datos del precio mas alto
#Grafica 4
#Cantidad de dias dentro de cada rango para el precio mas alto
tsla_stock.cant_high <- c(
  nrow(subset(x = TSLAStock, subset = High > 140 & High <= 165)),
  nrow(subset(x = TSLAStock, subset = High > 165 & High <= 190)),
  nrow(subset(x = TSLAStock, subset = High > 190 & High <= 215)),
  nrow(subset(x = TSLAStock, subset = High > 215 & High <= 240)),
  nrow(subset(x = TSLAStock, subset = High > 240 & High <= 265)),
  nrow(subset(x = TSLAStock, subset = High > 265 & High <= 290)),
  nrow(subset(x = TSLAStock, subset = High > 290 & High <= 315)),
  nrow(subset(x = TSLAStock, subset = High > 315 & High <= 340)),
  nrow(subset(x = TSLAStock, subset = High > 340 & High <= 365)),
  nrow(subset(x = TSLAStock, subset = High > 365 & High <= 390))
)

#Tabla para la Grafica 4
tsla_stock.high_statsG4 <- data.frame(
  "Rango" = tsla_stock.rango,
  "Cantidad" = tsla_stock.cant_high
)

#Grafica 5
#Promedio del precio mas alto por cada rango
tsla_stock.avg_high <- c(
  mean(subset(x = TSLAStock$High, subset = TSLAStock$High > 140 & TSLAStock$High <= 165)),
  mean(subset(x = TSLAStock$High, subset = TSLAStock$High > 165 & TSLAStock$High <= 190)),
  mean(subset(x = TSLAStock$High, subset = TSLAStock$High > 190 & TSLAStock$High <= 215)),
  mean(subset(x = TSLAStock$High, subset = TSLAStock$High > 215 & TSLAStock$High <= 240)),
  mean(subset(x = TSLAStock$High, subset = TSLAStock$High > 240 & TSLAStock$High <= 265)),
  mean(subset(x = TSLAStock$High, subset = TSLAStock$High > 265 & TSLAStock$High <= 290)),
  mean(subset(x = TSLAStock$High, subset = TSLAStock$High > 290 & TSLAStock$High <= 315)),
  mean(subset(x = TSLAStock$High, subset = TSLAStock$High > 315 & TSLAStock$High <= 340)),
  mean(subset(x = TSLAStock$High, subset = TSLAStock$High > 340 & TSLAStock$High <= 365)),
  mean(subset(x = TSLAStock$High, subset = TSLAStock$High > 365 & TSLAStock$High <= 390))
)

#Desviación estandar del precio mas alto por cada rango
tsla_stock.de_high <- c(
  sd(as.double(subset(x = TSLAStock$High, subset = TSLAStock$High > 140 & TSLAStock$High <= 165))),
  sd(as.double(subset(x = TSLAStock$High, subset = TSLAStock$High > 165 & TSLAStock$High <= 190))),
  sd(as.double(subset(x = TSLAStock$High, subset = TSLAStock$High > 190 & TSLAStock$High <= 215))),
  sd(as.double(subset(x = TSLAStock$High, subset = TSLAStock$High > 215 & TSLAStock$High <= 240))),
  sd(as.double(subset(x = TSLAStock$High, subset = TSLAStock$High > 240 & TSLAStock$High <= 265))),
  sd(as.double(subset(x = TSLAStock$High, subset = TSLAStock$High > 265 & TSLAStock$High <= 290))),
  sd(as.double(subset(x = TSLAStock$High, subset = TSLAStock$High > 290 & TSLAStock$High <= 315))),
  sd(as.double(subset(x = TSLAStock$High, subset = TSLAStock$High > 315 & TSLAStock$High <= 340))),
  sd(as.double(subset(x = TSLAStock$High, subset = TSLAStock$High > 340 & TSLAStock$High <= 365))),
  sd(as.double(subset(x = TSLAStock$High, subset = TSLAStock$High > 365 & TSLAStock$High <= 390)))
)

#Cantidad de dias dentro de la desviacíon estandar de cada rango del precio mas alto
tsla_stock.ir_high <- c(
  length(subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[1]-tsla_stock.de_high[1]) & TSLAStock$High <= (tsla_stock.avg_high[1]+tsla_stock.de_high[1]))),
  length(subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[2]-tsla_stock.de_high[2]) & TSLAStock$High <= (tsla_stock.avg_high[2]+tsla_stock.de_high[2]))),
  length(subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[3]-tsla_stock.de_high[3]) & TSLAStock$High <= (tsla_stock.avg_high[3]+tsla_stock.de_high[3]))),
  length(subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[4]-tsla_stock.de_high[4]) & TSLAStock$High <= (tsla_stock.avg_high[4]+tsla_stock.de_high[4]))),
  length(subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[5]-tsla_stock.de_high[5]) & TSLAStock$High <= (tsla_stock.avg_high[5]+tsla_stock.de_high[5]))),
  length(subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[6]-tsla_stock.de_high[6]) & TSLAStock$High <= (tsla_stock.avg_high[6]+tsla_stock.de_high[6]))),
  length(subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[7]-tsla_stock.de_high[7]) & TSLAStock$High <= (tsla_stock.avg_high[7]+tsla_stock.de_high[7]))),
  length(subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[8]-tsla_stock.de_high[8]) & TSLAStock$High <= (tsla_stock.avg_high[8]+tsla_stock.de_high[8]))),
  length(subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[9]-tsla_stock.de_high[9]) & TSLAStock$High <= (tsla_stock.avg_high[9]+tsla_stock.de_high[9]))),
  length(subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[10]-tsla_stock.de_high[10]) & TSLAStock$High <= (tsla_stock.avg_high[10]+tsla_stock.de_high[10])))
)

#Tabla para la Grafica 5
tsla_stock.high_statsG5 <- data.frame(
  "Promedio" = tsla_stock.avg_high,
  "Desviacion_Estandar" = tsla_stock.de_high,
  "Cantidad_dentro_de_desviacion" = tsla_stock.ir_high
)

#Grafica 6
#Cantidad de dias fuera de la desviación estandar
tsla_stock.or_high <- c(
  tsla_stock.cant_high[1]-tsla_stock.ir_high[1],
  tsla_stock.cant_high[2]-tsla_stock.ir_high[2],
  tsla_stock.cant_high[3]-tsla_stock.ir_high[3],
  tsla_stock.cant_high[4]-tsla_stock.ir_high[4],
  tsla_stock.cant_high[5]-tsla_stock.ir_high[5],
  tsla_stock.cant_high[6]-tsla_stock.ir_high[6],
  tsla_stock.cant_high[7]-tsla_stock.ir_high[7],
  tsla_stock.cant_high[8]-tsla_stock.ir_high[8],
  tsla_stock.cant_high[9]-tsla_stock.ir_high[9],
  tsla_stock.cant_high[10]-tsla_stock.ir_high[10]
)

#Tabla para la Grafica 6
tsla_stock.high_statsG6 <- data.frame(
  "Cantidad_de_dias_fuera_de_la_desviacion_estandar" = tsla_stock.or_high
)

#cominación de las ultimas 3 tablas
tsla_stock.high_stats <- cbind(
  tsla_stock.high_statsG4,
  tsla_stock.high_statsG5,
  tsla_stock.high_statsG6
)

# Union de las tablas de open_stats y high_stats
tsla_stock.c_stats <- merge(
  tsla_stock.c_open_stats,
  tsla_stock.c_high_stats,
  by =  "Date",
  all = TRUE,
  suffixes = c("_Open","_High")
)

#Creación del documento
write.table(
  x = tsla_stock.high_stats, 
  file = "TSLAStockStats/(2)HighStockStats.csv",
  sep = ","
)

##### Datos para el precio mas bajo
#Grafica 7
#Promedio del precio mas bajo por cada rango
tsla_stock.cant_low <- c(
  nrow(subset(x = TSLAStock, subset = Low > 140 & Low <= 165)),
  nrow(subset(x = TSLAStock, subset = Low > 165 & Low <= 190)),
  nrow(subset(x = TSLAStock, subset = Low > 190 & Low <= 215)),
  nrow(subset(x = TSLAStock, subset = Low > 215 & Low <= 240)),
  nrow(subset(x = TSLAStock, subset = Low > 240 & Low <= 265)),
  nrow(subset(x = TSLAStock, subset = Low > 265 & Low <= 290)),
  nrow(subset(x = TSLAStock, subset = Low > 290 & Low <= 315)),
  nrow(subset(x = TSLAStock, subset = Low > 315 & Low <= 340)),
  nrow(subset(x = TSLAStock, subset = Low > 340 & Low <= 365)),
  nrow(subset(x = TSLAStock, subset = Low > 365 & Low <= 390))
)

#Tabla para la Grafica 7
tsla_stock.low_statsG7 <- data.frame(
  "Rango" = tsla_stock.rango,
  "Cantidad" = tsla_stock.cant_low
)

#Grafica8
#Promedio de precio mas bajo por cada rango
tsla_stock.avg_low <- c(
  mean(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 140 & TSLAStock$Low <= 165)),
  mean(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 165 & TSLAStock$Low <= 190)),
  mean(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 190 & TSLAStock$Low <= 215)),
  mean(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 215 & TSLAStock$Low <= 240)),
  mean(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 240 & TSLAStock$Low <= 265)),
  mean(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 265 & TSLAStock$Low <= 290)),
  mean(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 290 & TSLAStock$Low <= 315)),
  mean(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 315 & TSLAStock$Low <= 340)),
  mean(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 340 & TSLAStock$Low <= 365)),
  mean(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 365 & TSLAStock$Low <= 390))
)

#Desviación estandar del precio mas bajo por cada rango 
tsla_stock.de_low <- c(
  sd(as.double(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 140 & TSLAStock$Low <= 165))),
  sd(as.double(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 165 & TSLAStock$Low <= 190))),
  sd(as.double(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 190 & TSLAStock$Low <= 215))),
  sd(as.double(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 215 & TSLAStock$Low <= 240))),
  sd(as.double(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 240 & TSLAStock$Low <= 265))),
  sd(as.double(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 265 & TSLAStock$Low <= 290))),
  sd(as.double(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 290 & TSLAStock$Low <= 315))),
  sd(as.double(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 315 & TSLAStock$Low <= 340))),
  sd(as.double(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 340 & TSLAStock$Low <= 365))),
  sd(as.double(subset(x = TSLAStock$Low, subset = TSLAStock$Low > 365 & TSLAStock$Low <= 390)))
)

#Cantidad de dias dentro de la desviacíon estandar de cada rango
tsla_stock.ir_low <- c(
  length(subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[1]-tsla_stock.de_low[1]) & TSLAStock$Low <= (tsla_stock.avg_low[1]+tsla_stock.de_low[1]))),
  length(subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[2]-tsla_stock.de_low[2]) & TSLAStock$Low <= (tsla_stock.avg_low[2]+tsla_stock.de_low[2]))),
  length(subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[3]-tsla_stock.de_low[3]) & TSLAStock$Low <= (tsla_stock.avg_low[3]+tsla_stock.de_low[3]))),
  length(subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[4]-tsla_stock.de_low[4]) & TSLAStock$Low <= (tsla_stock.avg_low[4]+tsla_stock.de_low[4]))),
  length(subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[5]-tsla_stock.de_low[5]) & TSLAStock$Low <= (tsla_stock.avg_low[5]+tsla_stock.de_low[5]))),
  length(subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[6]-tsla_stock.de_low[6]) & TSLAStock$Low <= (tsla_stock.avg_low[6]+tsla_stock.de_low[6]))),
  length(subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[7]-tsla_stock.de_low[7]) & TSLAStock$Low <= (tsla_stock.avg_low[7]+tsla_stock.de_low[7]))),
  length(subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[8]-tsla_stock.de_low[8]) & TSLAStock$Low <= (tsla_stock.avg_low[8]+tsla_stock.de_low[8]))),
  length(subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[9]-tsla_stock.de_low[9]) & TSLAStock$Low <= (tsla_stock.avg_low[9]+tsla_stock.de_low[9]))),
  length(subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[10]-tsla_stock.de_low[10]) & TSLAStock$Low <= (tsla_stock.avg_low[10]+tsla_stock.de_low[10])))
)

#Tabla para la Grafica 8
tsla_stock.low_statsG8 <- data.frame(
  "Promedio" = tsla_stock.avg_low,
  "Desviacion_Estandar" = tsla_stock.de_low,
  "Cantidad_dentro_de_desviacion" = tsla_stock.ir_low
)

#Grafica 9
#Cantidad de dias fuera de la desviación estandar
tsla_stock.or_low <- c(
  tsla_stock.cant_low[1]-tsla_stock.ir_low[1],
  tsla_stock.cant_low[2]-tsla_stock.ir_low[2],
  tsla_stock.cant_low[3]-tsla_stock.ir_low[3],
  tsla_stock.cant_low[4]-tsla_stock.ir_low[4],
  tsla_stock.cant_low[5]-tsla_stock.ir_low[5],
  tsla_stock.cant_low[6]-tsla_stock.ir_low[6],
  tsla_stock.cant_low[7]-tsla_stock.ir_low[7],
  tsla_stock.cant_low[8]-tsla_stock.ir_low[8],
  tsla_stock.cant_low[9]-tsla_stock.ir_low[9],
  tsla_stock.cant_low[10]-tsla_stock.ir_low[10]
)

#Tabla para la Grafica 9
tsla_stock.low_statsG9 <- data.frame(
  "Cantidad_de_dias_fuera_de_la_desviacion_estandar" = tsla_stock.or_low
)

#Cominación de las ultimas 3 tablas
tsla_stock.low_stats <- cbind(
  tsla_stock.low_statsG7,
  tsla_stock.low_statsG8,
  tsla_stock.low_statsG9
)

# Union con la previa tabla + low_stats
tsla_stock.c_stats <- merge(
  tsla_stock.c_stats,
  tsla_stock.c_low_stats,
  by =  "Date",
  all = TRUE
)

#Creación del documento
write.table(
  x = tsla_stock.low_stats, 
  file = "TSLAStockStats/(3)LowStockStats.csv",
  sep = ","
)

#### Datos para el precio de cierre
#Grafica 10
#Promedio del precio del cierre por cada rango
tsla_stock.cant_close <- c(
  nrow(subset(x = TSLAStock, subset = Close > 140 & Close <= 165)),
  nrow(subset(x = TSLAStock, subset = Close > 165 & Close <= 190)),
  nrow(subset(x = TSLAStock, subset = Close > 190 & Close <= 215)),
  nrow(subset(x = TSLAStock, subset = Close > 215 & Close <= 240)),
  nrow(subset(x = TSLAStock, subset = Close > 240 & Close <= 265)),
  nrow(subset(x = TSLAStock, subset = Close > 265 & Close <= 290)),
  nrow(subset(x = TSLAStock, subset = Close > 290 & Close <= 315)),
  nrow(subset(x = TSLAStock, subset = Close > 315 & Close <= 340)),
  nrow(subset(x = TSLAStock, subset = Close > 340 & Close <= 365)),
  nrow(subset(x = TSLAStock, subset = Close > 365 & Close <= 390))
)

#Tabla para la Grafica 10
tsla_stock.close_statsG10 <- data.frame(
  "Rango" = tsla_stock.rango,
  "Cantidad" = tsla_stock.cant_close
)

#Grafica11
#Promedio del precio del cierre por cada rango
tsla_stock.avg_close <- c(
  mean(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 140 & TSLAStock$Close <= 165)),
  mean(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 165 & TSLAStock$Close <= 190)),
  mean(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 190 & TSLAStock$Close <= 215)),
  mean(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 215 & TSLAStock$Close <= 240)),
  mean(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 240 & TSLAStock$Close <= 265)),
  mean(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 265 & TSLAStock$Close <= 290)),
  mean(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 290 & TSLAStock$Close <= 315)),
  mean(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 315 & TSLAStock$Close <= 340)),
  mean(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 340 & TSLAStock$Close <= 365)),
  mean(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 365 & TSLAStock$Close <= 390))
)

#Desviación estandar del precio de cierre por cada rango
tsla_stock.de_close <- c(
  sd(as.double(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 140 & TSLAStock$Close <= 165))),
  sd(as.double(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 165 & TSLAStock$Close <= 190))),
  sd(as.double(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 190 & TSLAStock$Close <= 215))),
  sd(as.double(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 215 & TSLAStock$Close <= 240))),
  sd(as.double(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 240 & TSLAStock$Close <= 265))),
  sd(as.double(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 265 & TSLAStock$Close <= 290))),
  sd(as.double(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 290 & TSLAStock$Close <= 315))),
  sd(as.double(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 315 & TSLAStock$Close <= 340))),
  sd(as.double(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 340 & TSLAStock$Close <= 365))),
  sd(as.double(subset(x = TSLAStock$Close, subset = TSLAStock$Close > 365 & TSLAStock$Close <= 390)))
)

#Cantidad de dias dentro de la desviacíon estandar de cada rango
tsla_stock.ir_close <- c(
  length(subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[1]-tsla_stock.de_close[1]) & TSLAStock$Close <= (tsla_stock.avg_close[1]+tsla_stock.de_close[1]))),
  length(subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[2]-tsla_stock.de_close[2]) & TSLAStock$Close <= (tsla_stock.avg_close[2]+tsla_stock.de_close[2]))),
  length(subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[3]-tsla_stock.de_close[3]) & TSLAStock$Close <= (tsla_stock.avg_close[3]+tsla_stock.de_close[3]))),
  length(subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[4]-tsla_stock.de_close[4]) & TSLAStock$Close <= (tsla_stock.avg_close[4]+tsla_stock.de_close[4]))),
  length(subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[5]-tsla_stock.de_close[5]) & TSLAStock$Close <= (tsla_stock.avg_close[5]+tsla_stock.de_close[5]))),
  length(subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[6]-tsla_stock.de_close[6]) & TSLAStock$Close <= (tsla_stock.avg_close[6]+tsla_stock.de_close[6]))),
  length(subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[7]-tsla_stock.de_close[7]) & TSLAStock$Close <= (tsla_stock.avg_close[7]+tsla_stock.de_close[7]))),
  length(subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[8]-tsla_stock.de_close[8]) & TSLAStock$Close <= (tsla_stock.avg_close[8]+tsla_stock.de_close[8]))),
  length(subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[9]-tsla_stock.de_close[9]) & TSLAStock$Close <= (tsla_stock.avg_close[9]+tsla_stock.de_close[9]))),
  length(subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[10]-tsla_stock.de_close[10]) & TSLAStock$Close <= (tsla_stock.avg_close[10]+tsla_stock.de_close[10])))
)

#Tabla para la Grafica 11
tsla_stock.close_statsG11 <- data.frame(
  "Promedio" = tsla_stock.avg_close,
  "Desviacion_Estandar" = tsla_stock.de_close,
  "Cantidad_dentro_de_desviacion" = tsla_stock.ir_close
)

#Grafica 12
#Cantidad de dias fuera de la desviación estandar
tsla_stock.or_close <- c(
  tsla_stock.cant_close[1]-tsla_stock.ir_close[1],
  tsla_stock.cant_close[2]-tsla_stock.ir_close[2],
  tsla_stock.cant_close[3]-tsla_stock.ir_close[3],
  tsla_stock.cant_close[4]-tsla_stock.ir_close[4],
  tsla_stock.cant_close[5]-tsla_stock.ir_close[5],
  tsla_stock.cant_close[6]-tsla_stock.ir_close[6],
  tsla_stock.cant_close[7]-tsla_stock.ir_close[7],
  tsla_stock.cant_close[8]-tsla_stock.ir_close[8],
  tsla_stock.cant_close[9]-tsla_stock.ir_close[9],
  tsla_stock.cant_close[10]-tsla_stock.ir_close[10]
)

#Tabla para la Grafica 12
tsla_stock.close_statsG12 <- data.frame(
  "Cantidad_de_dias_fuera_de_la_desviacion_estandar" = tsla_stock.or_close
)

#Combinación de las ultimas 3 tablas
tsla_stock.close_stats <- cbind(
  tsla_stock.close_statsG10,
  tsla_stock.close_statsG11,
  tsla_stock.close_statsG12
)

# Union la previa tabla + close_stats
tsla_stock.c_stats <- merge(
  tsla_stock.c_stats,
  tsla_stock.c_close_stats,
  by =  "Date",
  all = TRUE
)

#Creación del documento
write.table(
  x = tsla_stock.close_stats, 
  file = "TSLAStockStats/(4)CloseStockStats.csv",
  sep = ","
)

#### Datos para la cantidad de transacciónes realizadas por volumen
#Grafica 13
#Rango
tsla_stock.rango_volume <- c(
  "700000 - 4030000",
  "4030000 - 7360000",
  "7360000 - 10690000",
  "10690000 - 14020000",
  "14020000 - 17350000",
  "17350000 - 20680000",
  "20680000 - 24010000",
  "24010000 - 27340000",
  "27340000 - 30670000",
  "30670000 - 34000000"
)

#Promedio del volumen por cada rango
tsla_stock.cant_volume <- c(
  nrow(subset(x = TSLAStock, subset = Volume > 700000 & Volume <= 4030000)),
  nrow(subset(x = TSLAStock, subset = Volume > 4030000 & Volume <= 7360000)),
  nrow(subset(x = TSLAStock, subset = Volume > 7360000 & Volume <= 10690000)),
  nrow(subset(x = TSLAStock, subset = Volume > 10690000 & Volume <= 14020000)),
  nrow(subset(x = TSLAStock, subset = Volume > 14020000 & Volume <= 17350000)),
  nrow(subset(x = TSLAStock, subset = Volume > 17350000 & Volume <= 20680000)),
  nrow(subset(x = TSLAStock, subset = Volume > 20680000 & Volume <= 24010000)),
  nrow(subset(x = TSLAStock, subset = Volume > 24010000 & Volume <= 27340000)),
  nrow(subset(x = TSLAStock, subset = Volume > 27340000 & Volume <= 30670000)),
  nrow(subset(x = TSLAStock, subset = Volume > 30670000 & Volume <= 34000000))
)

#Tabla de la Grafica 13
tsla_stock.volume_statsG13 <- data.frame(
  "Rango" = tsla_stock.rango_volume,
  "Cantidad" = tsla_stock.cant_volume
)

#Grafica 14
#Promedio del volumen por cada rango
tsla_stock.avg_volume <- c(
  mean(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 700000 & TSLAStock$Volume <= 4030000)),
  mean(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 4030000 & TSLAStock$Volume <= 7360000)),
  mean(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 7360000 & TSLAStock$Volume <= 10690000)),
  mean(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 10690000 & TSLAStock$Volume <= 14020000)),
  mean(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 14020000 & TSLAStock$Volume <= 17350000)),
  mean(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 17350000 & TSLAStock$Volume <= 20680000)),
  mean(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 20680000 & TSLAStock$Volume <= 24010000)),
  mean(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 24010000 & TSLAStock$Volume <= 27340000)),
  mean(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 27340000 & TSLAStock$Volume <= 30670000)),
  mean(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 30670000 & TSLAStock$Volume <= 34000000))
)

#Desviación estandar del volumen por cada rango
tsla_stock.de_volume <- c(
  as.numeric(sd(as.double(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 700000 & TSLAStock$Volume <= 4030000)))),
  as.numeric(sd(as.double(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 4030000 & TSLAStock$Volume <= 7360000)))),
  as.numeric(sd(as.double(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 7360000 & TSLAStock$Volume <= 10690000)))),
  as.numeric(sd(as.double(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 10690000 & TSLAStock$Volume <= 14020000)))),
  as.numeric(sd(as.double(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 14020000 & TSLAStock$Volume <= 17350000)))),
  as.numeric(sd(as.double(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 17350000 & TSLAStock$Volume <= 20680000)))),
  as.numeric(sd(as.double(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 20680000 & TSLAStock$Volume <= 24010000)))),
  as.numeric(sd(as.double(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 24010000 & TSLAStock$Volume <= 27340000)))),
  #Solo existe una variable en este rango por lo que no puede obtener una desviación estandar
  0,
  as.numeric(sd(as.double(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume > 30670000 & TSLAStock$Volume <= 34000000))))
)

#Cantidad de dias dentro de la desviacíon estandar de cada rango
tsla_stock.ir_volumen <- c(
  length(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[1]-tsla_stock.de_volume[1]) & TSLAStock$Volume <= (tsla_stock.avg_volume[1]+tsla_stock.de_volume[1]))),
  length(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[2]-tsla_stock.de_volume[2]) & TSLAStock$Volume <= (tsla_stock.avg_volume[2]+tsla_stock.de_volume[2]))),
  length(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[3]-tsla_stock.de_volume[3]) & TSLAStock$Volume <= (tsla_stock.avg_volume[3]+tsla_stock.de_volume[3]))),
  length(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[4]-tsla_stock.de_volume[4]) & TSLAStock$Volume <= (tsla_stock.avg_volume[4]+tsla_stock.de_volume[4]))),
  length(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[5]-tsla_stock.de_volume[5]) & TSLAStock$Volume <= (tsla_stock.avg_volume[5]+tsla_stock.de_volume[5]))),
  length(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[6]-tsla_stock.de_volume[6]) & TSLAStock$Volume <= (tsla_stock.avg_volume[6]+tsla_stock.de_volume[6]))),
  length(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[7]-tsla_stock.de_volume[7]) & TSLAStock$Volume <= (tsla_stock.avg_volume[7]+tsla_stock.de_volume[7]))),
  length(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[8]-tsla_stock.de_volume[8]) & TSLAStock$Volume <= (tsla_stock.avg_volume[8]+tsla_stock.de_volume[8]))),
  length(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[9]-tsla_stock.de_volume[9]) & TSLAStock$Volume <= (tsla_stock.avg_volume[9]+tsla_stock.de_volume[9]))),
  length(subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[10]-tsla_stock.de_volume[10]) & TSLAStock$Volume <= (tsla_stock.avg_volume[10]+tsla_stock.de_volume[10])))
)

#Tabla para la Grafica 14
tsla_stock.volume_statsG14 <- data.frame(
  "Promedio" = tsla_stock.avg_volume,
  "Desviacion_Estandar" = tsla_stock.de_volume,
  "Cantidad_dentro_de_desviacion" = tsla_stock.ir_volumen
)

#Grafica 15
#Cantidad de dias fuera de la desviación estandar
tsla_stock.or_volume <- c(
  tsla_stock.cant_volume[1]-tsla_stock.ir_volumen[1],
  tsla_stock.cant_volume[2]-tsla_stock.ir_volumen[2],
  tsla_stock.cant_volume[3]-tsla_stock.ir_volumen[3],
  tsla_stock.cant_volume[4]-tsla_stock.ir_volumen[4],
  tsla_stock.cant_volume[5]-tsla_stock.ir_volumen[5],
  tsla_stock.cant_volume[6]-tsla_stock.ir_volumen[6],
  tsla_stock.cant_volume[7]-tsla_stock.ir_volumen[7],
  tsla_stock.cant_volume[8]-tsla_stock.ir_volumen[8],
  tsla_stock.cant_volume[9]-tsla_stock.ir_volumen[9],
  tsla_stock.cant_volume[10]-tsla_stock.ir_volumen[10]
)

#Tabla para la Grafica 15
tsla_stock.volume_statsG15 <- data.frame(
  "Cantidad_de_dias_fuera_de_la_desviacion_estandar" = tsla_stock.or_volume
)

#Combianción de las ultimas 3 tablas
tsla_stock.volume_stats <- cbind(
  tsla_stock.volume_statsG13,
  tsla_stock.volume_statsG14,
  tsla_stock.volume_statsG15
)

#Creación del documento
write.table(
  x = tsla_stock.volume_stats, 
  file = "TSLAStockStats/(5)VolumeStockStats.csv",
  sep = ","
)

#IDEA: 
# Puede exister una relación entre como varian los precios de
# cada columna en promedio y su desviación, en relación con su comportamiento
# en el mercado?,

# Obtener el promedio de cada columna y la desviación estandar promedio,
# puede existir una relación?

#tsla_stock.c_open_high_low.avg <- c(
#  "Open" = mean(tsla_stock.avg),
#  "High" = mean(tsla_stock.avg_high),
#  "Low" = mean(tsla_stock.avg_low),
#  "Close" = mean(tsla_stock.avg_close),
#  "Volume" = mean(tsla_stock.avg_volume)
#)

#Promedio de las desviaciones de cada rango de las acciones
#tsla_stock.c_open_high_low.de <- c(
#  "Open" = mean(tsla_stock.de),
#  "High" = mean(tsla_stock.de_high),
#  "Low" = mean(tsla_stock.de_low),
#  "Close" = mean(tsla_stock.de_close),
#  "Volume" = mean(tsla_stock.de_volume)
#)

#tsla_stock.c_all.df <- data.frame(
#  "Promedio" = tsla_stock.c_all.avg,
#  "Desviación_Estandar" = tsla_stock.c_all.de
#)

#write.table(
#  x = tsla_stock.c_all.df,
#  file = "TSLAStockStats/(4)AllStockStats.csv",
#  sep = ","
#)

# Las fechas de cada columna que esta dentro y fuera
# de la desviación estandar sera tomada en cuenta
# con el fin de ver las fechas en conjunción y ver
# como se relaciónan entre ellas y si hay algún tipo
# de patron o similaridad 

#tsla_stock.stats <- c(
  #Fechas de los precios de apertura dentro de la desviación
  #Fechas de los precios de apertura fuera de la desviación
  #.
  #.
  #.
  #Fechas con el volumen de intercambio fuera de la desviación
#)

# Checar los datos con las fechas, abajo esta un intento previo de como se debe de parecer.

# Vista de comparación entre los dias de apertura y
# los precios mas altos para ver alguna relación entre ellos.

# Tabla con la fecha y el precio de apertura de cada rango dentro de la desviación estandar

#Open dentro de la desviación estándar
tsla_stock.c_open_stats <- data.frame(
  "Date" = c(
    (subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[1]-tsla_stock.de[1]) & TSLAStock$Open <= (tsla_stock.avg[1]+tsla_stock.de[1]))),
    (subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[2]-tsla_stock.de[2]) & TSLAStock$Open <= (tsla_stock.avg[2]+tsla_stock.de[2]))),
    (subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[3]-tsla_stock.de[3]) & TSLAStock$Open <= (tsla_stock.avg[3]+tsla_stock.de[3]))),
    (subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[4]-tsla_stock.de[4]) & TSLAStock$Open <= (tsla_stock.avg[4]+tsla_stock.de[4]))),
    (subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[5]-tsla_stock.de[5]) & TSLAStock$Open <= (tsla_stock.avg[5]+tsla_stock.de[5]))),
    (subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[6]-tsla_stock.de[6]) & TSLAStock$Open <= (tsla_stock.avg[6]+tsla_stock.de[6]))),
    (subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[7]-tsla_stock.de[7]) & TSLAStock$Open <= (tsla_stock.avg[7]+tsla_stock.de[7]))),
    (subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[8]-tsla_stock.de[8]) & TSLAStock$Open <= (tsla_stock.avg[8]+tsla_stock.de[8]))),
    (subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[9]-tsla_stock.de[9]) & TSLAStock$Open <= (tsla_stock.avg[9]+tsla_stock.de[9]))),
    (subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[10]-tsla_stock.de[10]) & TSLAStock$Open <= (tsla_stock.avg[10]+tsla_stock.de[10])))
  ),
  "Price" = c(
    subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[1]-tsla_stock.de[1]) & TSLAStock$Open <= (tsla_stock.avg[1]+tsla_stock.de[1])),
    subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[2]-tsla_stock.de[2]) & TSLAStock$Open <= (tsla_stock.avg[2]+tsla_stock.de[2])),
    subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[3]-tsla_stock.de[3]) & TSLAStock$Open <= (tsla_stock.avg[3]+tsla_stock.de[3])),
    subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[4]-tsla_stock.de[4]) & TSLAStock$Open <= (tsla_stock.avg[4]+tsla_stock.de[4])),
    subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[5]-tsla_stock.de[5]) & TSLAStock$Open <= (tsla_stock.avg[5]+tsla_stock.de[5])),
    subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[6]-tsla_stock.de[6]) & TSLAStock$Open <= (tsla_stock.avg[6]+tsla_stock.de[6])),
    subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[7]-tsla_stock.de[7]) & TSLAStock$Open <= (tsla_stock.avg[7]+tsla_stock.de[7])),
    subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[8]-tsla_stock.de[8]) & TSLAStock$Open <= (tsla_stock.avg[8]+tsla_stock.de[8])),
    subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[9]-tsla_stock.de[9]) & TSLAStock$Open <= (tsla_stock.avg[9]+tsla_stock.de[9])),
    subset(x = TSLAStock$Open, subset = TSLAStock$Open >= (tsla_stock.avg[10]-tsla_stock.de[10]) & TSLAStock$Open <= (tsla_stock.avg[10]+tsla_stock.de[10]))
  )
)

#Open fuera de la desviación estándar
tsla_stock.c_open_stats_E <- data.frame(
  "Date" = c(
    #140 - 165
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Open > 140 ) & (tsla_stock.avg[1]-tsla_stock.de[1] > TSLAStock$Open))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg[1]+tsla_stock.de[1] < TSLAStock$Open) & (TSLAStock$Open <= 165 ))),
    #165-190
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Open > 165) & (tsla_stock.avg[2]-tsla_stock.de[2] > TSLAStock$Open))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg[2]+tsla_stock.de[2] < TSLAStock$Open) & (TSLAStock$Open <= 190 ))),
    #190 - 215
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Open > 190) & (tsla_stock.avg[3]-tsla_stock.de[3] > TSLAStock$Open))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg[3]+tsla_stock.de[3] < TSLAStock$Open) & (TSLAStock$Open <= 215 ))),
    #215 - 240
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Open > 215) & (tsla_stock.avg[4]-tsla_stock.de[4] > TSLAStock$Open))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg[4]+tsla_stock.de[4] < TSLAStock$Open) & (TSLAStock$Open <= 240 ))),
    #240 - 265
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Open > 240) & (tsla_stock.avg[5]-tsla_stock.de[5] > TSLAStock$Open))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg[5]+tsla_stock.de[5] < TSLAStock$Open) & (TSLAStock$Open <= 265 ))),
    #265 - 290
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Open > 265) & (tsla_stock.avg[6]-tsla_stock.de[6] > TSLAStock$Open))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg[6]+tsla_stock.de[6] < TSLAStock$Open) & (TSLAStock$Open <= 290 ))),
    #290 - 315
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Open > 290) & (tsla_stock.avg[7]-tsla_stock.de[7] > TSLAStock$Open))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg[7]+tsla_stock.de[7] < TSLAStock$Open) & (TSLAStock$Open <= 315 ))),
    #315 - 340
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Open > 315) & (tsla_stock.avg[8]-tsla_stock.de[8] > TSLAStock$Open))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg[8]+tsla_stock.de[8] < TSLAStock$Open) & (TSLAStock$Open <= 340 ))),
    #340 - 365
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Open > 340) & (tsla_stock.avg[9]-tsla_stock.de[9] > TSLAStock$Open))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg[9]+tsla_stock.de[9] < TSLAStock$Open) & (TSLAStock$Open <= 365 ))),
    #365 - 390
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Open > 365) & (tsla_stock.avg[10]-tsla_stock.de[10] > TSLAStock$Open))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg[10]+tsla_stock.de[10] < TSLAStock$Open) & (TSLAStock$Open <= 390 )))
  ),
  "Price" = c(
    #140 - 165
    subset(x = TSLAStock$Open, subset = (TSLAStock$Open > 140 ) & (tsla_stock.avg[1]-tsla_stock.de[1] > TSLAStock$Open)),
    subset(x = TSLAStock$Open, subset = (tsla_stock.avg[1]+tsla_stock.de[1] < TSLAStock$Open) & (TSLAStock$Open <= 165 )),
    #165-190
    subset(x = TSLAStock$Open, subset = (TSLAStock$Open > 165) & (tsla_stock.avg[2]-tsla_stock.de[2] > TSLAStock$Open)),
    subset(x = TSLAStock$Open, subset = (tsla_stock.avg[2]+tsla_stock.de[2] < TSLAStock$Open) & (TSLAStock$Open <= 190 )),
    #190 - 215
    subset(x = TSLAStock$Open, subset = (TSLAStock$Open > 190) & (tsla_stock.avg[3]-tsla_stock.de[3] > TSLAStock$Open)),
    subset(x = TSLAStock$Open, subset = (tsla_stock.avg[3]+tsla_stock.de[3] < TSLAStock$Open) & (TSLAStock$Open <= 215 )),
    #215 - 240
    subset(x = TSLAStock$Open, subset = (TSLAStock$Open > 215) & (tsla_stock.avg[4]-tsla_stock.de[4] > TSLAStock$Open)),
    subset(x = TSLAStock$Open, subset = (tsla_stock.avg[4]+tsla_stock.de[4] < TSLAStock$Open) & (TSLAStock$Open <= 240 )),
    #240 - 265
    subset(x = TSLAStock$Open, subset = (TSLAStock$Open > 240) & (tsla_stock.avg[5]-tsla_stock.de[5] > TSLAStock$Open)),
    subset(x = TSLAStock$Open, subset = (tsla_stock.avg[5]+tsla_stock.de[5] < TSLAStock$Open) & (TSLAStock$Open <= 265 )),
    #265 - 290
    subset(x = TSLAStock$Open, subset = (TSLAStock$Open > 265) & (tsla_stock.avg[6]-tsla_stock.de[6] > TSLAStock$Open)),
    subset(x = TSLAStock$Open, subset = (tsla_stock.avg[6]+tsla_stock.de[6] < TSLAStock$Open) & (TSLAStock$Open <= 290 )),
    #290 - 315
    subset(x = TSLAStock$Open, subset = (TSLAStock$Open > 290) & (tsla_stock.avg[7]-tsla_stock.de[7] > TSLAStock$Open)),
    subset(x = TSLAStock$Open, subset = (tsla_stock.avg[7]+tsla_stock.de[7] < TSLAStock$Open) & (TSLAStock$Open <= 315 )),
    #315 - 340
    subset(x = TSLAStock$Open, subset = (TSLAStock$Open > 315) & (tsla_stock.avg[8]-tsla_stock.de[8] > TSLAStock$Open)),
    subset(x = TSLAStock$Open, subset = (tsla_stock.avg[8]+tsla_stock.de[8] < TSLAStock$Open) & (TSLAStock$Open <= 340 )),
    #340 - 365
    subset(x = TSLAStock$Open, subset = (TSLAStock$Open > 340) & (tsla_stock.avg[9]-tsla_stock.de[9] > TSLAStock$Open)),
    subset(x = TSLAStock$Open, subset = (tsla_stock.avg[9]+tsla_stock.de[9] < TSLAStock$Open) & (TSLAStock$Open <= 365 )),
    #365 - 390
    subset(x = TSLAStock$Open, subset = (TSLAStock$Open > 365) & (tsla_stock.avg[10]-tsla_stock.de[10] > TSLAStock$Open)),
    subset(x = TSLAStock$Open, subset = (tsla_stock.avg[10]+tsla_stock.de[10] < TSLAStock$Open) & (TSLAStock$Open <= 390 ))
  )
)

#No existe necesidad de comparar fechas entre si ya que por las condiciónes dadas anteriormente es imposible que exista una fecha
#con precio dentro y fuera de la desviación.
#Merged on dates that are the same
#tsla_stock.c_open_stats_Comparison <- merge(
#  tsla_stock.c_open_stats,
#  tsla_stock.c_open_stats_E,
#  by =  "Date",
#  all = TRUE,
#  suffixes = c("_Open_DE","_Open_E")
#)

#High
# Tabla con la fecha y el precio alto de cada rango dentro de la desviación estandar
tsla_stock.c_high_stats <- data.frame(
  "Date" = c(
    subset(x = TSLAStock$Date, subset = TSLAStock$High >= (tsla_stock.avg_high[1]-tsla_stock.de_high[1]) & TSLAStock$High <= (tsla_stock.avg_high[1]+tsla_stock.de_high[1])),
    subset(x = TSLAStock$Date, subset = TSLAStock$High >= (tsla_stock.avg_high[2]-tsla_stock.de_high[2]) & TSLAStock$High <= (tsla_stock.avg_high[2]+tsla_stock.de_high[2])),
    subset(x = TSLAStock$Date, subset = TSLAStock$High >= (tsla_stock.avg_high[3]-tsla_stock.de_high[3]) & TSLAStock$High <= (tsla_stock.avg_high[3]+tsla_stock.de_high[3])),
    subset(x = TSLAStock$Date, subset = TSLAStock$High >= (tsla_stock.avg_high[4]-tsla_stock.de_high[4]) & TSLAStock$High <= (tsla_stock.avg_high[4]+tsla_stock.de_high[4])),
    subset(x = TSLAStock$Date, subset = TSLAStock$High >= (tsla_stock.avg_high[5]-tsla_stock.de_high[5]) & TSLAStock$High <= (tsla_stock.avg_high[5]+tsla_stock.de_high[5])),
    subset(x = TSLAStock$Date, subset = TSLAStock$High >= (tsla_stock.avg_high[6]-tsla_stock.de_high[6]) & TSLAStock$High <= (tsla_stock.avg_high[6]+tsla_stock.de_high[6])),
    subset(x = TSLAStock$Date, subset = TSLAStock$High >= (tsla_stock.avg_high[7]-tsla_stock.de_high[7]) & TSLAStock$High <= (tsla_stock.avg_high[7]+tsla_stock.de_high[7])),
    subset(x = TSLAStock$Date, subset = TSLAStock$High >= (tsla_stock.avg_high[8]-tsla_stock.de_high[8]) & TSLAStock$High <= (tsla_stock.avg_high[8]+tsla_stock.de_high[8])),
    subset(x = TSLAStock$Date, subset = TSLAStock$High >= (tsla_stock.avg_high[9]-tsla_stock.de_high[9]) & TSLAStock$High <= (tsla_stock.avg_high[9]+tsla_stock.de_high[9])),
    subset(x = TSLAStock$Date, subset = TSLAStock$High >= (tsla_stock.avg_high[10]-tsla_stock.de_high[10]) & TSLAStock$High <= (tsla_stock.avg_high[10]+tsla_stock.de_high[10]))
  ),
  "Price" = c(
    subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[1]-tsla_stock.de_high[1]) & TSLAStock$High <= (tsla_stock.avg_high[1]+tsla_stock.de_high[1])),
    subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[2]-tsla_stock.de_high[2]) & TSLAStock$High <= (tsla_stock.avg_high[2]+tsla_stock.de_high[2])),
    subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[3]-tsla_stock.de_high[3]) & TSLAStock$High <= (tsla_stock.avg_high[3]+tsla_stock.de_high[3])),
    subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[4]-tsla_stock.de_high[4]) & TSLAStock$High <= (tsla_stock.avg_high[4]+tsla_stock.de_high[4])),
    subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[5]-tsla_stock.de_high[5]) & TSLAStock$High <= (tsla_stock.avg_high[5]+tsla_stock.de_high[5])),
    subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[6]-tsla_stock.de_high[6]) & TSLAStock$High <= (tsla_stock.avg_high[6]+tsla_stock.de_high[6])),
    subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[7]-tsla_stock.de_high[7]) & TSLAStock$High <= (tsla_stock.avg_high[7]+tsla_stock.de_high[7])),
    subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[8]-tsla_stock.de_high[8]) & TSLAStock$High <= (tsla_stock.avg_high[8]+tsla_stock.de_high[8])),
    subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[9]-tsla_stock.de_high[9]) & TSLAStock$High <= (tsla_stock.avg_high[9]+tsla_stock.de_high[9])),
    subset(x = TSLAStock$High, subset = TSLAStock$High >= (tsla_stock.avg_high[10]-tsla_stock.de_high[10]) & TSLAStock$High <= (tsla_stock.avg_high[10]+tsla_stock.de_high[10]))
  )
)

#High fuera de la desviación estándar
tsla_stock.c_high_stats_E <- data.frame(
  "Date" = c(
    #140 - 165
    (subset(x = TSLAStock$Date, subset = (TSLAStock$High > 140 ) & (tsla_stock.avg_high[1]-tsla_stock.de_high[1] > TSLAStock$High))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_high[1]+tsla_stock.de_high[1] < TSLAStock$High) & (TSLAStock$High <= 165 ))),
    #165-190
    (subset(x = TSLAStock$Date, subset = (TSLAStock$High > 165) & (tsla_stock.avg_high[2]-tsla_stock.de_high[2] > TSLAStock$High))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_high[2]+tsla_stock.de_high[2] < TSLAStock$High) & (TSLAStock$High <= 190 ))),
    #190 - 215
    (subset(x = TSLAStock$Date, subset = (TSLAStock$High > 190) & (tsla_stock.avg_high[3]-tsla_stock.de_high[3] > TSLAStock$High))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_high[3]+tsla_stock.de_high[3] < TSLAStock$High) & (TSLAStock$High <= 215 ))),
    #215 - 240
    (subset(x = TSLAStock$Date, subset = (TSLAStock$High > 215) & (tsla_stock.avg_high[4]-tsla_stock.de_high[4] > TSLAStock$High))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_high[4]+tsla_stock.de_high[4] < TSLAStock$High) & (TSLAStock$High <= 240 ))),
    #240 - 265
    (subset(x = TSLAStock$Date, subset = (TSLAStock$High > 240) & (tsla_stock.avg_high[5]-tsla_stock.de_high[5] > TSLAStock$High))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_high[5]+tsla_stock.de_high[5] < TSLAStock$High) & (TSLAStock$High <= 265 ))),
    #265 - 290
    (subset(x = TSLAStock$Date, subset = (TSLAStock$High > 265) & (tsla_stock.avg_high[6]-tsla_stock.de_high[6] > TSLAStock$High))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_high[6]+tsla_stock.de_high[6] < TSLAStock$High) & (TSLAStock$High <= 290 ))),
    #290 - 315
    (subset(x = TSLAStock$Date, subset = (TSLAStock$High > 290) & (tsla_stock.avg_high[7]-tsla_stock.de_high[7] > TSLAStock$High))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_high[7]+tsla_stock.de_high[7] < TSLAStock$High) & (TSLAStock$High <= 315 ))),
    #315 - 340
    (subset(x = TSLAStock$Date, subset = (TSLAStock$High > 315) & (tsla_stock.avg_high[8]-tsla_stock.de_high[8] > TSLAStock$High))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_high[8]+tsla_stock.de_high[8] < TSLAStock$High) & (TSLAStock$High <= 340 ))),
    #340 - 365
    (subset(x = TSLAStock$Date, subset = (TSLAStock$High > 340) & (tsla_stock.avg_high[9]-tsla_stock.de_high[9] > TSLAStock$High))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_high[9]+tsla_stock.de_high[9] < TSLAStock$High) & (TSLAStock$High <= 365 ))),
    #365 - 390
    (subset(x = TSLAStock$Date, subset = (TSLAStock$High > 365) & (tsla_stock.avg_high[10]-tsla_stock.de_high[10] > TSLAStock$High))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_high[10]+tsla_stock.de_high[10] < TSLAStock$High) & (TSLAStock$High <= 390 )))
  ),
  "Price" = c(
    #140 - 165
    (subset(x = TSLAStock$High, subset = (TSLAStock$High > 140 ) & (tsla_stock.avg_high[1]-tsla_stock.de_high[1] > TSLAStock$High))),
    (subset(x = TSLAStock$High, subset = (tsla_stock.avg_high[1]+tsla_stock.de_high[1] < TSLAStock$High) & (TSLAStock$High <= 165 ))),
    #165-190
    (subset(x = TSLAStock$High, subset = (TSLAStock$High > 165) & (tsla_stock.avg_high[2]-tsla_stock.de_high[2] > TSLAStock$High))),
    (subset(x = TSLAStock$High, subset = (tsla_stock.avg_high[2]+tsla_stock.de_high[2] < TSLAStock$High) & (TSLAStock$High <= 190 ))),
    #190 - 215
    (subset(x = TSLAStock$High, subset = (TSLAStock$High > 190) & (tsla_stock.avg_high[3]-tsla_stock.de_high[3] > TSLAStock$High))),
    (subset(x = TSLAStock$High, subset = (tsla_stock.avg_high[3]+tsla_stock.de_high[3] < TSLAStock$High) & (TSLAStock$High <= 215 ))),
    #215 - 240
    (subset(x = TSLAStock$High, subset = (TSLAStock$High > 215) & (tsla_stock.avg_high[4]-tsla_stock.de_high[4] > TSLAStock$High))),
    (subset(x = TSLAStock$High, subset = (tsla_stock.avg_high[4]+tsla_stock.de_high[4] < TSLAStock$High) & (TSLAStock$High <= 240 ))),
    #240 - 265
    (subset(x = TSLAStock$High, subset = (TSLAStock$High > 240) & (tsla_stock.avg_high[5]-tsla_stock.de_high[5] > TSLAStock$High))),
    (subset(x = TSLAStock$High, subset = (tsla_stock.avg_high[5]+tsla_stock.de_high[5] < TSLAStock$High) & (TSLAStock$High <= 265 ))),
    #265 - 290
    (subset(x = TSLAStock$High, subset = (TSLAStock$High > 265) & (tsla_stock.avg_high[6]-tsla_stock.de_high[6] > TSLAStock$High))),
    (subset(x = TSLAStock$High, subset = (tsla_stock.avg_high[6]+tsla_stock.de_high[6] < TSLAStock$High) & (TSLAStock$High <= 290 ))),
    #290 - 315
    (subset(x = TSLAStock$High, subset = (TSLAStock$High > 290) & (tsla_stock.avg_high[7]-tsla_stock.de_high[7] > TSLAStock$High))),
    (subset(x = TSLAStock$High, subset = (tsla_stock.avg_high[7]+tsla_stock.de_high[7] < TSLAStock$High) & (TSLAStock$High <= 315 ))),
    #315 - 340
    (subset(x = TSLAStock$High, subset = (TSLAStock$High > 315) & (tsla_stock.avg_high[8]-tsla_stock.de_high[8] > TSLAStock$High))),
    (subset(x = TSLAStock$High, subset = (tsla_stock.avg_high[8]+tsla_stock.de_high[8] < TSLAStock$High) & (TSLAStock$High <= 340 ))),
    #340 - 365
    (subset(x = TSLAStock$High, subset = (TSLAStock$High > 340) & (tsla_stock.avg_high[9]-tsla_stock.de_high[9] > TSLAStock$High))),
    (subset(x = TSLAStock$High, subset = (tsla_stock.avg_high[9]+tsla_stock.de_high[9] < TSLAStock$High) & (TSLAStock$High <= 365 ))),
    #365 - 390
    (subset(x = TSLAStock$High, subset = (TSLAStock$High > 365) & (tsla_stock.avg_high[10]-tsla_stock.de_high[10] > TSLAStock$High))),
    (subset(x = TSLAStock$High, subset = (tsla_stock.avg_high[10]+tsla_stock.de_high[10] < TSLAStock$High) & (TSLAStock$High <= 390 )))
  )
)

#Merged en las fechas iguales
#open_stats_E + high_stats_E
tsla_stock.c_stats_Comparison <- merge(
  tsla_stock.c_open_stats_E,
  tsla_stock.c_high_stats_E,
  by =  "Date",
  all = TRUE,
  suffixes = c("_Open_E","_High_E")
)

#Low dentro de la desviación estándar
tsla_stock.c_low_stats <- data.frame(
  "Date" = c(
    subset(x = TSLAStock$Date, subset = TSLAStock$Low >= (tsla_stock.avg_low[1]-tsla_stock.de_low[1]) & TSLAStock$Low <= (tsla_stock.avg_low[1]+tsla_stock.de_low[1])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Low >= (tsla_stock.avg_low[2]-tsla_stock.de_low[2]) & TSLAStock$Low <= (tsla_stock.avg_low[2]+tsla_stock.de_low[2])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Low >= (tsla_stock.avg_low[3]-tsla_stock.de_low[3]) & TSLAStock$Low <= (tsla_stock.avg_low[3]+tsla_stock.de_low[3])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Low >= (tsla_stock.avg_low[4]-tsla_stock.de_low[4]) & TSLAStock$Low <= (tsla_stock.avg_low[4]+tsla_stock.de_low[4])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Low >= (tsla_stock.avg_low[5]-tsla_stock.de_low[5]) & TSLAStock$Low <= (tsla_stock.avg_low[5]+tsla_stock.de_low[5])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Low >= (tsla_stock.avg_low[6]-tsla_stock.de_low[6]) & TSLAStock$Low <= (tsla_stock.avg_low[6]+tsla_stock.de_low[6])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Low >= (tsla_stock.avg_low[7]-tsla_stock.de_low[7]) & TSLAStock$Low <= (tsla_stock.avg_low[7]+tsla_stock.de_low[7])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Low >= (tsla_stock.avg_low[8]-tsla_stock.de_low[8]) & TSLAStock$Low <= (tsla_stock.avg_low[8]+tsla_stock.de_low[8])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Low >= (tsla_stock.avg_low[9]-tsla_stock.de_low[9]) & TSLAStock$Low <= (tsla_stock.avg_low[9]+tsla_stock.de_low[9])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Low >= (tsla_stock.avg_low[10]-tsla_stock.de_low[10]) & TSLAStock$Low <= (tsla_stock.avg_low[10]+tsla_stock.de_low[10]))
  ),
  "Price_Low" = c(
    subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[1]-tsla_stock.de_low[1]) & TSLAStock$Low <= (tsla_stock.avg_low[1]+tsla_stock.de_low[1])),
    subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[2]-tsla_stock.de_low[2]) & TSLAStock$Low <= (tsla_stock.avg_low[2]+tsla_stock.de_low[2])),
    subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[3]-tsla_stock.de_low[3]) & TSLAStock$Low <= (tsla_stock.avg_low[3]+tsla_stock.de_low[3])),
    subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[4]-tsla_stock.de_low[4]) & TSLAStock$Low <= (tsla_stock.avg_low[4]+tsla_stock.de_low[4])),
    subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[5]-tsla_stock.de_low[5]) & TSLAStock$Low <= (tsla_stock.avg_low[5]+tsla_stock.de_low[5])),
    subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[6]-tsla_stock.de_low[6]) & TSLAStock$Low <= (tsla_stock.avg_low[6]+tsla_stock.de_low[6])),
    subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[7]-tsla_stock.de_low[7]) & TSLAStock$Low <= (tsla_stock.avg_low[7]+tsla_stock.de_low[7])),
    subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[8]-tsla_stock.de_low[8]) & TSLAStock$Low <= (tsla_stock.avg_low[8]+tsla_stock.de_low[8])),
    subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[9]-tsla_stock.de_low[9]) & TSLAStock$Low <= (tsla_stock.avg_low[9]+tsla_stock.de_low[9])),
    subset(x = TSLAStock$Low, subset = TSLAStock$Low >= (tsla_stock.avg_low[10]-tsla_stock.de_low[10]) & TSLAStock$Low <= (tsla_stock.avg_low[10]+tsla_stock.de_low[10]))
  )
)

#Low fuera de la desviación estándar
tsla_stock.c_low_stats_E <- data.frame(
  "Date" = c(
    #140 - 165
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Low > 140 ) & (tsla_stock.avg_low[1]-tsla_stock.de_low[1] > TSLAStock$Low))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_low[1]+tsla_stock.de_low[1] < TSLAStock$Low) & (TSLAStock$Low <= 165 ))),
    #165-190
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Low > 165) & (tsla_stock.avg_low[2]-tsla_stock.de_low[2] > TSLAStock$Low))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_low[2]+tsla_stock.de_low[2] < TSLAStock$Low) & (TSLAStock$Low <= 190 ))),
    #190 - 215
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Low > 190) & (tsla_stock.avg_low[3]-tsla_stock.de_low[3] > TSLAStock$Low))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_low[3]+tsla_stock.de_low[3] < TSLAStock$Low) & (TSLAStock$Low <= 215 ))),
    #215 - 240
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Low > 215) & (tsla_stock.avg_low[4]-tsla_stock.de_low[4] > TSLAStock$Low))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_low[4]+tsla_stock.de_low[4] < TSLAStock$Low) & (TSLAStock$Low <= 240 ))),
    #240 - 265
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Low > 240) & (tsla_stock.avg_low[5]-tsla_stock.de_low[5] > TSLAStock$Low))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_low[5]+tsla_stock.de_low[5] < TSLAStock$Low) & (TSLAStock$Low <= 265 ))),
    #265 - 290
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Low > 265) & (tsla_stock.avg_low[6]-tsla_stock.de_low[6] > TSLAStock$Low))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_low[6]+tsla_stock.de_low[6] < TSLAStock$Low) & (TSLAStock$Low <= 290 ))),
    #290 - 315
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Low > 290) & (tsla_stock.avg_low[7]-tsla_stock.de_low[7] > TSLAStock$Low))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_low[7]+tsla_stock.de_low[7] < TSLAStock$Low) & (TSLAStock$Low <= 315 ))),
    #315 - 340
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Low > 315) & (tsla_stock.avg_low[8]-tsla_stock.de_low[8] > TSLAStock$Low))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_low[8]+tsla_stock.de_low[8] < TSLAStock$Low) & (TSLAStock$Low <= 340 ))),
    #340 - 365
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Low > 340) & (tsla_stock.avg_low[9]-tsla_stock.de_low[9] > TSLAStock$Low))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_low[9]+tsla_stock.de_low[9] < TSLAStock$Low) & (TSLAStock$Low <= 365 ))),
    #365 - 390
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Low > 365) & (tsla_stock.avg_low[10]-tsla_stock.de_low[10] > TSLAStock$Low))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_low[10]+tsla_stock.de_low[10] < TSLAStock$Low) & (TSLAStock$Low <= 390 )))
  ),
  "Price_Low_E" = c(
    #140 - 165
    (subset(x = TSLAStock$Low, subset = (TSLAStock$Low > 140 ) & (tsla_stock.avg_low[1]-tsla_stock.de_low[1] > TSLAStock$Low))),
    (subset(x = TSLAStock$Low, subset = (tsla_stock.avg_low[1]+tsla_stock.de_low[1] < TSLAStock$Low) & (TSLAStock$Low <= 165 ))),
    #165-190
    (subset(x = TSLAStock$Low, subset = (TSLAStock$Low > 165) & (tsla_stock.avg_low[2]-tsla_stock.de_low[2] > TSLAStock$Low))),
    (subset(x = TSLAStock$Low, subset = (tsla_stock.avg_low[2]+tsla_stock.de_low[2] < TSLAStock$Low) & (TSLAStock$Low <= 190 ))),
    #190 - 215
    (subset(x = TSLAStock$Low, subset = (TSLAStock$Low > 190) & (tsla_stock.avg_low[3]-tsla_stock.de_low[3] > TSLAStock$Low))),
    (subset(x = TSLAStock$Low, subset = (tsla_stock.avg_low[3]+tsla_stock.de_low[3] < TSLAStock$Low) & (TSLAStock$Low <= 215 ))),
    #215 - 240
    (subset(x = TSLAStock$Low, subset = (TSLAStock$Low > 215) & (tsla_stock.avg_low[4]-tsla_stock.de_low[4] > TSLAStock$Low))),
    (subset(x = TSLAStock$Low, subset = (tsla_stock.avg_low[4]+tsla_stock.de_low[4] < TSLAStock$Low) & (TSLAStock$Low <= 240 ))),
    #240 - 265
    (subset(x = TSLAStock$Low, subset = (TSLAStock$Low > 240) & (tsla_stock.avg_low[5]-tsla_stock.de_low[5] > TSLAStock$Low))),
    (subset(x = TSLAStock$Low, subset = (tsla_stock.avg_low[5]+tsla_stock.de_low[5] < TSLAStock$Low) & (TSLAStock$Low <= 265 ))),
    #265 - 290
    (subset(x = TSLAStock$Low, subset = (TSLAStock$Low > 265) & (tsla_stock.avg_low[6]-tsla_stock.de_low[6] > TSLAStock$Low))),
    (subset(x = TSLAStock$Low, subset = (tsla_stock.avg_low[6]+tsla_stock.de_low[6] < TSLAStock$Low) & (TSLAStock$Low <= 290 ))),
    #290 - 315
    (subset(x = TSLAStock$Low, subset = (TSLAStock$Low > 290) & (tsla_stock.avg_low[7]-tsla_stock.de_low[7] > TSLAStock$Low))),
    (subset(x = TSLAStock$Low, subset = (tsla_stock.avg_low[7]+tsla_stock.de_low[7] < TSLAStock$Low) & (TSLAStock$Low <= 315 ))),
    #315 - 340
    (subset(x = TSLAStock$Low, subset = (TSLAStock$Low > 315) & (tsla_stock.avg_low[8]-tsla_stock.de_low[8] > TSLAStock$Low))),
    (subset(x = TSLAStock$Low, subset = (tsla_stock.avg_low[8]+tsla_stock.de_low[8] < TSLAStock$Low) & (TSLAStock$Low <= 340 ))),
    #340 - 365
    (subset(x = TSLAStock$Low, subset = (TSLAStock$Low > 340) & (tsla_stock.avg_low[9]-tsla_stock.de_low[9] > TSLAStock$Low))),
    (subset(x = TSLAStock$Low, subset = (tsla_stock.avg_low[9]+tsla_stock.de_low[9] < TSLAStock$Low) & (TSLAStock$Low <= 365 ))),
    #365 - 390
    (subset(x = TSLAStock$Low, subset = (TSLAStock$Low > 365) & (tsla_stock.avg_low[10]-tsla_stock.de_low[10] > TSLAStock$Low))),
    (subset(x = TSLAStock$Low, subset = (tsla_stock.avg_low[10]+tsla_stock.de_low[10] < TSLAStock$Low) & (TSLAStock$Low <= 390 )))
  )
)

#Merge en las fechas iguales
#previa tabla + low_stats_E
tsla_stock.c_stats_Comparison <- merge(
  tsla_stock.c_stats_Comparison,
  tsla_stock.c_low_stats_E,
  by =  "Date",
  all = TRUE
)

#Close dentro de la desviación estándar
tsla_stock.c_close_stats <- data.frame(
  "Date" = c(
    subset(x = TSLAStock$Date, subset = TSLAStock$Close >= (tsla_stock.avg_close[1]-tsla_stock.de_close[1]) & TSLAStock$Close <= (tsla_stock.avg_close[1]+tsla_stock.de_close[1])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Close >= (tsla_stock.avg_close[2]-tsla_stock.de_close[2]) & TSLAStock$Close <= (tsla_stock.avg_close[2]+tsla_stock.de_close[2])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Close >= (tsla_stock.avg_close[3]-tsla_stock.de_close[3]) & TSLAStock$Close <= (tsla_stock.avg_close[3]+tsla_stock.de_close[3])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Close >= (tsla_stock.avg_close[4]-tsla_stock.de_close[4]) & TSLAStock$Close <= (tsla_stock.avg_close[4]+tsla_stock.de_close[4])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Close >= (tsla_stock.avg_close[5]-tsla_stock.de_close[5]) & TSLAStock$Close <= (tsla_stock.avg_close[5]+tsla_stock.de_close[5])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Close >= (tsla_stock.avg_close[6]-tsla_stock.de_close[6]) & TSLAStock$Close <= (tsla_stock.avg_close[6]+tsla_stock.de_close[6])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Close >= (tsla_stock.avg_close[7]-tsla_stock.de_close[7]) & TSLAStock$Close <= (tsla_stock.avg_close[7]+tsla_stock.de_close[7])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Close >= (tsla_stock.avg_close[8]-tsla_stock.de_close[8]) & TSLAStock$Close <= (tsla_stock.avg_close[8]+tsla_stock.de_close[8])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Close >= (tsla_stock.avg_close[9]-tsla_stock.de_close[9]) & TSLAStock$Close <= (tsla_stock.avg_close[9]+tsla_stock.de_close[9])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Close >= (tsla_stock.avg_close[10]-tsla_stock.de_close[10]) & TSLAStock$Close <= (tsla_stock.avg_close[10]+tsla_stock.de_close[10]))
  ),
  "Price_Close" = c(
    subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[1]-tsla_stock.de_close[1]) & TSLAStock$Close <= (tsla_stock.avg_close[1]+tsla_stock.de_close[1])),
    subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[2]-tsla_stock.de_close[2]) & TSLAStock$Close <= (tsla_stock.avg_close[2]+tsla_stock.de_close[2])),
    subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[3]-tsla_stock.de_close[3]) & TSLAStock$Close <= (tsla_stock.avg_close[3]+tsla_stock.de_close[3])),
    subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[4]-tsla_stock.de_close[4]) & TSLAStock$Close <= (tsla_stock.avg_close[4]+tsla_stock.de_close[4])),
    subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[5]-tsla_stock.de_close[5]) & TSLAStock$Close <= (tsla_stock.avg_close[5]+tsla_stock.de_close[5])),
    subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[6]-tsla_stock.de_close[6]) & TSLAStock$Close <= (tsla_stock.avg_close[6]+tsla_stock.de_close[6])),
    subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[7]-tsla_stock.de_close[7]) & TSLAStock$Close <= (tsla_stock.avg_close[7]+tsla_stock.de_close[7])),
    subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[8]-tsla_stock.de_close[8]) & TSLAStock$Close <= (tsla_stock.avg_close[8]+tsla_stock.de_close[8])),
    subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[9]-tsla_stock.de_close[9]) & TSLAStock$Close <= (tsla_stock.avg_close[9]+tsla_stock.de_close[9])),
    subset(x = TSLAStock$Close, subset = TSLAStock$Close >= (tsla_stock.avg_close[10]-tsla_stock.de_close[10]) & TSLAStock$Close <= (tsla_stock.avg_close[10]+tsla_stock.de_close[10]))
  )
)

#Close fuera de la desviación estándar
tsla_stock.c_close_stats_E <- data.frame(
  "Date" = c(
    #140 - 165
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Close > 140 ) & (tsla_stock.avg_close[1]-tsla_stock.de_close[1] > TSLAStock$Close))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_close[1]+tsla_stock.de_close[1] < TSLAStock$Close) & (TSLAStock$Close <= 165 ))),
    #165-190
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Close > 165) & (tsla_stock.avg_close[2]-tsla_stock.de_close[2] > TSLAStock$Close))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_close[2]+tsla_stock.de_close[2] < TSLAStock$Close) & (TSLAStock$Close <= 190 ))),
    #190 - 215
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Close > 190) & (tsla_stock.avg_close[3]-tsla_stock.de_close[3] > TSLAStock$Close))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_close[3]+tsla_stock.de_close[3] < TSLAStock$Close) & (TSLAStock$Close <= 215 ))),
    #215 - 240
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Close > 215) & (tsla_stock.avg_close[4]-tsla_stock.de_close[4] > TSLAStock$Close))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_close[4]+tsla_stock.de_close[4] < TSLAStock$Close) & (TSLAStock$Close <= 240 ))),
    #240 - 265
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Close > 240) & (tsla_stock.avg_close[5]-tsla_stock.de_close[5] > TSLAStock$Close))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_close[5]+tsla_stock.de_close[5] < TSLAStock$Close) & (TSLAStock$Close <= 265 ))),
    #265 - 290
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Close > 265) & (tsla_stock.avg_close[6]-tsla_stock.de_close[6] > TSLAStock$Close))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_close[6]+tsla_stock.de_close[6] < TSLAStock$Close) & (TSLAStock$Close <= 290 ))),
    #290 - 315
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Close > 290) & (tsla_stock.avg_close[7]-tsla_stock.de_close[7] > TSLAStock$Close))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_close[7]+tsla_stock.de_close[7] < TSLAStock$Close) & (TSLAStock$Close <= 315 ))),
    #315 - 340
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Close > 315) & (tsla_stock.avg_close[8]-tsla_stock.de_close[8] > TSLAStock$Close))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_close[8]+tsla_stock.de_close[8] < TSLAStock$Close) & (TSLAStock$Close <= 340 ))),
    #340 - 365
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Close > 340) & (tsla_stock.avg_close[9]-tsla_stock.de_close[9] > TSLAStock$Close))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_close[9]+tsla_stock.de_close[9] < TSLAStock$Close) & (TSLAStock$Close <= 365 ))),
    #365 - 390
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Close > 365) & (tsla_stock.avg_close[10]-tsla_stock.de_close[10] > TSLAStock$Close))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_close[10]+tsla_stock.de_close[10] < TSLAStock$Close) & (TSLAStock$Close <= 390 )))
  ),
  "Price_Close_E" = c(
    #140 - 165
    (subset(x = TSLAStock$Close, subset = (TSLAStock$Close > 140 ) & (tsla_stock.avg_close[1]-tsla_stock.de_close[1] > TSLAStock$Close))),
    (subset(x = TSLAStock$Close, subset = (tsla_stock.avg_close[1]+tsla_stock.de_close[1] < TSLAStock$Close) & (TSLAStock$Close <= 165 ))),
    #165-190
    (subset(x = TSLAStock$Close, subset = (TSLAStock$Close > 165) & (tsla_stock.avg_close[2]-tsla_stock.de_close[2] > TSLAStock$Close))),
    (subset(x = TSLAStock$Close, subset = (tsla_stock.avg_close[2]+tsla_stock.de_close[2] < TSLAStock$Close) & (TSLAStock$Close <= 190 ))),
    #190 - 215
    (subset(x = TSLAStock$Close, subset = (TSLAStock$Close > 190) & (tsla_stock.avg_close[3]-tsla_stock.de_close[3] > TSLAStock$Close))),
    (subset(x = TSLAStock$Close, subset = (tsla_stock.avg_close[3]+tsla_stock.de_close[3] < TSLAStock$Close) & (TSLAStock$Close <= 215 ))),
    #215 - 240
    (subset(x = TSLAStock$Close, subset = (TSLAStock$Close > 215) & (tsla_stock.avg_close[4]-tsla_stock.de_close[4] > TSLAStock$Close))),
    (subset(x = TSLAStock$Close, subset = (tsla_stock.avg_close[4]+tsla_stock.de_close[4] < TSLAStock$Close) & (TSLAStock$Close <= 240 ))),
    #240 - 265
    (subset(x = TSLAStock$Close, subset = (TSLAStock$Close > 240) & (tsla_stock.avg_close[5]-tsla_stock.de_close[5] > TSLAStock$Close))),
    (subset(x = TSLAStock$Close, subset = (tsla_stock.avg_close[5]+tsla_stock.de_close[5] < TSLAStock$Close) & (TSLAStock$Close <= 265 ))),
    #265 - 290
    (subset(x = TSLAStock$Close, subset = (TSLAStock$Close > 265) & (tsla_stock.avg_close[6]-tsla_stock.de_close[6] > TSLAStock$Close))),
    (subset(x = TSLAStock$Close, subset = (tsla_stock.avg_close[6]+tsla_stock.de_close[6] < TSLAStock$Close) & (TSLAStock$Close <= 290 ))),
    #290 - 315
    (subset(x = TSLAStock$Close, subset = (TSLAStock$Close > 290) & (tsla_stock.avg_close[7]-tsla_stock.de_close[7] > TSLAStock$Close))),
    (subset(x = TSLAStock$Close, subset = (tsla_stock.avg_close[7]+tsla_stock.de_close[7] < TSLAStock$Close) & (TSLAStock$Close <= 315 ))),
    #315 - 340
    (subset(x = TSLAStock$Close, subset = (TSLAStock$Close > 315) & (tsla_stock.avg_close[8]-tsla_stock.de_close[8] > TSLAStock$Close))),
    (subset(x = TSLAStock$Close, subset = (tsla_stock.avg_close[8]+tsla_stock.de_close[8] < TSLAStock$Close) & (TSLAStock$Close <= 340 ))),
    #340 - 365
    (subset(x = TSLAStock$Close, subset = (TSLAStock$Close > 340) & (tsla_stock.avg_close[9]-tsla_stock.de_close[9] > TSLAStock$Close))),
    (subset(x = TSLAStock$Close, subset = (tsla_stock.avg_close[9]+tsla_stock.de_close[9] < TSLAStock$Close) & (TSLAStock$Close <= 365 ))),
    #365 - 390
    (subset(x = TSLAStock$Close, subset = (TSLAStock$Close > 365) & (tsla_stock.avg_close[10]-tsla_stock.de_close[10] > TSLAStock$Close))),
    (subset(x = TSLAStock$Close, subset = (tsla_stock.avg_close[10]+tsla_stock.de_close[10] < TSLAStock$Close) & (TSLAStock$Close <= 390 )))
  )
)

#Merge en las fechas iguales
#previa tabla + close_stats_E
tsla_stock.c_stats_Comparison <- merge(
  tsla_stock.c_stats_Comparison,
  tsla_stock.c_close_stats_E,
  by =  "Date",
  all = TRUE
)

#Volume dentro de la desviación estándar
tsla_stock.c_volume_stats <- data.frame(
  "Date" = c(
    subset(x = TSLAStock$Date, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[1]-tsla_stock.de_volume[1]) & TSLAStock$Volume <= (tsla_stock.avg_volume[1]+tsla_stock.de_volume[1])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[2]-tsla_stock.de_volume[2]) & TSLAStock$Volume <= (tsla_stock.avg_volume[2]+tsla_stock.de_volume[2])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[3]-tsla_stock.de_volume[3]) & TSLAStock$Volume <= (tsla_stock.avg_volume[3]+tsla_stock.de_volume[3])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[4]-tsla_stock.de_volume[4]) & TSLAStock$Volume <= (tsla_stock.avg_volume[4]+tsla_stock.de_volume[4])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[5]-tsla_stock.de_volume[5]) & TSLAStock$Volume <= (tsla_stock.avg_volume[5]+tsla_stock.de_volume[5])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[6]-tsla_stock.de_volume[6]) & TSLAStock$Volume <= (tsla_stock.avg_volume[6]+tsla_stock.de_volume[6])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[7]-tsla_stock.de_volume[7]) & TSLAStock$Volume <= (tsla_stock.avg_volume[7]+tsla_stock.de_volume[7])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[8]-tsla_stock.de_volume[8]) & TSLAStock$Volume <= (tsla_stock.avg_volume[8]+tsla_stock.de_volume[8])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[9]-tsla_stock.de_volume[9]) & TSLAStock$Volume <= (tsla_stock.avg_volume[9]+tsla_stock.de_volume[9])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[10]-tsla_stock.de_volume[10]) & TSLAStock$Volume <= (tsla_stock.avg_volume[10]+tsla_stock.de_volume[10]))
  ),
  "Volume" = c(
    subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[1]-tsla_stock.de_volume[1]) & TSLAStock$Volume <= (tsla_stock.avg_volume[1]+tsla_stock.de_volume[1])),
    subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[2]-tsla_stock.de_volume[2]) & TSLAStock$Volume <= (tsla_stock.avg_volume[2]+tsla_stock.de_volume[2])),
    subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[3]-tsla_stock.de_volume[3]) & TSLAStock$Volume <= (tsla_stock.avg_volume[3]+tsla_stock.de_volume[3])),
    subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[4]-tsla_stock.de_volume[4]) & TSLAStock$Volume <= (tsla_stock.avg_volume[4]+tsla_stock.de_volume[4])),
    subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[5]-tsla_stock.de_volume[5]) & TSLAStock$Volume <= (tsla_stock.avg_volume[5]+tsla_stock.de_volume[5])),
    subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[6]-tsla_stock.de_volume[6]) & TSLAStock$Volume <= (tsla_stock.avg_volume[6]+tsla_stock.de_volume[6])),
    subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[7]-tsla_stock.de_volume[7]) & TSLAStock$Volume <= (tsla_stock.avg_volume[7]+tsla_stock.de_volume[7])),
    subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[8]-tsla_stock.de_volume[8]) & TSLAStock$Volume <= (tsla_stock.avg_volume[8]+tsla_stock.de_volume[8])),
    subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[9]-tsla_stock.de_volume[9]) & TSLAStock$Volume <= (tsla_stock.avg_volume[9]+tsla_stock.de_volume[9])),
    subset(x = TSLAStock$Volume, subset = TSLAStock$Volume >= as.double(tsla_stock.avg_volume[10]-tsla_stock.de_volume[10]) & TSLAStock$Volume <= (tsla_stock.avg_volume[10]+tsla_stock.de_volume[10]))
  )
)

#Volume fuera de la desviación estándar
tsla_stock.c_volume_stats_E <- data.frame(
  "Date" = c(
    #700000 - 4030000
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Volume > 700000 ) & (tsla_stock.avg_volume[1]-tsla_stock.de_volume[1] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_volume[1]+tsla_stock.de_volume[1] < TSLAStock$Volume) & (TSLAStock$Volume <= 4030000 ))),
    #4030000 - 7360000
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Volume > 4030000) & (tsla_stock.avg_volume[2]-tsla_stock.de_volume[2] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_volume[2]+tsla_stock.de_volume[2] < TSLAStock$Volume) & (TSLAStock$Volume <= 7360000 ))),
    #7360000 - 10690000
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Volume > 7360000) & (tsla_stock.avg_volume[3]-tsla_stock.de_volume[3] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_volume[3]+tsla_stock.de_volume[3] < TSLAStock$Volume) & (TSLAStock$Volume <= 10690000 ))),
    #10690000 - 14020000
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Volume > 10690000) & (tsla_stock.avg_volume[4]-tsla_stock.de_volume[4] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_volume[4]+tsla_stock.de_volume[4] < TSLAStock$Volume) & (TSLAStock$Volume <= 14020000 ))),
    #14020000 - 17350000
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Volume > 14020000) & (tsla_stock.avg_volume[5]-tsla_stock.de_volume[5] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_volume[5]+tsla_stock.de_volume[5] < TSLAStock$Volume) & (TSLAStock$Volume <= 17350000 ))),
    #17350000 - 20680000
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Volume > 17350000) & (tsla_stock.avg_volume[6]-tsla_stock.de_volume[6] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_volume[6]+tsla_stock.de_volume[6] < TSLAStock$Volume) & (TSLAStock$Volume <= 20680000 ))),
    #20680000 - 24010000
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Volume > 20680000) & (tsla_stock.avg_volume[7]-tsla_stock.de_volume[7] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_volume[7]+tsla_stock.de_volume[7] < TSLAStock$Volume) & (TSLAStock$Volume <= 24010000 ))),
    #24010000 - 27340000
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Volume > 24010000) & (tsla_stock.avg_volume[8]-tsla_stock.de_volume[8] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_volume[8]+tsla_stock.de_volume[8] < TSLAStock$Volume) & (TSLAStock$Volume <= 27340000 ))),
    #27340000 - 30670000
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Volume > 27340000) & (tsla_stock.avg_volume[9]-tsla_stock.de_volume[9] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_volume[9]+tsla_stock.de_volume[9] < TSLAStock$Volume) & (TSLAStock$Volume <= 30670000 ))),
    #30670000 - 34000000
    (subset(x = TSLAStock$Date, subset = (TSLAStock$Volume > 30670000) & (tsla_stock.avg_volume[10]-tsla_stock.de_volume[10] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Date, subset = (tsla_stock.avg_volume[10]+tsla_stock.de_volume[10] < TSLAStock$Volume) & (TSLAStock$Volume <= 34000000 )))
  ),
  "Volume_E" = c(
    #700000 - 4030000
    (subset(x = TSLAStock$Volume, subset = (TSLAStock$Volume > 700000 ) & (tsla_stock.avg_volume[1]-tsla_stock.de_volume[1] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Volume, subset = (tsla_stock.avg_volume[1]+tsla_stock.de_volume[1] < TSLAStock$Volume) & (TSLAStock$Volume <= 4030000 ))),
    #4030000 - 7360000
    (subset(x = TSLAStock$Volume, subset = (TSLAStock$Volume > 4030000) & (tsla_stock.avg_volume[2]-tsla_stock.de_volume[2] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Volume, subset = (tsla_stock.avg_volume[2]+tsla_stock.de_volume[2] < TSLAStock$Volume) & (TSLAStock$Volume <= 7360000 ))),
    #7360000 - 10690000
    (subset(x = TSLAStock$Volume, subset = (TSLAStock$Volume > 7360000) & (tsla_stock.avg_volume[3]-tsla_stock.de_volume[3] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Volume, subset = (tsla_stock.avg_volume[3]+tsla_stock.de_volume[3] < TSLAStock$Volume) & (TSLAStock$Volume <= 10690000 ))),
    #10690000 - 14020000
    (subset(x = TSLAStock$Volume, subset = (TSLAStock$Volume > 10690000) & (tsla_stock.avg_volume[4]-tsla_stock.de_volume[4] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Volume, subset = (tsla_stock.avg_volume[4]+tsla_stock.de_volume[4] < TSLAStock$Volume) & (TSLAStock$Volume <= 14020000 ))),
    #14020000 - 17350000
    (subset(x = TSLAStock$Volume, subset = (TSLAStock$Volume > 14020000) & (tsla_stock.avg_volume[5]-tsla_stock.de_volume[5] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Volume, subset = (tsla_stock.avg_volume[5]+tsla_stock.de_volume[5] < TSLAStock$Volume) & (TSLAStock$Volume <= 17350000 ))),
    #17350000 - 20680000
    (subset(x = TSLAStock$Volume, subset = (TSLAStock$Volume > 17350000) & (tsla_stock.avg_volume[6]-tsla_stock.de_volume[6] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Volume, subset = (tsla_stock.avg_volume[6]+tsla_stock.de_volume[6] < TSLAStock$Volume) & (TSLAStock$Volume <= 20680000 ))),
    #20680000 - 24010000
    (subset(x = TSLAStock$Volume, subset = (TSLAStock$Volume > 20680000) & (tsla_stock.avg_volume[7]-tsla_stock.de_volume[7] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Volume, subset = (tsla_stock.avg_volume[7]+tsla_stock.de_volume[7] < TSLAStock$Volume) & (TSLAStock$Volume <= 24010000 ))),
    #24010000 - 27340000
    (subset(x = TSLAStock$Volume, subset = (TSLAStock$Volume > 24010000) & (tsla_stock.avg_volume[8]-tsla_stock.de_volume[8] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Volume, subset = (tsla_stock.avg_volume[8]+tsla_stock.de_volume[8] < TSLAStock$Volume) & (TSLAStock$Volume <= 27340000 ))),
    #27340000 - 30670000
    (subset(x = TSLAStock$Volume, subset = (TSLAStock$Volume > 27340000) & (tsla_stock.avg_volume[9]-tsla_stock.de_volume[9] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Volume, subset = (tsla_stock.avg_volume[9]+tsla_stock.de_volume[9] < TSLAStock$Volume) & (TSLAStock$Volume <= 30670000 ))),
    #30670000 - 34000000
    (subset(x = TSLAStock$Volume, subset = (TSLAStock$Volume > 30670000) & (tsla_stock.avg_volume[10]-tsla_stock.de_volume[10] > TSLAStock$Volume))),
    (subset(x = TSLAStock$Volume, subset = (tsla_stock.avg_volume[10]+tsla_stock.de_volume[10] < TSLAStock$Volume) & (TSLAStock$Volume <= 34000000 )))
  )
)

#Merge en las fechas iguales
#previa tabla + volume_stats_E
tsla_stock.c_stats_Comparison <- merge(
  tsla_stock.c_stats_Comparison,
  tsla_stock.c_volume_stats_E,
  by =  "Date",
  all = TRUE
)

#Union con la previa tabla + volume_stats
tsla_stock.c_stats <- merge(
  tsla_stock.c_stats,
  tsla_stock.c_volume_stats,
  by =  "Date",
  all = TRUE
)

#Vista de tabla dentro de la desviación
#View(tsla_stock.c_stats) 
#Vista de tabla fuera de la desviación
#View(tsla_stock.c_stats_Comparison)

#
# Las siguentes 4 cadenas no son necesarias - solo es un contador para ver cuantos registros hay en dentro de cada subtabla
# 

# Cantidad de fechas que tienen un precio de apertura (Price_Open)
tsla_stock.c_open_cant <- nrow(
  subset(
    x = tsla_stock.c_stats,
    subset = nchar(Price_Open) > 1
    )
)

# Cantidad de fechas que tienen un precio alto (Price_High)
tsla_stock.c_high_cant <- nrow(
  subset(
    x = tsla_stock.c_stats,
    subset = nchar(Price_High) >1
  ) 
)

# Cantidad de fechas que tienen un precio de cierre (Price_Close)
tsla_stock.c_close_cant <- nrow(
  subset(
    x = tsla_stock.c_stats,
    subset = nchar(Price_Close) >1
  ) 
)

# Cantidad de fechas que tienen un precio mas bajo (Price_Low)
tsla_stock.c_Low_cant <- nrow(
  subset(
    x = tsla_stock.c_stats,
    subset = nchar(Price_Low) >1
  ) 
)

# Cantidad de fechas que tienen un precio en el volume

# Se va realizar multiples tablas de difrentes rangos con base a la cantidad de combinaciónes que se pueden hacer con
# las 4 columnas que se van a contemplar (sin repeticiónes) y de eso, determinar en base a eso cuales cumplen las mejores
# caracteristicas a las peores. (Las 24 son provicional, lo ideal es que sean 12 o menos.)

# Toda la información de aquellas fechas que coinciden dentro de la desviación estandar

#Open
tsla_stock.c_dataR1 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    (nchar(Price_Open) > 1) #&
#      (nchar(Price_High) > 1) &
#      (nchar(Price_Low) > 1) &
#      (nchar(Price_Close) > 1) &
#      (nchar(Volume) > 1)
  )
)

#Open _E
tsla_stock.c_dataR1E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    (nchar(Price_Open_E) > 1) #&
    #      (nchar(Price_High) > 1) &
    #      (nchar(Price_Low) > 1) &
    #      (nchar(Price_Close) > 1) &
    #      (nchar(Volume) > 1)
  )
)

#Open, High
tsla_stock.c_dataR2 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    (nchar(Price_Open) > 1) &
    (nchar(Price_High) > 1) #&
    #      (nchar(Price_Low) > 1) &
    #      (nchar(Price_Close) > 1) &
    #      (nchar(Volume) > 1)
  )
)

#Open, High _E
tsla_stock.c_dataR2E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    (nchar(Price_Open_E) > 1) &
    (nchar(Price_High_E) > 1) #&
    #      (nchar(Price_Low) > 1) &
    #      (nchar(Price_Close) > 1) &
    #      (nchar(Volume) > 1)
  )
)

#Open, High, Low
tsla_stock.c_dataR3 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    (nchar(Price_Open) > 1) &
    (nchar(Price_High) > 1) &
    (nchar(Price_Low) > 1) #&
    #      (nchar(Price_Close) > 1) &
    #      (nchar(Volume) > 1)
  )
)

#Open, High, Low _E
tsla_stock.c_dataR3E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    (nchar(Price_Open_E) > 1) &
    (nchar(Price_High_E) > 1) &
    (nchar(Price_Low_E) > 1) #&
    #      (nchar(Price_Close) > 1) &
    #      (nchar(Volume) > 1)
  )
)

#Open, High, Low, Close 
tsla_stock.c_dataR4 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    (nchar(Price_Open) > 1) &
    (nchar(Price_High) > 1) &
    (nchar(Price_Low) > 1) &
    (nchar(Price_Close) > 1) #&
    #      (nchar(Volume) > 1)
  )
)

#Open, High, Low, Close _E
tsla_stock.c_dataR4E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    (nchar(Price_Open_E) > 1) &
    (nchar(Price_High_E) > 1) &
    (nchar(Price_Low_E) > 1) &
    (nchar(Price_Close_E) > 1) #&
    #      (nchar(Volume) > 1)
  )
)

#Open, High, Low, Close, Volume
tsla_stock.c_dataR5 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    (nchar(Price_Open) > 1) &
    (nchar(Price_High) > 1) &
    (nchar(Price_Low) > 1) &
    (nchar(Price_Close) > 1) &
    (nchar(Volume) > 1)
  )
)

#Open, High, Low, Close, Volume _E
tsla_stock.c_dataR5E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    (nchar(Price_Open_E) > 1) &
    (nchar(Price_High_E) > 1) &
    (nchar(Price_Low_E) > 1) &
    (nchar(Price_Close_E) > 1) &
    (nchar(Volume_E) > 1)
  )
)

#High
tsla_stock.c_dataR6 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    #(nchar(Price_Open) > 1) &
    (nchar(Price_High) > 1) #&
    #(nchar(Price_Low) > 1) &
    #(nchar(Price_Close) > 1) &
    #(nchar(Volume) > 1)
  )
)

#High _E
tsla_stock.c_dataR6E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    #(nchar(Price_Open) > 1) &
    (nchar(Price_High_E) > 1) #&
    #(nchar(Price_Low) > 1) &
    #(nchar(Price_Close) > 1) &
    #(nchar(Volume) > 1)
  )
)

#High, Low 
tsla_stock.c_dataR7 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    #(nchar(Price_Open) > 1) &
    (nchar(Price_High) > 1) &
    (nchar(Price_Low) > 1) #&
    #(nchar(Price_Close) > 1) &
    #(nchar(Volume) > 1)
  )
)

#High, Low _E
tsla_stock.c_dataR7E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    #(nchar(Price_Open) > 1) &
    (nchar(Price_High_E) > 1) &
    (nchar(Price_Low_E) > 1) #&
    #(nchar(Price_Close) > 1) &
    #(nchar(Volume) > 1)
  )
)

#High, Low, Close
tsla_stock.c_dataR8 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    #(nchar(Price_Open) > 1) &
    (nchar(Price_High) > 1) &
    (nchar(Price_Low) > 1) &
    (nchar(Price_Close) > 1) #&
    #(nchar(Volume) > 1)
  )
)

#High, Low, Close _E
tsla_stock.c_dataR8E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    #(nchar(Price_Open) > 1) &
    (nchar(Price_High_E) > 1) &
    (nchar(Price_Low_E) > 1) &
    (nchar(Price_Close_E) > 1) #&
    #(nchar(Volume) > 1)
  )
)

#High, Low, Close, Volume
tsla_stock.c_dataR9 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    #(nchar(Price_Open) > 1) &
    (nchar(Price_High) > 1) &
    (nchar(Price_Low) > 1) &
    (nchar(Price_Close) > 1) &
    (nchar(Volume) > 1)
  )
)

#High, Low, Close, Volume _E
tsla_stock.c_dataR9E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    #(nchar(Price_Open) > 1) &
    (nchar(Price_High_E) > 1) &
    (nchar(Price_Low_E) > 1) &
    (nchar(Price_Close_E) > 1) &
    (nchar(Volume_E) > 1)
  )
)

#Low
tsla_stock.c_dataR10 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    #(nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    (nchar(Price_Low) > 1) #&
    #(nchar(Price_Close) > 1) &
    #(nchar(Volume) > 1)
  )
)

#Low _E
tsla_stock.c_dataR10E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    #(nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    (nchar(Price_Low_E) > 1) #&
    #(nchar(Price_Close) > 1) &
    #(nchar(Volume) > 1)
  )
)

#Low, Close
tsla_stock.c_dataR11 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    #(nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    (nchar(Price_Low) > 1) &
    (nchar(Price_Close) > 1) #&
    #(nchar(Volume) > 1)
  )
)

#Low, Close _E
tsla_stock.c_dataR11E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    #(nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    (nchar(Price_Low_E) > 1) &
    (nchar(Price_Close_E) > 1) #&
    #(nchar(Volume) > 1)
  )
)

#Low, Close, Volume
tsla_stock.c_dataR12 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    #(nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    (nchar(Price_Low) > 1) &
    (nchar(Price_Close) > 1) &
    (nchar(Volume) > 1)
  )
)

#Low, Close, Volume _E
tsla_stock.c_dataR12E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    #(nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    (nchar(Price_Low_E) > 1) &
    (nchar(Price_Close_E) > 1) &
    (nchar(Volume_E) > 1)
  )
)

#Close
tsla_stock.c_dataR13 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    #(nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    #(nchar(Price_Low) > 1) #&
    (nchar(Price_Close) > 1) #&
    #(nchar(Volume) > 1)
  )
)

#Close _E
tsla_stock.c_dataR13E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    #(nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    #(nchar(Price_Low) > 1) #&
    (nchar(Price_Close_E) > 1) #&
    #(nchar(Volume) > 1)
  )
)

#Close, Volume
tsla_stock.c_dataR14 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    #(nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    #(nchar(Price_Low) > 1) &
    (nchar(Price_Close) > 1) &
    (nchar(Volume) > 1)
  )
)

#Close, Volume _E
tsla_stock.c_dataR14E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    #(nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    #(nchar(Price_Low) > 1) #&
    (nchar(Price_Close_E) > 1) &
    (nchar(Volume_E) > 1)
  )
)

#Volume
tsla_stock.c_dataR15 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    #(nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    #(nchar(Price_Low) > 1) &
    #(nchar(Price_Close) > 1) &
    (nchar(Volume) > 1)
  )
)

#Volume _E
tsla_stock.c_dataR15E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    #(nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    #(nchar(Price_Low) > 1) &
    #(nchar(Price_Close) > 1) &
    (nchar(Volume_E) > 1)
  )
)

#Open, Low
tsla_stock.c_dataR16 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    (nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    (nchar(Price_Low) > 1) #&
    #(nchar(Price_Close) > 1) &
    #(nchar(Volume) > 1)
  )
)

#Open, Low _E
tsla_stock.c_dataR16E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    (nchar(Price_Open_E) > 1) &
    #(nchar(Price_High) > 1) &
    (nchar(Price_Low_E) > 1) #&
    #(nchar(Price_Close) > 1) &
    #(nchar(Volume) > 1)
  )
)

#Open, Low, Close
tsla_stock.c_dataR17 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    (nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    (nchar(Price_Low) > 1) &
    (nchar(Price_Close) > 1) #&
    #(nchar(Volume) > 1)
  )
)

#Open, Low, Close _E
tsla_stock.c_dataR17E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    (nchar(Price_Open_E) > 1) &
    #(nchar(Price_High) > 1) &
    (nchar(Price_Low_E) > 1) &
    (nchar(Price_Close_E) > 1) #&
    #(nchar(Volume) > 1)
  )
)

#Open, Low, Close, Volume
tsla_stock.c_dataR18 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    (nchar(Price_Open) > 1) &
      #(nchar(Price_High) > 1) &
    (nchar(Price_Low) > 1) &
    (nchar(Price_Close) > 1) &
    (nchar(Volume) > 1)
  )
)

#Open, Low, Close, Volume _E
tsla_stock.c_dataR18E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    (nchar(Price_Open_E) > 1) &
    #(nchar(Price_High) > 1) &
    (nchar(Price_Low_E) > 1) &
    (nchar(Price_Close_E) > 1) &
    (nchar(Volume_E) > 1)
  )
)

#Open, Close
tsla_stock.c_dataR19 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    (nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    #(nchar(Price_Low) > 1) &
    (nchar(Price_Close) > 1) #&
    #(nchar(Volume) > 1)
  )
)

#Open, Close _E
tsla_stock.c_dataR19E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    (nchar(Price_Open_E) > 1) &
    #(nchar(Price_High) > 1) &
    #(nchar(Price_Low) > 1) &
    (nchar(Price_Close_E) > 1) #&
    #(nchar(Volume) > 1)
  )
)

#Open, High, Close
tsla_stock.c_dataR20 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    (nchar(Price_Open) > 1) &
    (nchar(Price_High) > 1) &
    #(nchar(Price_Low) > 1) &
    (nchar(Price_Close) > 1) #&
    #(nchar(Volume) > 1)
  )
)

#Open, High, Close _E
tsla_stock.c_dataR20E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    (nchar(Price_Open_E) > 1) &
    (nchar(Price_High_E) > 1) &
    #(nchar(Price_Low) > 1) &
    (nchar(Price_Close_E) > 1) #&
    #(nchar(Volume) > 1)
  )
)

#Open, Close, Volume
tsla_stock.c_dataR21 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    (nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    #(nchar(Price_Low) > 1) &
    (nchar(Price_Close) > 1) &
    (nchar(Volume) > 1)
  )
)

#Open, Close, Volume _E
tsla_stock.c_dataR21E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    (nchar(Price_Open_E) > 1) &
    #(nchar(Price_High) > 1) &
    #(nchar(Price_Low) > 1) &
    (nchar(Price_Close_E) > 1) &
    (nchar(Volume_E) > 1)
  )
)

#Open, High, Close, Volume
tsla_stock.c_dataR22 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    (nchar(Price_Open) > 1) &
    (nchar(Price_High) > 1) &
    #(nchar(Price_Low) > 1) &
    (nchar(Price_Close) > 1) &
    (nchar(Volume) > 1)
  )
)

#Open, High, Close, Volume _E
tsla_stock.c_dataR22E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    (nchar(Price_Open_E) > 1) &
    (nchar(Price_High_E) > 1) &
    #(nchar(Price_Low) > 1) &
    (nchar(Price_Close_E) > 1) &
    (nchar(Volume_E) > 1)
  )
)

#Open, Volume
tsla_stock.c_dataR23 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    (nchar(Price_Open) > 1) &
    #(nchar(Price_High) > 1) &
    #(nchar(Price_Low) > 1) &
    #(nchar(Price_Close) > 1) &
    (nchar(Volume) > 1)
  )
)

#Open, Volume _E
tsla_stock.c_dataR23E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    (nchar(Price_Open_E) > 1) &
    #(nchar(Price_High) > 1) &
    #(nchar(Price_Low) > 1) &
    #(nchar(Price_Close) > 1) &
    (nchar(Volume_E) > 1)
  )
)

#Open, High, Volume,
tsla_stock.c_dataR24 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    (nchar(Price_Open) > 1) &
    (nchar(Price_High) > 1) &
    #(nchar(Price_Low) > 1) &
    #(nchar(Price_Close) > 1) &
    (nchar(Volume) > 1)
  )
)

#Open, High, Volume _E
tsla_stock.c_dataR24E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    (nchar(Price_Open_E) > 1) &
      (nchar(Price_High_E) > 1) &
      #(nchar(Price_Low) > 1) &
      #(nchar(Price_Close) > 1) &
      (nchar(Volume_E) > 1)
  )
)

#Open, High, Low, Volume
tsla_stock.c_dataR25 <- subset(
  x = tsla_stock.c_stats,
  subset = (
    (nchar(Price_Open) > 1) &
    (nchar(Price_High) > 1) &
    (nchar(Price_Low) > 1) &
    #(nchar(Price_Close) > 1) &
    (nchar(Volume) > 1)
  )
)

#Open, High, Low, Volume _E
tsla_stock.c_dataR25E <- subset(
  x = tsla_stock.c_stats_Comparison,
  subset = (
    (nchar(Price_Open_E) > 1) &
    (nchar(Price_High_E) > 1) &
    (nchar(Price_Low_E) > 1) &
    #(nchar(Price_Close) > 1) &
    (nchar(Volume_E) > 1)
  )
)

plot_intro(tsla_stock.c_dataR1) #19.7% Faltantes
plot_missing(tsla_stock.c_dataR1)#PL = 25.13%, PH = 25.65%, PC = 27.36%, V = 40.18%

plot_intro(tsla_stock.c_dataR1E) #31.1% Faltantes
plot_missing(tsla_stock.c_dataR1E) #PHE = 38.59%, PCE = 42.42%, PLE = 43.43%, VE = 62.02

plot_intro(tsla_stock.c_dataR2) #14.9% Faltantes
plot_missing(tsla_stock.c_dataR2) #PC = 18.84%, PL = 31.69%, V = 38.91%

plot_intro(tsla_stock.c_dataR2E) #25.1% Faltantes
plot_missing(tsla_stock.c_dataR2E) #PCE = 32.24%, PLE = 57.57%, VE = 60.53%

plot_intro(tsla_stock.c_dataR3) #7.6% Faltantes
plot_missing(tsla_stock.c_dataR3) #PC= 5.93%, V = 39.95%

plot_intro(tsla_stock.c_dataR3E) #10.7% Faltantes
plot_missing(tsla_stock.c_dataR3E) #VE = 62.79%

plot_intro(tsla_stock.c_dataR4) #6.6% Faltantes
plot_missing(tsla_stock.c_dataR4) #V = 39.73%

plot_intro(tsla_stock.c_dataR4E) #10.5%% Faltantes
plot_missing(tsla_stock.c_dataR4E) #V = 62.99%

plot_intro(tsla_stock.c_dataR5) #0% Faltantes
plot_missing(tsla_stock.c_dataR5) #0% Todo

plot_intro(tsla_stock.c_dataR5E) #0% Faltantes
plot_missing(tsla_stock.c_dataR5E) #0% TODO

plot_intro(tsla_stock.c_dataR6) #21.9% Faltantes
plot_missing(tsla_stock.c_dataR6) #PC = 24.51%, PO = 25.16%, V = 38.08%, PL = 43.61%

plot_intro(tsla_stock.c_dataR6E) #34.7% Faltantes
plot_missing(tsla_stock.c_dataR6E) #PCE = 38.2%, POE = 39.2%, VE = 58.8%, PLE = 71.8%

plot_intro(tsla_stock.c_dataR7) #9.6% Faltantes
plot_missing(tsla_stock.c_dataR7) #PC = 8.41, PO = 9.35%, V = 39.72%

plot_intro(tsla_stock.c_dataR7E) #12.3% Faltantes
plot_missing(tsla_stock.c_dataR7E) #PCE = 4.26, POE = 8.51, VE = 60.99%

plot_intro(tsla_stock.c_dataR8) #7.7% Faltantes
plot_missing(tsla_stock.c_dataR8) #PO = 6.89%, V = 39.29%

plot_intro(tsla_stock.c_dataR8E) #11.2% Faltantes
plot_missing(tsla_stock.c_dataR8E) #POE = 5.93%, VE = 61.48%

plot_intro(tsla_stock.c_dataR9) #1.3% Faltantes
plot_missing(tsla_stock.c_dataR9) #PO = 7.56%

plot_intro(tsla_stock.c_dataR9E) #1.6% Faltantes
plot_missing(tsla_stock.c_dataR9E) #POE = 9.62%

plot_intro(tsla_stock.c_dataR10) #23.4% Faltantes
plot_missing(tsla_stock.c_dataR10) #PC = 26.56%, PO = 27.32%, V = 40.79%, PH = 45.62%

plot_intro(tsla_stock.c_dataR10E) #35.6% Faltantes
plot_missing(tsla_stock.c_dataR10E) #PCE = 39.62%, POE = 40.68%, VE = 63.14%, PHE = 70.13%

plot_intro(tsla_stock.c_dataR11) #15.6% Faltantes
plot_missing(tsla_stock.c_dataR11) #PO = 21.28%, PH = 32.18%, V = 40.31%

plot_intro(tsla_stock.c_dataR11E) #24.7% Faltantes
plot_missing(tsla_stock.c_dataR11E) #POE = 32.28%, PHE = 52.63%, VE = 63.51%

plot_intro(tsla_stock.c_dataR12) #8.6% Faltantes
plot_missing(tsla_stock.c_dataR12) #PO = 20.87%, PH = 31.01%

plot_intro(tsla_stock.c_dataR12E) #13.3% Faltantes
plot_missing(tsla_stock.c_dataR12E) #POE = 29.81%, PHE = 50%

plot_intro(tsla_stock.c_dataR13) #19.4% Faltantes
plot_missing(tsla_stock.c_dataR13) #PL = 24.44%, PH = 25.1%, PO = 27.45%, V = 39.61%

plot_intro(tsla_stock.c_dataR13E) #30.6% Faltantes
plot_missing(tsla_stock.c_dataR13E) #PHE = 37.58%, PLE = 42.42%, POE = 42.42%, VE = 61.21%

plot_intro(tsla_stock.c_dataR14) #12.9% Faltantes
plot_missing(tsla_stock.c_dataR14) #PH = 23.81%, PL = 25.32%, PO = 28.35%

plot_intro(tsla_stock.c_dataR14E) #20.7% Faltantes
plot_missing(tsla_stock.c_dataR14E) #PHE = 35.42%, POE = 43.23%, PLE = 45.83%

plot_intro(tsla_stock.c_dataR15) #26.2% Faltantes
plot_missing(tsla_stock.c_dataR15) #PH = 38.48%, PL = 39.01%, PC = 39.53, PO = 40.18

plot_intro(tsla_stock.c_dataR15E) #41.1% Faltantes
plot_missing(tsla_stock.c_dataR15E) #PHE = 58.38%, PCE = 61.21%, POE = 62.02%, PLE = 64.85%

plot_intro(tsla_stock.c_dataR16) # 15.6% Fantantes
plot_missing(tsla_stock.c_dataR16) #PC = 20.45%, PH = 32.17%, V = 40.91%

plot_intro(tsla_stock.c_dataR16E) #24.8% Fantantes
plot_missing(tsla_stock.c_dataR16E) #PCE = 31.7%, PHE = 53.93%, VE = 63.93%

plot_intro(tsla_stock.c_dataR17) # 10% Fantantes
plot_missing(tsla_stock.c_dataR17) #PH = 19.78%, V = 40%

plot_intro(tsla_stock.c_dataR17E) #16.1% Fantantes
plot_missing(tsla_stock.c_dataR17E) #PHE = 34.2%, VE = 62.18%

plot_intro(tsla_stock.c_dataR18) # 3.2% Fantantes
plot_missing(tsla_stock.c_dataR18) #PH = 19.41%

plot_intro(tsla_stock.c_dataR18E) #5.9% Fantantes
plot_missing(tsla_stock.c_dataR18E) #PHE = 35.62%

plot_intro(tsla_stock.c_dataR19) # 12.6% Fantantes
plot_missing(tsla_stock.c_dataR19) #PH = 16.94%, PL = 18.02%, V = 40.36%

plot_intro(tsla_stock.c_dataR19E) #20.3% Fantantes
plot_missing(tsla_stock.c_dataR19E) #PHE = 27.72%, PLE = 32.28%, VE = 61.75%

plot_intro(tsla_stock.c_dataR20) # 10.2% Fantantes
plot_missing(tsla_stock.c_dataR20) # PL = 20.82%, V = 40.13%

plot_intro(tsla_stock.c_dataR20E) #16.8% Fantantes
plot_missing(tsla_stock.c_dataR20E) #PLE = 38.35%, VE = 62.62%

plot_intro(tsla_stock.c_dataR21) # 5.7% Fantantes
plot_missing(tsla_stock.c_dataR21) #PH = 16.62%, PL = 17.52%

plot_intro(tsla_stock.c_dataR21E) #10.4% Fantantes
plot_missing(tsla_stock.c_dataR21E) #PHE = 29.36%, PLE = 33.03%

plot_intro(tsla_stock.c_dataR22) # 3.4% Fantantes
plot_missing(tsla_stock.c_dataR22) #PL = 20.29%

plot_intro(tsla_stock.c_dataR22E) # 6.5% Fantantes
plot_missing(tsla_stock.c_dataR22E) #PLE 38.96%

plot_intro(tsla_stock.c_dataR23) # 12.9% Fantantes
plot_missing(tsla_stock.c_dataR23) #PH = 24.07%, PL = 26.04%, PC = 27.57%

plot_intro(tsla_stock.c_dataR23E) #20.7% Fantantes
plot_missing(tsla_stock.c_dataR23E) #PHE = 36.17%, PCE = 42.02%, PLE = 46.28%

plot_intro(tsla_stock.c_dataR24) #8.9% Fantantes
plot_missing(tsla_stock.c_dataR24) #PC = 20.46%, PL = 32.85%

plot_intro(tsla_stock.c_dataR24E) #16% Fantantes
plot_missing(tsla_stock.c_dataR24E) #PCE = 35.83%, PLE = 60%

plot_intro(tsla_stock.c_dataR25) #.9% Fantantes
plot_missing(tsla_stock.c_dataR25) #PC = 5.58%

plot_intro(tsla_stock.c_dataR25E) #.3% Fantantes
plot_missing(tsla_stock.c_dataR25E) # PCE = 2.08%

# Se van a utilizar
# Aquellos dias que llegen a tener los mismos dias, se tomara como parte del ultimo rango que conincida con esos dias.

#R5 0%, 220 registros     
#R25 .9% 233 registros      
#R9 1.3% 238 registros      
#R18 3.2% 273 registros     
#R22 3.4% 276 registros     

#R20 3.4% 461 registros
#R21 5.7% 331 registros
#R4 6.6% 365 registros
#R3 7.6% 388 registros
#R8 7.7% 392 registros

# No se planea utilizar pero si falta mas información podrán ser utilizadas
#R12 8.6%
#R24 8.9%
#R7 9.6%
#R17 10%

# NO se van a utilizar
#R20 10.2%
#R19 12.6%
#R14 12.9%
#R23 12.9%
#R2 14.9%
#R11 15.6%
#R16 15.6%
#R13 19.4%
#R1 19.7%
#R6 21.9%
#R10 23.4%
#R15 26.2%


# Solamente existen 5 rangos debajo del 10% de datos faltantes y son los mismos
# que estan dentro de la desviación estándar

#R5E 0 %
#R25 .3%
#R9E 1.6%
#R18E 5.9%
#R22E 6.5%

#R21E 10.4%
#R4E 10.5%
#R3E 10.7%
#R8E 11.2%
#R7E 12.3%
#R12E 13.3%
#R24E 16%
#R17E 16.1%
#R20E 16.8%
#R19E 20.3%
#R14E 20.7%
#R23E 20.7%
#R11E 24.7%
#R16E 24.8%
#R2E 25.1%
#R13E 30.6%
#R1E 31.1%
#R6E 34.7%
#R10E 35.6%
#R15E 41.1%

# Se van a utilizar
# Aquellos dias que llegen a tener los mismos dias,
# se tomara como parte del ultimo rango que conincida con esos dias.


tsla_stock.c_dataR5 #R5 0% 
#Arreglo a problema con la fecha
tsla_stock.c_dataR5$Date <- as.Date(tsla_stock.c_dataR5$Date, tryFormat = "%d/%m/%Y")
tsla_stock.c_dataR25 #R25 .9% 
tsla_stock.c_dataR9 #R9 1.3%
tsla_stock.c_dataR18 #R18 3.2% 
tsla_stock.c_dataR22 #R22 3.4%  

write.csv(
  x = tsla_stock.c_dataR5,
  sep = ",",
  file = "TSLAStockStats/(0)TSLAStockStats_RangosSeleccionadosR1.csv"
)
write.csv(
  x = tsla_stock.c_dataR25,
  sep = ",",
  file = "TSLAStockStats/(0)TSLAStockStats_RangosSeleccionadosR2.csv"
)
write.csv(
  x = tsla_stock.c_dataR9,
  sep = ",",
  file = "TSLAStockStats/(0)TSLAStockStats_RangosSeleccionadosR3.csv"
)
write.csv(
  x = tsla_stock.c_dataR18,
  sep = ",",
  file = "TSLAStockStats/(0)TSLAStockStats_RangosSeleccionadosR4.csv"
)
write.csv(
  x = tsla_stock.c_dataR22,
  sep = ",",
  file = "TSLAStockStats/(0)TSLAStockStats_RangosSeleccionadosR5.csv"
)

tsla_stock.c_dataR5 #R5E 0%
tsla_stock.c_dataR25 #R25E .3%
tsla_stock.c_dataR9 #R9E 1.6%
tsla_stock.c_dataR18 #R18E 5.9%
tsla_stock.c_dataR22 #R22E 6.5%

write.csv(
  x = tsla_stock.c_dataR5E,
  sep = ",",
  file = "TSLAStockStats/(0)TSLAStockStats_RangosSeleccionadosR1E.csv"
)
write.csv(
  x = tsla_stock.c_dataR25E,
  sep = ",",
  file = "TSLAStockStats/(0)TSLAStockStats_RangosSeleccionadosR2E.csv"
)
write.csv(
  x = tsla_stock.c_dataR9E,
  sep = ",",
  file = "TSLAStockStats/(0)TSLAStockStats_RangosSeleccionadosR3E.csv"
)
write.csv(
  x = tsla_stock.c_dataR18E,
  sep = ",",
  file = "TSLAStockStats/(0)TSLAStockStats_RangosSeleccionadosR4E.csv"
)
write.csv(
  x = tsla_stock.c_dataR22E,
  sep = ",",
  file = "TSLAStockStats/(0)TSLAStockStats_RangosSeleccionadosR5E.csv"
)

Fechas <- as.Date(
  c(
    #2014
    "01/06/2014","01/07/2014","01/08/2014","01/09/2014","01/10/2014","01/11/2014","01/12/2014"
    #2015
    
    #2016
    
    #2017
    
    #2018
    
    #2019
    
    
    ), tryFormat = "%d/%m/%Y"
  )


## Aqui ya voy a subdividir las fechas de los rangos que tengo para ver las fechas en donde se ven los movimientos (dentro y fuera de la desvaición)
#2014
R5[1] <- length(tsla_stock.c_dataR5$Date[tsla_stock.c_dataR5$Date >= Fechas[1] & tsla_stock.c_dataR5$Date < Fechas[2]])
R5[2] <- length(tsla_stock.c_dataR5$Date[tsla_stock.c_dataR5$Date >= Fechas[2] & tsla_stock.c_dataR5$Date < Fechas[3]])
R5[3] <- length(tsla_stock.c_dataR5$Date[tsla_stock.c_dataR5$Date >= Fechas[3] & tsla_stock.c_dataR5$Date < Fechas[4]])
R5[4] <- length(tsla_stock.c_dataR5$Date[tsla_stock.c_dataR5$Date >= Fechas[4] & tsla_stock.c_dataR5$Date < Fechas[5]])
R5[5] <- length(tsla_stock.c_dataR5$Date[tsla_stock.c_dataR5$Date >= Fechas[5] & tsla_stock.c_dataR5$Date < Fechas[6]])
R5[6] <- length(tsla_stock.c_dataR5$Date[tsla_stock.c_dataR5$Date >= Fechas[6] & tsla_stock.c_dataR5$Date < Fechas[7]])



## Al tener la cantidad de dias denro de cada mes, generar una grafica que muestre las fechas en donde se ven los movimientos y ver que información genera.

















