## TwitteR
#Tesla user timeline with all tweets from 2014-06-01 to 2019-06-01
TwitterTimeline <- userTimeline(
  user = "Tesla",
  n = 3200,
  sinceID = '2014-06-01',
  includeRts = TRUE,
  excludeReplies = FALSE
)

#Twitter list to Data frame
TwitterTimeline.df <- twListToDF(TwitterTimeline)

#After 2014-06-01 and Before 2019-06-01 
TwitterTimeline.df <- subset(
  x = TwitterTimeline.df,
  subset = (TwitterTimeline.df$created < "2019-06-01" &
            TwitterTimeline.df$created >= "2014-06-01")
)

#TwitterTimeline2014-2019 file
write.csv(
  x = TwitterTimeline.df,
  file = "TSLATwTimeLine.csv"
)

#Tesla account info
TeslaUser <- getUser (
  user = "Tesla"
)

#Verify Followers
TeslaUser$getFollowersCount()

#Certain accounts where taken down, just taking in to account the general majority availible 
#through the api

#All Tesla Followers availible
TSLAFollowers <- TeslaUser$getFollowers(n = 55000)
#TSLAFollowers2 <- TeslaUser$getFollowers(n = 55000)
#TSLAFollowers3 <- TeslaUser$getFollowers(n = 55000)
#TSLAFollowers4 <- TeslaUser$getFollowers(n = 55000)


df.TSLAFollowers <- twListToDF(TSLAFollowers)
#df.TSLAFollowers2 <- twListToDF(TSLAFollowers2)
#df.TSLAFollowers3 <- twListToDF(TSLAFollowers3)
#df.TSLAFollowers4 <- twListToDF(TSLAFollowers4)

df.TSLAFollowers <- rbind(df.TSLAFollowers, df.TSLAFollowers2, df.TSLAFollowers3, df.TSLAFollowers4)

View(df.TSLAFollowers)

write.csv(
  x = df.TSLAFollowers,
  file = "TSLATwFollowers.csv"
)