library(dplyr)

data<-read.csv("Movies_Distance_Matrix_2.csv",header=T)

raw<-read.csv("oscar_nominations.csv",header=T)
oscar<-filter(data,movies %in% raw$Title)
oscar_index<-oscar[,1]+1
n<-length(oscar_index)

distance_matrix<-data[oscar_index,]
distance_matrix<-distance_matrix[,-1]
distance_matrix<-distance_matrix[,oscar_index]


title<-data.frame(index=1:78,title=data[oscar_index,]$movies)
save(distance_matrix,title,file="distance_matrix.RData")
load("distance_matrix.RData")
distance_matrix<-distance_matrix[-28,-28]
title<-title[-28,]
title$index<-1:77

movie$index<-1:77
save(movie,distance_matrix,file="oscars_summary.RData")
load("oscars_summary.RData")
