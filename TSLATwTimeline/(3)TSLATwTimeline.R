setupTSLATwTimeline()

#Clean FollowersTweets
tsla_tw_timline.usable <- c("user_id", "status_id", "created_at", "screen_name", "text", "reply_to_status_id", "reply_to_user_id", "reply_to_screen_name",
                              "is_quote", "is_retweet", "favorite_count", "retweet_count", "hashtags", "symbols", "urls_expanded_url", "media_expanded_url",
                              "media_type", "ext_media_expanded_url", "mentions_user_id", "mentions_screen_name", "lang", "quoted_status_id", "quoted_text" ,
                              "quoted_created_at", "quoted_favorite_count", "quoted_retweet_count", "quoted_user_id", "quoted_screen_name", "quoted_name",
                              "quoted_followers_count", "quoted_friends_count", "quoted_statuses_count", "quoted_location", "quoted_verified", 
                              "retweet_status_id", "retweet_text", "retweet_created_at", "retweet_favorite_count", "retweet_retweet_count", "retweet_user_id",
                              "retweet_screen_name", "retweet_name", "retweet_followers_count", "retweet_friends_count", "retweet_statuses_count",
                              "retweet_location", "retweet_verified", "country")

tsla_tw_timline <- subset(
  x = tsla_tw_timline,
  select = tsla_tw_timline.usable
)

#user_id limpiado
#tsla_tw_timline$user_id <- gsub(pattern = "[a-zA-Z]", replacement = "", x = tsla_tw_timline$user_id)
tsla_tw_timline$user_id <- str_remove_all(string = tsla_tw_timline$user_id, pattern = "x")

#status_id limpiado
#tsla_tw_timline$status_id <- gsub(pattern = "[a-zA-Z]", replacement = "", x = tsla_tw_timline$status_id)
tsla_tw_timline$status_id <- str_remove_all(string = tsla_tw_timline$status_id, pattern = "x")

#reply_to_status_id limpiado
#tsla_tw_timline$reply_to_status_id <- gsub(pattern = "[a-zA-Z]", replacement = "", x = tsla_tw_timline$reply_to_status_id)
tsla_tw_timline$reply_to_status_id <- str_remove_all(string = tsla_tw_timline$reply_to_status_id, pattern = "x")

#reply_to_user_id limpiado
#tsla_tw_timline$reply_to_user_id <- gsub(pattern = "[a-zA-Z]", replacement = "", x = tsla_tw_timline$reply_to_user_id)
tsla_tw_timline$reply_to_user_id <- str_remove_all(string = tsla_tw_timline$reply_to_user_id, pattern = "x")

#mentions_user_id limpiado
tsla_tw_timline$mentions_user_id <- str_remove_all(string = tsla_tw_timline$mentions_user_id, pattern =  "x")

#quoted_status_id limpiado
#tsla_tw_timline$quoted_status_id <- gsub(pattern = "[a-zA-Z]", replacement = "", x = tsla_tw_timline$quoted_status_id)
tsla_tw_timline$quoted_status_id <- str_remove_all(string = tsla_tw_timline$quoted_status_id, pattern = "x")

#retweet_status_id limpiado
#tsla_tw_timline$retweet_status_id <- gsub(pattern = "[a-zA-Z]", replacement = "", x = tsla_tw_timline$retweet_status_id)
tsla_tw_timline$retweet_status_id <- str_remove_all(string = tsla_tw_timline$retweet_status_id, pattern = "x")

#retweet_user_id limpiado
#tsla_tw_timline$retweet_user_id <- gsub(pattern = "[a-zA-Z]", replacement = "", x = tsla_tw_timline$retweet_user_id)
tsla_tw_timline$retweet_user_id <- str_remove_all(string = tsla_tw_timline$retweet_user_id, pattern = "x")

#error creating and reading .csv file

#Workable version
View(tsla_tw_timline)

write.csv(
  x = tsla_tw_timline,
  file = "TSLATwTimeline/(4)TSLATwTimeLineWorkable.csv"
)



tsla_tw_timeline_workable <- read.csv(
  header = TRUE,
  sep = ',',
  file = "TSLATwTimeline/(4)TSLATwTimeLineWorkable.csv",
  stringsAsFactors = FALSE
)

str(tsla_tw_timeline_workable)




View(tsla_tw_timleline_workable)


