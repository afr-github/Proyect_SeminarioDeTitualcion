#Working dates
#Las fechas que estan fuera de la desviación estandar son las que se van a considerar para trabajar con.

tsla_stock.stats.workable <- tsla_stock.stats

#Open out of range
tsla_stock.workable.or <- c(
  subset(x = TSLAStock$Open,subset = ((TSLAStock$Open < (tsla_stock.avg[1]-tsla_stock.de[1])) & (TSLAStock$Open >= 140)) | ((TSLAStock$Open > (tsla_stock.avg[1]+tsla_stock.de[1])) & (TSLAStock$Open <= 165))),
  subset(x = TSLAStock$Open,subset = ((TSLAStock$Open < (tsla_stock.avg[2]-tsla_stock.de[2])) & (TSLAStock$Open >= 165)) | ((TSLAStock$Open > (tsla_stock.avg[2]+tsla_stock.de[2])) & (TSLAStock$Open <= 190))),
  subset(x = TSLAStock$Open,subset = ((TSLAStock$Open < (tsla_stock.avg[3]-tsla_stock.de[3])) & (TSLAStock$Open >= 190)) | ((TSLAStock$Open > (tsla_stock.avg[3]+tsla_stock.de[3])) & (TSLAStock$Open <= 215))),
  subset(x = TSLAStock$Open,subset = ((TSLAStock$Open < (tsla_stock.avg[4]-tsla_stock.de[4])) & (TSLAStock$Open >= 215)) | ((TSLAStock$Open > (tsla_stock.avg[4]+tsla_stock.de[4])) & (TSLAStock$Open <= 240))),
  subset(x = TSLAStock$Open,subset = ((TSLAStock$Open < (tsla_stock.avg[5]-tsla_stock.de[5])) & (TSLAStock$Open >= 240)) | ((TSLAStock$Open > (tsla_stock.avg[5]+tsla_stock.de[5])) & (TSLAStock$Open <= 265))),
  subset(x = TSLAStock$Open,subset = ((TSLAStock$Open < (tsla_stock.avg[6]-tsla_stock.de[6])) & (TSLAStock$Open >= 265)) | ((TSLAStock$Open > (tsla_stock.avg[6]+tsla_stock.de[6])) & (TSLAStock$Open <= 290))),
  subset(x = TSLAStock$Open,subset = ((TSLAStock$Open < (tsla_stock.avg[7]-tsla_stock.de[7])) & (TSLAStock$Open >= 290)) | ((TSLAStock$Open > (tsla_stock.avg[7]+tsla_stock.de[7])) & (TSLAStock$Open <= 315))),
  subset(x = TSLAStock$Open,subset = ((TSLAStock$Open < (tsla_stock.avg[8]-tsla_stock.de[8])) & (TSLAStock$Open >= 315)) | ((TSLAStock$Open > (tsla_stock.avg[8]+tsla_stock.de[8])) & (TSLAStock$Open <= 340))),
  subset(x = TSLAStock$Open,subset = ((TSLAStock$Open < (tsla_stock.avg[9]-tsla_stock.de[9])) & (TSLAStock$Open >= 340)) | ((TSLAStock$Open > (tsla_stock.avg[9]+tsla_stock.de[9])) & (TSLAStock$Open <= 365))),
  subset(x = TSLAStock$Open,subset = ((TSLAStock$Open < (tsla_stock.avg[10]-tsla_stock.de[10])) & (TSLAStock$Open >= 365)) | ((TSLAStock$Open > (tsla_stock.avg[10]+tsla_stock.de[10])) & (TSLAStock$Open <= 390)))
)


for(i in 1:length(tsla_stock.workable.or)){
  for(j in 1:length(TSLAStock$Open)){
      tsla_stock.workable.or.dates[i] <- ifelse(
        tsla_stock.workable.or[i] == (TSLAStock$Open[j]),
        TSLAStock$Date,
        ""
    )
  }
}

#427 09/02/2016

tsla_stock.workable.or.dates <- ifelse(
  tsla_stock.workable.or[1] == ((TSLAStock$Open)),
  TSLAStock$Date,
  ""
)



View(tsla_stock.workable.or.dates)

tsla_stock.workable.or.dates <- data.frame(
  subset(
    x = tsla_stock.workable.or.dates,
    subset = tsla_stock.workable.or.dates != "",
    select = tsla_stock.workable.or.dates
  ),
  stringsAsFactors = FALSE
)

View(tsla_stock.workable.or)
View(tsla_stock.workable.or.dates)



