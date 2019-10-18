#Checking for Bots using BotorNot

#searchTweetBotorNot <- function(inicio, fin){
#  info9 <- tweetbotornot(x = TSLAFollowers.sn[inicio:fin])
#  write.csv(
#    x = info9,
#    file = "TSLAFollowers/(9)botornotINFO.csv"
#  )
#}

#LISTO
#searchTweetBotorNot(950,1079)

# Muestra grafica
# info[order(info$prob_bot),] ## solo tomar los primeros 2 decimales

#Funcion para cargar esta información de manera mas rapida
loadTSLABotOrNotFollowers <- function(){
  info <- read.csv(
    file = "TSLAFollowers/(1)botornotINFO.csv",
    sep = ",",
    stringsAsFactors = FALSE
  )
  
  info2 <- read.csv(
    file = "TSLAFollowers/(2)botornotINFO.csv",
    sep = ",",
    stringsAsFactors = FALSE
  )
  
  info3 <- read.csv(
    file = "TSLAFollowers/(3)botornotINFO.csv",
    sep = ",",
    stringsAsFactors = FALSE
  )
  
  info4 <- read.csv(
    file = "TSLAFollowers/(4)botornotINFO.csv",
    sep = ",",
    stringsAsFactors = FALSE
  )
  
  info5 <- read.csv(
    file = "TSLAFollowers/(5)botornotINFO.csv",
    sep = ",",
    stringsAsFactors = FALSE
  )
  
  info6 <- read.csv(
    file = "TSLAFollowers/(6)botornotINFO.csv",
    sep = ",",
    stringsAsFactors = FALSE
  )
  
  info7 <- read.csv(
    file = "TSLAFollowers/(7)botornotINFO.csv",
    sep = ",",
    stringsAsFactors = FALSE
  )
  
  info8 <- read.csv(
    file = "TSLAFollowers/(8)botornotINFO.csv",
    sep = ",",
    stringsAsFactors = FALSE
  )
  
  info9 <- read.csv(
    file = "TSLAFollowers/(9)botornotINFO.csv",
    sep = ",",
    stringsAsFactors = FALSE
  )
  
  UsableUsers <- rbind(
    info,
    info2,
    info3,
    info4,
    info5,
    info6,
    info7,
    info8,
    info9
  )
  
  UsableUsers <- subset(
    x = UsableUsers,
    subset = prob_bot < .5
  )
  
  UsableUsers <- UsableUsers[!duplicated(UsableUsers$screen_name),]
  UsableUsers <- UsableUsers[!is.na(UsableUsers$screen_name),]
  UsableUsers <- UsableUsers[!is.null(UsableUsers$screen_name),]
  UsableUsers <- UsableUsers[nchar(UsableUsers$screen_name) > 1,]
  
  #Usuarios utilizables:
  # Eran 1079 y ahorita solo quedan 436 usuarios, un 40% aproximadamente del total de usuarios que estaban, debido a:
  # 1: Ya no existe el perfil
  # 2: No se puede acceder a su información
}

write.csv(
  x = UsableUsers,
  file = "TSLAFollowers/UsableUsers.csv"
)

View(UsableUsers)