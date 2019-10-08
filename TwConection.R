library(twitteR)
library(influenceR)
library(igraph)
library(tidyverse)
library(lubridate)
library(tidyr)

#Keys
apiKey <- '1RWlYtAbUBTXv4j0i4CW4BV17'
apiSecret <- 'dWDUEPiCLLj87Xo5YApiq9s5BrxE54q66TROf60hsC0tCuZBQn'
accessToken <- '1099884980451328001-WMfdGjHsqNwbhc4ALULCovkLXYDmrp'
accessTokenSecret <- '1ROVnec1VWW0JUp9GD0VhLejdsIVjVZPjOA0pRU89TLPW'

#Conection with library twitteR
setup_twitter_oauth(apiKey, apiSecret, accessToken, accessTokenSecret)
