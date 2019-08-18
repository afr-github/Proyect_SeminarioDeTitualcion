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
str(TwitterTimeline)

#Twitter listo to Data frame
TwitterTimeline.df <- twListToDF(TwitterTimeline)


#Before "2019-06-01
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
  file = "TwitterTimeline2014-2019.csv"
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
TeslaFollowers <- TeslaUser$getFollowers(n = 4053000)
TeslaFollowers.df <- twListToDF(TeslaFollowers)
View(TeslaFollowers.df)

write.csv(
  x = TeslaFollowers.df,
  file = "TwitterTeslaFollowers.csv"
)

#Tesla Followers 3 atributes
TeslaFollowers.df.general <- subset(
  x = TeslaFollowers.df,
  select = c(name,created,id)
)

#2014 Followers
TeslaFollowers.df.general2014 <- subset(
  x = TeslaFollowers.df.general,
  subset = "2014-12-31" > created & created > "2014-01-01",
  select = c(name, created,id)
)
#2014 sample
TeslaFollowers.df.general2014.sample <- subset(
  x = TeslaFollowers.df.general2014,
  subset = created < "2014-01-05",
  select = c(name, created,id)
)

#2015 Followers
TeslaFollowers.df.general2015 <- subset(
  x = TeslaFollowers.df.general,
  subset = "2015-12-31" >= created & created > "2015-01-01",
  select = c(name, created)
)

#2016 Followers
TeslaFollowers.df.general2016 <- subset(
  x = TeslaFollowers.df.general,
  subset = "2016-12-31" >= created & created > "2016-01-01",
  select = c(name, created)
)

#2017 Followers
TeslaFollowers.df.general2017 <- subset(
  x = TeslaFollowers.df.general,
  subset = "2017-12-31" >= created & created > "2017-01-01",
  select = c(name, created)
)

#2018 Followers
TeslaFollowers.df.general2018 <- subset(
  x = TeslaFollowers.df.general,
  subset = "2018-12-31" >= created & created > "2018-01-01",
  select = c(name, created)
)

#2019 Followers
TeslaFollowers.df.general2019 <- subset(
  x = TeslaFollowers.df.general,
  subset = "2019-12-31" >= created & created > "2019-01-01",
  select = c(name, created)
)

#View of 2014 - 2019Followers
View(TeslaFollowers.df.general2014)

#Tesla Followers from 2014-2019 csv
write.csv(
  x = TeslaFollowers.df.general2014,
  file = "TwitterTeslaFollowers2014.csv"
)

write.csv(
  x = TeslaFollowers.df.general2015,
  file = "TwitterTeslaFollowers2015.csv"
)

write.csv(
  x = TeslaFollowers.df.general2016,
  file = "TwitterTeslaFollowers2016.csv"
)

write.csv(
  x = TeslaFollowers.df.general2017,
  file = "TwitterTeslaFollowers2017.csv"
)

write.csv(
  x = TeslaFollowers.df.general2018,
  file = "TwitterTeslaFollowers2018.csv"
)

write.csv(
  x = TeslaFollowers.df.general2019,
  file = "TwitterTeslaFollowers2019.csv"
)

id <- TeslaFollowers.df.general2014.sample$id

id.users.2014.01.07 <- lookupUsers(
  users = id
)

id.users.2014.01.07.df <- twListToDF(id.users.2014.01.07)
View(id.users.2014.01.07.df)


#Get all followers tweets
followers2014.stw <- userTimeline(
  user = id.users.2014.01.07$`2276419820`,
  n = 3200,
  maxID = '1135625551593562113',
  includeRts = TRUE,
  excludeReplies = FALSE
)

followers2014.stw.df.2276419820 <- twListToDF(followers2014.stw)

View(followers2014.stw.df)

#igraph conections
#2014


#2015

#2016

#2017

#2018

#2019



#List of conections
#RT are from parent tweet to retweeter
#Replies are from owner of tweet to asker
influenced <- read.csv(
  file = ".csv",
  stringsAsFactors = FALSE,
  sep = ","
)

#Influencer Connection
influenceR::csv.to.igraph(
  fname = ".csv"
)






Influencers2014 = c("Thought Leaders","Top Twitter")

#SearchInfluencers
