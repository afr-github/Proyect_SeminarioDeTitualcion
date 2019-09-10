## TwitteR
#Tesla user timeline with all tweets from 2014-06-01 to 2019-06-01
TwitterTimeline <- userTimeline(
  user = "Tesla",
  n = 3200,
  sinceID = '2014-06-01',
  includeRts = TRUE,
  excludeReplies = FALSE
)

#Timeline view from 2014-2019
View(TwitterTimeline)

#Twitter listo to Data frame
TwitterTimeline.df <- twListToDF(TwitterTimeline)

#After 2014-06-01 and Before 2019-06-01 
TwitterTimeline.df <- subset(
  x = TwitterTimeline.df,
  subset = (TwitterTimeline.df$created < "2019-06-01" &
            TwitterTimeline.df$created >= "2014-06-01")
)

#View data
View(TwitterTimeline.df)

#TwitterTimeline2014-2019 file
write.csv(
  x = TwitterTimeline.df,
  file = "TwTimeLine2014-2019.csv"
)

#Tesla account info
TeslaUser <- getUser (
  user = "Tesla"
)

View(TeslaUser)
#Verify Followers
TeslaUser$getFollowersCount()

#Certain accounts where taken down, just taking in to account the general majority availible 
#through the api

#All Tesla Followers availible
TeslaFollowers <- TeslaUser$getFollowers(n = 40000)
#TeslaFollowers2 <- TeslaUser$getFollowers(n = 40000)
#TeslaFollowers3 <- TeslaUser$getFollowers(n = 40000)
#TeslaFollowers4 <- TeslaUser$getFollowers(n = 40000)
#TeslaFollowers5 <- TeslaUser$getFollowers(n = 40000)

df.TeslaFollowers <- twListToDF(TeslaFollowers)
#df.TeslaFollowers2 <- twListToDF(TeslaFollowers2)
#df.TeslaFollowers3 <- twListToDF(TeslaFollowers3)
#df.TeslaFollowers4 <- twListToDF(TeslaFollowers4)
#df.TeslaFollowers5 <- twListToDF(TeslaFollowers5)

View(TeslaFollowers.df)

write.csv(
  x = TeslaFollowers.df,
  file = "TwitterTeslaFollowers.csv"
)

#Get all followers tweets



