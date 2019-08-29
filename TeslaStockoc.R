#Open - Close
vha.tsla_stock.oc <- (vha.tsla_stock$Close - vha.tsla_stock$Open)
df.vha.tsla_stock.oc <- data.frame(vha.tsla_stock.oc)
names(df.vha.tsla_stock.oc) <- c("Open-Close")