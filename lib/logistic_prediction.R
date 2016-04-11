setwd("Documents/Spring2016/DataScience/Project4/")

#################### Load Libraries ##################

library(dplyr)
library(data.table)
library(caret)
library(ROCR)

#################### Prepare Data ####################

movies <- read.csv("movies2.csv", stringsAsFactors=FALSE)
oscar_asin <- read.csv("project4-team-5/data/oscar_nominations.csv", stringsAsFactors=FALSE)
oscar_dates <- read.csv("project4-team-5/data/oscar_dates.csv", stringsAsFactors=FALSE)
twitter_data <- read.csv("project4-team-5/data/oscar_winners_FINAL_twitter2.csv", stringsAsFactors=FALSE)
twitter_data[14,]$Title = "Crouching Tiger, Hidden Dragon"
twitter_data$Year<-NULL
twitter_data$Win<-NULL
twitter_data$ASIN<-NULL
twitter_data<-twitter_data[1:98,]

# Take first genre
for(i in 1:length(twitter_data$Genre)){
  twitter_data$Genre[i]<-strsplit(twitter_data$Genre[i], "|", fixed=TRUE)[[1]][1]
}

oscar_movies <- left_join(oscar_asin, movies, by = c("ASIN" = "product_productid"))
final_data <- subset(left_join(oscar_movies, twitter_data, by = c("Title" = "Title")), select=c(3,8,15,16))

# Split into training and testing data
train<-sample_frac(final_data, 0.7)
sid<-as.numeric(rownames(train))
test<-final_data[-sid,]

#################### Logistic model ####################

# Fit logistic regression model
fit <- glm(Win~Score+factor(Genre)+review_score,data=train,family=binomial(link='logit'))
fit.result <- predict(fit, test)
fit.result <- ifelse(fit.result > 0.5,1,0)
error <- mean(fit.result != test$Win)

# Percent correctly classified
print(paste0('Percent classified correctly ', (1-error) * 100, "%"))
summary(fit)

# Statistically significant variables
summary(fit)$coeff[-1,4] < 0.05
