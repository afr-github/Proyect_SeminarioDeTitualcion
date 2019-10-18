loadTwConection <- function(){
  library(twitteR)
  library(rtweet)
  library(influenceR)
  library(igraph)
  library(tidyverse)
  library(lubridate)
  library(tidyr)
  library(DataExplorer)
  library(maps)
  
  ## install remotes if not already (Already installed)
  #if (!requireNamespace("remotes", quietly = TRUE)) {
  #  install.packages("remotes")
  #}
  
  ## install from CRAN
  #install.packages("tweetbotornot")
  
  ## install tweetbotornot from github
  #devtools::install_github("mkearney/tweetbotornot",force = TRUE)
  # To fix `by` [ERROR] with newer version of textfeatures
  #devtools::install_version('textfeatures', version='0.2.0', repos='http://cran.us.r-project.org')
  library(tweetbotornot)
  
  #Keys
  apiKey <- '1RWlYtAbUBTXv4j0i4CW4BV17'
  apiSecret <- 'dWDUEPiCLLj87Xo5YApiq9s5BrxE54q66TROf60hsC0tCuZBQn'
  accessToken <- '1099884980451328001-WMfdGjHsqNwbhc4ALULCovkLXYDmrp'
  accessTokenSecret <- '1ROVnec1VWW0JUp9GD0VhLejdsIVjVZPjOA0pRU89TLPW'
  
  #Conection with library twitteR
  setup_twitter_oauth(apiKey, apiSecret, accessToken, accessTokenSecret)
  
  ##### RTweet conection
  #token <- create_token(
  #  app = "Proyect_SeminarioDeTitulacion",
  #  consumer_key = apiKey,
  #  consumer_secret = apiSecret,
  #  access_token = accessToken,
  #  access_secret = accessTokenSecret
  #)
  
  # Rtweet access when token already generated
  get_token()
}