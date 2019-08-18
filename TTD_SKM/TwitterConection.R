library(twitteR)
library(influenceR)
library(igraph)
#library(ROAuth)
#library(httr)
#library(rtweet)


#Keys
apiKey <- '1RWlYtAbUBTXv4j0i4CW4BV17'
apiSecret <- 'dWDUEPiCLLj87Xo5YApiq9s5BrxE54q66TROf60hsC0tCuZBQn'
accessToken <- '1099884980451328001-WMfdGjHsqNwbhc4ALULCovkLXYDmrp'
accessTokenSecret <- '1ROVnec1VWW0JUp9GD0VhLejdsIVjVZPjOA0pRU89TLPW'


#Conection with library rtweet,ROAuth,httr
oauthendpoint <- oauth_endpoint(request = "https://api.twitter.com/oauth/request_token",
                                authorize = "https://api.twitter.com/oauth/autorize",
                                access = "https://api.twitter.com/oauth/access_token")

oauth_consumer_key = apiKey
oauth_signature_method="HMAC-SHA1"
oauth_signature(url = "https://api.twitter.com/oauth/request_token",
                app = oauth_app(
                  appname = "Proyect_SeminarioDeTitulacion",
                  key = apiKey,
                  secret = apiSecret
                ),
                method = "GET",
                token = "1099884980451328001-WMfdGjHsqNwbhc4ALULCovkLXYDmrp",
                token_secret = "1ROVnec1VWW0JUp9GD0VhLejdsIVjVZPjOA0pRU89TLPW")
oauth_signature = "KpNM8m1iHaB0FSCZCwzmUaWkXOs="
oauth_timestamp = "1565643044"
oauth_version = "1.0"
oauth_nonce = "zgvtMntW7u"
oauth_callback()


tokens <- create_token(app = "Proyect_SeminarioDeTitulacion",
                       consumer_key = apiKey,
                       consumer_secret = apiSecret)


#Conection with library twitteR
setup_twitter_oauth(apiKey, apiSecret, accessToken, accessTokenSecret)


