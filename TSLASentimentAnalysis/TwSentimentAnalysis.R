#sentiment Analysis
loadTwConection()

DictionaryLM <- loadDictionaryLM()

str(DictionaryLM)
sentiment <- analyzeSentiment(FollowersTweets$text)

corpus <- c("Positive text", "Neutral but uncertain text", "Negative text")

View(FollowersTweets$text[1:100])

sentiment <- analyzeSentiment(FollowersTweets$text[1:2000])
sentiment2 <- analyzeSentiment(FollowersTweets$text[300:700])
sentiment3 <- analyzeSentiment(FollowersTweets$text[700:2000])
sentiment4 <- analyzeSentiment(FollowersTweets$text[300:400])

length(FollowersTweets$text)

plotSentiment(
  sentiment = sentiment
)

write.csv(
  x = sentiment,
  file = "TSLASentimentAnalysis/Sentiment.csv"
)

View(sentiment)


response <- compareToResponse(
  sentiment = sentiment, 
  response = c(+1,0,-2)
)

View(response)

data("crude")

sentiment <- analyzeSentiment(FollowersTweets$text[1:10])
View(sentiment)



dtm <- DocumentTermMatrix(VCorpus(VectorSource(c("posit posit", "negat neutral"))))
sentiment2 <- analyzeSentiment(dtm)
View(sentiment2)



