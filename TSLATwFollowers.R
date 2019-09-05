#Tesla Motros Inc. Twitter Followers (TSLATwFollowers)
TSLATwFollowers1 <- read.csv(
  file = "TSLATwFollowers (1).csv",
  sep = ",",
  stringsAsFactors = FALSE
)

TSLATwFollowers2 <- read.csv(
  file = "TSLATwFollowers (2).csv",
  sep = ",",
  stringsAsFactors = FALSE
)

TSLATwFollowers3 <- read.csv(
  file = "TSLATwFollowers (3).csv",
  sep = ",",
  stringsAsFactors = FALSE
)

TSLATwFollowers4 <- read.csv(
  file = "TSLATwFollowers (4).csv",
  sep = ",",
  stringsAsFactors = FALSE
)

TSLATwFollowers.c <- merge(
  x = TSLATwFollowers1,
  y = TSLATwFollowers2
)

View(TSLATwFollowers1)

