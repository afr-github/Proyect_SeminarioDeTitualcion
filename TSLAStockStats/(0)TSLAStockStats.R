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

#Creación del documento
write.table(
  x = tsla_stock.close_stats, 
  file = "TSLAStockStats/(5)CloseStockStats.csv",
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
  file = "TSLAStockStats/(6)VolumeStockStats.csv",
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

tsla_stock.stats <- c(
  #Fechas de los precios de apertura dentro de la desviación
  #Fechas de los precios de apertura fuera de la desviación
  #.
  #.
  #.
  #Fechas con el volumen de intercambio fuera de la desviación
)

# Checar los datos con las fechas, abajo esta un intento previo de como se debe de parecer.

# Vista de comparación entre los dias de apertura y
# los precios mas altos para ver alguna relación entre ellos.

# Tabla con la fecha y el precio de apertura de cada rango dentro de la desviación estandar
tsla_stock.c_stats <- data.frame(
  "Date" = c(
    subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[1]-tsla_stock.de[1]) & TSLAStock$Open <= (tsla_stock.avg[1]+tsla_stock.de[1])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[2]-tsla_stock.de[2]) & TSLAStock$Open <= (tsla_stock.avg[2]+tsla_stock.de[2])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[3]-tsla_stock.de[3]) & TSLAStock$Open <= (tsla_stock.avg[3]+tsla_stock.de[3])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[4]-tsla_stock.de[4]) & TSLAStock$Open <= (tsla_stock.avg[4]+tsla_stock.de[4])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[5]-tsla_stock.de[5]) & TSLAStock$Open <= (tsla_stock.avg[5]+tsla_stock.de[5])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[6]-tsla_stock.de[6]) & TSLAStock$Open <= (tsla_stock.avg[6]+tsla_stock.de[6])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[7]-tsla_stock.de[7]) & TSLAStock$Open <= (tsla_stock.avg[7]+tsla_stock.de[7])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[8]-tsla_stock.de[8]) & TSLAStock$Open <= (tsla_stock.avg[8]+tsla_stock.de[8])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[9]-tsla_stock.de[9]) & TSLAStock$Open <= (tsla_stock.avg[9]+tsla_stock.de[9])),
    subset(x = TSLAStock$Date, subset = TSLAStock$Open >= (tsla_stock.avg[10]-tsla_stock.de[10]) & TSLAStock$Open <= (tsla_stock.avg[10]+tsla_stock.de[10]))
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

# Union de las tablas de open_stats y high_stats
tsla_stock.c_stats <- merge(
  tsla_stock.c_open_stats,
  tsla_stock.c_high_stats,
  by =  "Date",
  all = TRUE,
  suffixes = c("_Open","_High","_Low","_Close","_Volume")
)

View(tsla_stock.c_open_high_stats)

# Cantidad de fechas que tienen un precio de apertura (Price_Open)
tsla_stock.c_open_cant <- nrow(
  subset(
    x = tsla_stock.c_open_high_stats,
    subset = nchar(Price_Open) > 1
    )
)

# Cantidad de fechas que tienen un precio alto (Price_High)
tsla_stock.c_high_cant <- nrow(
  subset(
    x = tsla_stock.c_open_high_stats,
    subset = nchar(Price_High) >1
  ) 
)

# Toda la información de aquellas fechas que coinciden dentro de la desviación estandar
tsla_stock.c_open_high_data <- subset(
  x = tsla_stock.c_open_high_stats,
  subset = ((nchar(Price_Open) > 1) & (nchar(Price_High) > 1))
)

# Cantidad de fechas que coinciden dentro de la desviación estandar
tsla_stock.c_open_high_cant <- nrow(
  subset(
    x = tsla_stock.c_open_high_stats,
    subset = ((nchar(Price_Open) > 1) & (nchar(Price_High) > 1))
  )
)

View(tsla_stock.c_open_high_data)

#Fechas fuera de la desviación estandar


