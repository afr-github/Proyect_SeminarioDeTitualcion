## TwitteR
#Tesla user timeline with all tweets from 2014-06-01 to now
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
  file = "(2)TSLATwTimeLine.csv"
)