#I need to get the list of users from level E to a usable format to get in the userTimeline
#function to get all the tweets from that user.
df.TSLAFollowersE$name[1:10]
Twtry <- (df.TSLAFollowersE$screenName[1:1079])

Twuser <- lookupUsers(
  users = df.TSLAFollowersE$screenName[1:354]
)

#Follower lvl E 
TwSearch <- userTimeline(
  user = Twuser[1], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 1134125388085567489
)
TwSearch2 <- userTimeline(
  user = Twuser[2], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 1134357824534802432
)
#Twuser[3,4] Not allowed
#Twuser[5] Not in range
#Twuser[6] Not allowed
TwSearch7 <- userTimeline(
  user = Twuser[7], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 1134518122617040896
)
TwSearch8 <- userTimeline(
  user = Twuser[8], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 1134566243892178955
)
TwSearch9 <- userTimeline(
  user = Twuser[9], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 1133467937505853440
)
#Twuser[10] Not allowed
TwSearch11 <- userTimeline(
  user = Twuser[11], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 1067990786388647936, sinceID = 474662050971787265
)
TwSearch12 <- userTimeline(
  user = Twuser[12], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 1134559091777507329#, sinceID = 474662050971787265
)
#Twuser[13] Not allowed
TwSearch14 <- userTimeline(
  user = Twuser[14], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 1134439200177250304#, sinceID = 474662050971787265
)
#Twuser[15] Not allowed
TwSearch16 <- userTimeline(
  user = Twuser[16], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 1134547779668402176#, sinceID = 474662050971787265
)
#Twuser[17] Not in range
TwSearch18 <- userTimeline(
  user = Twuser[18], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 1134603058510467085#, sinceID = 474662050971787265
)
TwSearch19 <- userTimeline(
  user = Twuser[19], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 1134512543492386816#, sinceID = 474662050971787265
)
TwSearch20 <- userTimeline(
  user = Twuser[20], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 1133995214593568768, sinceID = 473663107244773376
)
TwSearch21 <- userTimeline(
  user = Twuser[21], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 1133995214593568768#, sinceID = 473663107244773376
)
TwSearch22 <- userTimeline(
  user = Twuser[22], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 1134513835585474560#, sinceID = 473663107244773376
)
TwSearch23 <- userTimeline(
  user = Twuser[23], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 1134426163495890944#, sinceID = 473663107244773376
)
TwSearch23b <- userTimeline(
  user = Twuser[23], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 499891577930530816#, sinceID = 473663107244773376
)
TwSearch23 <- twListToDF(TwSearch23)
TwSearch23b <- twListToDF(TwSearch23b)
TwSearch23c <- rbind(TwSearch23,TwSearch23b)
#Twuser[24] Not allowed
#Twuser[25] Not in range
#Twuser[26] Languaje not usable
#Twuser[27] Not allowed
TwSearch28 <- userTimeline(
  user = Twuser[28], n = 3000,includeRts = TRUE,excludeReplies = FALSE, maxID = 1134577963066961920#, sinceID = 473663107244773376
)
TwSearch29 <- userTimeline(
  user = Twuser[29], n = 3000,includeRts = TRUE,excludeReplies = FALSE#, maxID = 1134276858525245440#, sinceID = 473663107244773376
)
TwSearch30 <- userTimeline(
  user = Twuser[30], n = 3000,includeRts = TRUE,excludeReplies = FALSE#, maxID = 1134276858525245440#, sinceID = 473663107244773376
)


TwSearch30 <- twListToDF(TwSearch30)
View(TwSearch30)


