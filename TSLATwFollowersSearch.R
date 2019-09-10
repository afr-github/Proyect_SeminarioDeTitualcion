#I need to get the list of users from level E to a usable format to get in the userTimeline
#function to get all the tweets from that user.


Search <- userTimeline(
  user = UserSearch,
  n = 3200
)

Search <- twListToDF(Search)
View(Search)

lookupUsers(
  users = df.TSLAFollowersE$screenName,
)
