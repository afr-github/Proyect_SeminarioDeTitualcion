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
  subset = (created < "2019-06-01" & created >= "2014-06-01")
)

#TwitterTimeline2014-2019 file
write.csv(
  x = TwitterTimeline.df,
  file = "(2)TSLATwTimeLine.csv"
)

setupTSLATwTimeline <- function(){
  tsla_tw_timline <- read.csv(
    file = "TSLATwTimeline/(2)TSLATwTimeline.csv",
    stringsAsFactors = FALSE
  )
  
  #str(tsla_tw_timline)  
  tsla_tw_timline$created_at <- as.Date(x = tsla_tw_timline$created_at, tryformat = "%d/%m/%Y")
  tsla_tw_timline <- subset(
    x = tsla_tw_timline,
    subset = (created_at >= as.Date("2014-06-01", tryformat = "%d/%m/%Y")) &
             (created_at < as.Date("2019-06-01", tryformat = "%d/%m/%Y"))
  )
  
}


