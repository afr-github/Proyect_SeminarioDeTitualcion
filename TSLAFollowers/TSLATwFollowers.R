#Operacion 1
#Tesla Motros Inc. Twitter Followers (TSLATwFollowers)
TSLATwFollowers1 <- read.csv(
  file = "TSLAFollowers/TSLATwFollowers (1).csv",
  sep = ",",
  stringsAsFactors = FALSE
)

TSLATwFollowers2 <- read.csv(
  file = "TSLAFollowers/TSLATwFollowers (2).csv",
  sep = ",",
  stringsAsFactors = FALSE
)

TSLATwFollowers3 <- read.csv(
  file = "TSLAFollowers/TSLATwFollowers (3).csv",
  sep = ",",
  stringsAsFactors = FALSE
)

TSLATwFollowers4 <- read.csv(
  file = "TSLAFollowers/TSLATwFollowers (4).csv",
  sep = ",",
  stringsAsFactors = FALSE
)

#Operacion 2
df.TSLAFollowers <- rbind(TSLATwFollowers1, TSLATwFollowers2, TSLATwFollowers3, TSLATwFollowers4)

#View(df.TSLAFollowers)

#Operacion 3
df.TSLAFollowers <- subset(
  x = df.TSLAFollowers,
  subset = statusesCount >= 1 & followersCount >= 1,
)

#Operacion 4
df.TSLAFollowers <- df.TSLAFollowers[!duplicated(df.TSLAFollowers$id),]

#Operacion 5
#Nivel E
df.TSLAFollowersE <- subset(
  x = df.TSLAFollowers,
  subset = statusesCount >= 15000 &  statusesCount < 20000
)

#Nivel D
df.TSLAFollowersD<- subset(
  x = df.TSLAFollowers,
  subset = statusesCount >= 20000 & statusesCount < 30000 
)

#Nivel C
df.TSLAFollowersC <- subset(
  x = df.TSLAFollowers,
  subset = statusesCount >= 30000  & statusesCount < 50000 
)

#Nivel B
df.TSLAFollowersB <- subset(
  x = df.TSLAFollowers,
  subset = statusesCount >= 50000 & statusesCount < 75000 
)

#Nivel A
df.TSLAFollowersA <- subset(
  x = df.TSLAFollowers,
  subset = statusesCount >= 75000
)

#Operacion 6
#Top Tier Followers
TopTSLAFollowers <- rbind(
  df.TSLAFollowersE, df.TSLAFollowersD, df.TSLAFollowersC, df.TSLAFollowersB, df.TSLAFollowersA
)

TSLAFollowers.sn <- TopTSLAFollowers$screenName

