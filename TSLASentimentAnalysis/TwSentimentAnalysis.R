#Sentiment Analysis
loadTwConection()
loadTSLABotOrNotFollowers()

loadTwSentimentAnalysisRangos <- function(){
#R1
#Se carga el primer rango
R1 <- read.csv(
  file = "TSLAStockStats/Rangos Work/(0)TSLAStockStats_RangosSeleccionadosR1.csv",
  stringsAsFactors = FALSE
)

#se convierte la fecha de factor a fecha
R1$Date <- as.Date(R1$Date, tryFormats = "%d/%m/%Y")

#R1E
#Se carga el primer rango
R1E <- read.csv(
  file = "TSLAStockStats/Rangos Work/(0)TSLAStockStats_RangosSeleccionadosR1E.csv",
  stringsAsFactors = FALSE
)

#se convierte la fecha de factor a fecha
R1E$Date <- as.Date(R1E$Date, tryFormats = "%d/%m/%Y")

#R2
#Se carga el primer rango
R2 <- read.csv(
  file = "TSLAStockStats/Rangos Work/(0)TSLAStockStats_RangosSeleccionadosR2.csv",
  stringsAsFactors = FALSE
)

#se convierte la fecha de factor a fecha
R2$Date <- as.Date(R2$Date, tryFormats = "%d/%m/%Y")

#R2E
#Se carga el primer rango
R2E <- read.csv(
  file = "TSLAStockStats/Rangos Work/(0)TSLAStockStats_RangosSeleccionadosR2E.csv",
  stringsAsFactors = FALSE
)

#se convierte la fecha de factor a fecha
R2E$Date <- as.Date(R2E$Date, tryFormats = "%d/%m/%Y")

#Se carga el primer rango
R3 <- read.csv(
  file = "TSLAStockStats/Rangos Work/(0)TSLAStockStats_RangosSeleccionadosR3.csv",
  stringsAsFactors = FALSE
)

#se convierte la fecha de factor a fecha
R3$Date <- as.Date(R3$Date, tryFormats = "%d/%m/%Y")

#Se carga el primer rango
R3E <- read.csv(
  file = "TSLAStockStats/Rangos Work/(0)TSLAStockStats_RangosSeleccionadosR3E.csv",
  stringsAsFactors = FALSE
)

#se convierte la fecha de factor a fecha
R3E$Date <- as.Date(R3E$Date, tryFormats = "%d/%m/%Y")

#Se carga el primer rango
R4 <- read.csv(
  file = "TSLAStockStats/Rangos Work/(0)TSLAStockStats_RangosSeleccionadosR4.csv",
  stringsAsFactors = FALSE
)

#se convierte la fecha de factor a fecha
R4$Date <- as.Date(R4$Date, tryFormats = "%d/%m/%Y")

#Se carga el primer rango
R4E <- read.csv(
  file = "TSLAStockStats/Rangos Work/(0)TSLAStockStats_RangosSeleccionadosR4E.csv",
  stringsAsFactors = FALSE
)

#se convierte la fecha de factor a fecha
R4E$Date <- as.Date(R4E$Date, tryFormats = "%d/%m/%Y")

#Se carga el primer rango
R5 <- read.csv(
  file = "TSLAStockStats/Rangos Work/(0)TSLAStockStats_RangosSeleccionadosR5.csv",
  stringsAsFactors = FALSE
)

#se convierte la fecha de factor a fecha
R5$Date <- as.Date(R5$Date, tryFormats = "%d/%m/%Y")

#Se carga el primer rango
R5E <- read.csv(
  file = "TSLAStockStats/Rangos Work/(0)TSLAStockStats_RangosSeleccionadosR5E.csv",
  stringsAsFactors = FALSE
)

#se convierte la fecha de factor a fecha
R5E$Date <- as.Date(R5E$Date, tryFormats = "%d/%m/%Y")

}

loadTwSentimentAnalysisRangos()

View(FollowersTweets)

#Acotar Rangos
#se convierte la fecha de factor a fecha
FollowersTweets$created <- as.Date(FollowersTweets$created, tryFormat = "%d/%m/%Y")

#Palabras que se van a buscar
FTPattern <- c('Tesla', 'Tesla Semi', 'Tesla Truck')


#Union de palabras que se van a buscar
FTPattern <- paste(
  x = FTPattern,
  collapse = "|"
)

#se agarra los tweets que tienen las palabras que se buscaron.
FollowersTweets <- subset(
  x = FollowersTweets,
  subset = grepl(
      pattern = FTPattern,
      x = FollowersTweets$text,
      ignore.case = TRUE
    )
)

View(FollowersTweets)

#Corpus
#Se selecciona el vector del texto de los tweets
corpus <- VCorpus(VectorSource(FollowersTweets$text))
#Transformar las letras a minusculas
corpus <- tm_map(corpus , content_transformer(tolower))
#Funcion para remover rt
removeRT <- function(x){gsub('rt', '', x)}
#Remover RT
corpus <- tm_map(corpus, content_transformer(removeRT))
#Remover puntuación
corpus <- tm_map(corpus, removePunctuation)
#Remover "StopWords"
corpus <- tm_map(corpus, removeWords, stopwords("english"))
#Funcion para remover http
removeURL <- function(x){gsub('http[[:alnum:]]*', '', x)}
#Remover https
corpus <- tm_map(corpus, content_transformer(removeURL))
#Simplificar palabras similares (Stem)
corpus <- tm_map(corpus, stemDocument)
#Remover espacios en blanco
corpus <- tm_map(corpus, stripWhitespace)

#View(corpus)

#Dicionario
dict.LM <- loadDictionaryLM()
summary(dict.LM)



#word cloud

#color palette
pal <- RColorBrewer::brewer.pal(8, "Dark2")

corpus.wc <- wordcloud(
  words = corpus,
  min.freq = 5,
  max.words = Inf,
  random.order = FALSE,
  colors = pal,
  scale = c(4, .5),
  width = 1000,
  height = 1000
)

csentiment <- analyzeSentiment(corpus)

#convertToDirection (Positivo/ Neutral / Negativo) column select
csentiment <- subset(
  x = convertToDirection(sentiment = csentiment),
  select = c("WordCount","SentimentGI", "PositivityLM", "NegativityLM", "RatioUncertaintyLM")
)

corpus.df <- data.frame(sapply(corpus, as.character), stringsAsFactors = FALSE)

#View(corpus.df)

FollowersTweets$text <- corpus.df$sapply.corpus..as.character.

#View(FollowersTweets)


# Similar to POMS, but unknown.
#gns_ftc <- get_nrc_sentiment(FollowersTweets$text)
#df.gns_ftc <- data.frame(colSums(gns_ftc[,]))


FTtweets <- FollowersTweets %>%
  select(created, text) %>%
  unnest_tokens("word", text)

View(FTtweets)

data("stop_words")

FTtopwords <- FTtweets %>%
  anti_join(stop_words) %>%
    count(word) %>%
    arrange(desc(n))

FTtop20 <- FTtopwords[1:20,]

View(FTtop20)

FTtopwords$word <- factor(
  FTtopwords$word,
  levels = FTtopwords$word[order(FTtopwords$n,
  decreasing=TRUE)]
)

ggplot(FTtop20, aes(x = word, y = n)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  ylab("Number of Times Word Appears") +
  xlab("") +
  guides(fill = FALSE)


FTtweets_tfidf <- FollowersTweets %>%
  select(created, text) %>%
    unnest_tokens("word", text) %>%
    anti_join(stop_words) %>%
      count(word, created) %>%
        bind_tf_idf(word, created, n)

FTtopttweet <- FTtweets_tfidf %>%
  arrange(desc(tf_idf))

#FTtopttweet$word


#Problemas
FTtweet_sentiment <- FTtweets %>%
  inner_join(get_sentiment("loughran")) %>%
              count(created, csentiment)



#head(ttweet_sentiment)

ttweets$created <- as.Date(ttweets$created, format = "%d/%m/%Y")

ttweets_sentiment_plot <- 
  ttweets %>%
  inner_join("afinn") %>%
    filter(sentiment == "negative") %>%
      count(created, sentiment)

#ggplot(ttweets_sentiment_plot,aes(x = date, y = n)) +
#  geom_line(color = "red") +
#    theme_minimal() +
#      ylab("Frecuency") +
#      xlab("Date")




