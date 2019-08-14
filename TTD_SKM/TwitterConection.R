library(rtweet)
library(ROAuth)
library(httr)


library(shiny)
library(openssl)

#Keys
apiKey <- '1RWlYtAbUBTXv4j0i4CW4BV17'
apiSecret <- 'dWDUEPiCLLj87Xo5YApiq9s5BrxE54q66TROf60hsC0tCuZBQn'
accessToken <- '1099884980451328001-WMfdGjHsqNwbhc4ALULCovkLXYDmrp'
accessTokenSecret <- '1ROVnec1VWW0JUp9GD0VhLejdsIVjVZPjOA0pRU89TLPW'



oauthendpoint <- oauth_endpoint(request = "https://api.twitter.com/oauth/request_token",
                                authorize = "https://api.twitter.com/oauth/autorize",
                                access = "https://api.twitter.com/oauth/access_token")

oauth1.0_token(endpoint = oauthendpoint,
               app = oauth_app(
                 appname = "Proyect_SeminarioDeTitulacion",
                 key = apiKey,
                 secret = apiSecret
               )
)


