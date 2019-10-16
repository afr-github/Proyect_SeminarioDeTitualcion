#Checking for Bots using BotorNot

TopTSLAFollowers$id
info <- tweetbotornot(x = Followers$esafdi) #.804 probabilito of not a bot

info[order(info$prob_bot),] ## solo tomar los primeros 2 decimales

TopTSLAFollowers
#Mapa para visualizar puntos de salida de los tweets o perfiles.
maps::map("state", lwd = .3)
