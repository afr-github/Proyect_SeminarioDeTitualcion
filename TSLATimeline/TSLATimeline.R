TSLATwTimeline <- read.csv(
  file = "TSLATimeline/TSLATwTimeline.csv",
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

#Workable version
View(df.TSLATwTimeline)

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

#reply_to_status_id limpieado
df.TSLATwTimeline$reply_to_status_id <- ifelse(
  test = nchar(df.TSLATwTimeline$reply_to_status_id) > 1,
  yes = substr(
   x = df.TSLATwTimeline$reply_to_status_id,
   start = nchar(df.TSLATwTimeline$reply_to_status_id) -(nchar(df.TSLATwTimeline$reply_to_status_id)-2),
   stop = nchar(df.TSLATwTimeline$reply_to_status_id)
  ),
  no = df.TSLATwTimeline$reply_to_status_id <- ""
)

#reply_to_user_id limpieado
df.TSLATwTimeline$reply_to_user_id <- ifelse(
  test = nchar(df.TSLATwTimeline$reply_to_user_id) > 1,
  yes = substr(
    x = df.TSLATwTimeline$reply_to_user_id,
    start = nchar(df.TSLATwTimeline$reply_to_user_id) -(nchar(df.TSLATwTimeline$reply_to_user_id)-2),
    stop = nchar(df.TSLATwTimeline$reply_to_user_id)
  ),
  no = df.TSLATwTimeline$reply_to_user_id <- ""
)

#WORK 

#se puede hacer un ciclo de n intentos para agarrar los ids de los usuarios 
#con strcapture, eliminando el dato despues de haber recuperado la informacion que estan en el campo y pasara los a un data.frame


View(strcapture(
  pattern = "([[:digit:]]{1,100})",
  x = datos,
  proto = data.frame(chr=character())
))

for(i in df.TSLATwTimeline$mentions_user_id){
  datos <- df.TSLATwTimeline$mentions_user_id
}

View(datos[1:10])



str(df.TSLATwTimeline$mentions_user_id.list)
View(df.TSLATwTimeline$mentions_user_id.list[3])



#mentions_user_id limpieado
df.TSLATwTimeline$mentions_user_id <- ifelse(
  test = nchar(df.TSLATwTimeline$mentions_user_id) > 1,
  yes = substr(
    x = df.TSLATwTimeline$mentions_user_id,
    start = nchar(df.TSLATwTimeline$mentions_user_id) - (nchar(df.TSLATwTimeline$mentions_user_id)-2),
    stop = nchar(df.TSLATwTimeline$mentions_user_id)
  ),
  no = df.TSLATwTimeline$mentions_user_id <- ""
)

#quoted_status_id












    
    