
library(stringr)

TSLATwTimeline <- read.csv(
  file = "TSLATwTimeline/(2)TSLATwTimeline.csv",
  sep = ",",
  stringsAsFactors = FALSE
)

df.TSLATwTimeline.usable <- c("user_id", "status_id", "created_at", "screen_name", "text", "reply_to_status_id", "reply_to_user_id", "reply_to_screen_name",
                              "is_quote", "is_retweet", "favorite_count", "retweet_count", "hashtags", "symbols", "urls_expanded_url", "media_expanded_url",
                              "media_type", "ext_media_expanded_url", "mentions_user_id", "mentions_screen_name", "lang", "quoted_status_id", "quoted_text" ,
                              "quoted_created_at", "quoted_favorite_count", "quoted_retweet_count", "quoted_user_id", "quoted_screen_name", "quoted_name",
                              "quoted_followers_count", "quoted_friends_count", "quoted_statuses_count", "quoted_location", "quoted_verified", 
                              "retweet_status_id", "retweet_text", "retweet_created_at", "retweet_favorite_count", "retweet_retweet_count", "retweet_user_id",
                              "retweet_screen_name", "retweet_name", "retweet_followers_count", "retweet_friends_count", "retweet_statuses_count",
                              "retweet_location", "retweet_verified", "country")

df.TSLATwTimeline <- subset(
  x = TSLATwTimeline,
  select = df.TSLATwTimeline.usable
)

#user_id limpiado
df.TSLATwTimeline$user_id <- substr(
  x = df.TSLATwTimeline$user_id,
  start = nchar(df.TSLATwTimeline$user_id)-7,
  stop =  nchar(df.TSLATwTimeline$user_id)
)

#status_id limpiado
df.TSLATwTimeline$status_id <- substr(
  x = df.TSLATwTimeline$status_id,
  start = nchar(df.TSLATwTimeline$status_id)- (nchar(df.TSLATwTimeline$status_id)-2),
  stop =  nchar(df.TSLATwTimeline$status_id)
)

#reply_to_status_id limpiado
df.TSLATwTimeline$reply_to_status_id <- ifelse(
  test = nchar(df.TSLATwTimeline$reply_to_status_id) > 1,
  yes = substr(
   x = df.TSLATwTimeline$reply_to_status_id,
   start = nchar(df.TSLATwTimeline$reply_to_status_id) -(nchar(df.TSLATwTimeline$reply_to_status_id)-2),
   stop = nchar(df.TSLATwTimeline$reply_to_status_id)
  ),
  no = df.TSLATwTimeline$reply_to_status_id <- ""
)

#reply_to_user_id limpiado
df.TSLATwTimeline$reply_to_user_id <- ifelse(
  test = nchar(df.TSLATwTimeline$reply_to_user_id) > 1,
  yes = substr(
    x = df.TSLATwTimeline$reply_to_user_id,
    start = nchar(df.TSLATwTimeline$reply_to_user_id) -(nchar(df.TSLATwTimeline$reply_to_user_id)-2),
    stop = nchar(df.TSLATwTimeline$reply_to_user_id)
  ),
  no = df.TSLATwTimeline$reply_to_user_id <- ""
)

#mentions_user_id limpiado
maximum.muil <- max(str_count(
    string = df.TSLATwTimeline$mentions_user_id,
    pattern = 'x'
  )
)

df.TSLATwTimeline$mentions_user_id <- str_remove(
  string = df.TSLATwTimeline$mentions_user_id,
  pattern = 'x'
)

df.TSLATwTimeline$mentions_user_id <- str_split_fixed(
  string = df.TSLATwTimeline$mentions_user_id,
  pattern = ' x',
  n = maximum.muil
)

for(i in length(df.TSLATwTimeline$mentions_user_id)){
      df.TSLATwTimeline <- as.data.frame(
          x = replace(
            x = df.TSLATwTimeline, 
            list = which(names(df.TSLATwTimeline) == 'ext_media_expanded_url'),
            values = df.TSLATwTimeline$mentions_user_id[i]
            )
      )
      df.TSLATwTimeline <- as.data.frame(
        x = append(
            x = df.TSLATwTimeline, 
            values = df.TSLATwTimeline$mentions_user_id[i],
            after = which(names(df.TSLATwTimeline) == 'mentions_user_id')
            )
      )
}
df.TSLATwTimeline$X.. <- NULL

#quoted_status_id limpiado
maximum.qsil <- maximum.muil

df.TSLATwTimeline$mentions_screen_name <- str_split_fixed(
    string = df.TSLATwTimeline$mentions_screen_name,
    pattern = ' ',
    n = maximum.qsil
)

for(i in length(df.TSLATwTimeline$mentions_screen_name)){
  df.TSLATwTimeline <- as.data.frame(
    x = append(
      x = df.TSLATwTimeline, 
      values = df.TSLATwTimeline$mentions_user_id[i],
      after = which(names(df.TSLATwTimeline) == 'mentions_screen_name')
    )
  )
}

#quoted_status_id limpiado
df.TSLATwTimeline$quoted_status_id <- substr(
  x = df.TSLATwTimeline$quoted_status_id,
  start = nchar(as.character(df.TSLATwTimeline$quoted_status_id)) - (nchar(as.character(df.TSLATwTimeline$quoted_status_id))-2),
  stop =  nchar(as.character(df.TSLATwTimeline$quoted_status_id))
)

#quoted_user_id limpieado
df.TSLATwTimeline$quoted_user_id <- substr(
  x = df.TSLATwTimeline$quoted_status_id,
  start = nchar(as.character(df.TSLATwTimeline$quoted_user_id)) - (nchar(as.character(df.TSLATwTimeline$quoted_user_id))-2),
  stop =  nchar(as.character(df.TSLATwTimeline$quoted_user_id))
)

#retweet_status_id limpiado
df.TSLATwTimeline$retweet_status_id <- substr(
  x = df.TSLATwTimeline$retweet_status_id,
  start = nchar((df.TSLATwTimeline$retweet_status_id)) - (nchar((df.TSLATwTimeline$retweet_status_id))-2),
  stop =  nchar((df.TSLATwTimeline$retweet_status_id))
)

#retweet_user_id limpiado
df.TSLATwTimeline$retweet_user_id <- substr(
  x = df.TSLATwTimeline$retweet_user_id,
  start = nchar(as.character(df.TSLATwTimeline$retweet_user_id)) - (nchar(as.character(df.TSLATwTimeline$retweet_user_id))-2),
  stop =  nchar(as.character(df.TSLATwTimeline$retweet_user_id))
)

#Workable version
View(df.TSLATwTimeline)

write.csv(
  x = df.TSLATwTimeline,
  file = "(4)TSLATwTimeLineWorkable.csv"
)
