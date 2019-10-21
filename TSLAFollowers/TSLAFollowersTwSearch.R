#I need to get the list of users from level E to a usable format to get in the userTimeline
#function to get all the tweets from that user.

loadTwConection()
loadTSLABotOrNotFollowers()
loadTSLATwFollowers()


UsableUser.sn <- UsableUsers$screen_name

#View(FollowersSearch)
#setup_twitter_oauth(apiKey, apiSecret, accessToken, accessTokenSecret)

SearchFollowers <- function(UsableUser.sn) {
  results <- userTimeline(
    user =  UsableUser.sn,
    n = 3200,
    includeRts = TRUE,
    excludeReplies = FALSE
  )
  return(results)
}

createTable <- function(df){
  write.csv(
    x = df,
    file = "TSLAFollowers/FollowersTweets.csv"
  )
}

SaveFollowers <- function(Follower){
  FollowersResult <- SearchFollowers(Follower)
  df.FollowersResult <- twListToDF(FollowersResult)
  
  ifelse(
    test = file.exists("TSLAFollowers/FollowersTweets.csv"),
    yes = SaveFollowersJoin(df.FollowersResult),
    no = createTable(df.FollowersResult)
  )
}

SaveFollowersJoin <- function(New){
  CSVTemp <-   write.csv(
    x = New,
    file = "TSLAFollowers/FollowersTweetsTEMP.csv"
  )
  
  checkCSV  <- read.csv(
    file = "TSLAFollowers/FollowersTweets.csv",
    stringsAsFactors = FALSE
  )
  
  checkCSVTEMP <- read.csv(
    file = "TSLAFollowers/FollowersTweetsTEMP.csv",
    stringsAsFactors = FALSE
  )

  checkCSV <- checkCSV[2:length(checkCSV)]
  checkCSVTEMP <- checkCSVTEMP[2:length(checkCSVTEMP)]
  
  Join <- rbind(checkCSV, checkCSVTEMP)
  
  df.results <- write.csv(
    x = Join,
    file = "TSLAFollowers/FollowersTweets.csv",
  )
  return()
}

ViewFollowers <- function(ViewFile){
  FollowersTweets <- read.csv(
    file = ("TSLAFollowers/FollowersTweets.csv"),
    stringsAsFactors = FALSE
  )
  View(FollowersTweets)
}

#Remove for retry
removefile <- function(){
    tryCatch({
      expr = file.remove("TSLAFollowers/FollowersTweets.csv")
    }, warning = function(war){
      print("Archivo no existe")
    }
  )
}

runFill <- function(startID){
  i <- startID
  tryCatch({
    expr = 
      while(i <= length(UsableUsers$screen_name)){
        SaveFollowers(UsableUsers$screen_name[i])
        i <- i+1
      }
  }, error = function(err){
      runFill(startID = startID+1) 
  }
  )
}



#Funcion para buscar los tweets de los usuarios apartir del id que se ingrese.
#runFill(1)

#removefile()

View(UsableUsers$screen_name)
ViewFollowers("TSLAFollowers/FollowersTweets.csv")

FollowersTweets <- read.csv(
  file = "TSLAFollowers/FollowersTweets.csv",
  stringsAsFactors = FALSE
)




