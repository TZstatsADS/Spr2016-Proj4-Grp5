setwd("Documents/Spring2016/DataScience/Project4/")
library(dplyr)
library(data.table)
#library(tidyr)
#library(hexbin)

movies <- read.csv("movies2.csv", stringsAsFactors=FALSE)
#oscar_asin <- read.csv("project4-team-5/data/oscar_winners_FINAL.csv", header=FALSE, stringsAsFactors=FALSE)
oscar_asin <- read.csv("project4-team-5/data/oscar_nominations.csv", stringsAsFactors=FALSE)
#oscar_asin <- oscar_asin[1:98,]
#oscar_asin[1,4] <- "0767811100"
oscar_movies <- left_join(oscar_asin, movies, by = c("ASIN" = "product_productid"))

#oscar_reviews <- filter(movies, product_productid )
#product_productid,review_userid,review_profilename,review_helpfulness,review_score,review_date,review_time