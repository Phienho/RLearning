# setwd("/home/phho/WORK/CODE/R_Coursera/data")
# #path_data_file<-/home/phho/WORK/CODE/R_Coursera/data
# getwd()
# my_data<-read.csv("hw1_data.csv")
# XX<-my_data[which(my_data[,"Ozone"]>31 & my_data[,"Temp"]>90),]
# meanSolar <-mean(XX[,"Solar.R"])
# YY<-my_data[which(my_data[,"Month"]==6),]
# meanTemp<-mean(YY[,"Temp"])
# print(meanTemp)
# ZZ<-my_data[which(my_data[,"Month"]==5),]
# print(ZZ)
# TT<-ZZ[,"Ozone"]
# maxozone<-max(TT[!is.na(TT)])
# print(maxozone)

setwd("/home/phho/WORK/NHAM")
getwd()
my_data<-read.csv("Bio_Phien_cluster.csv")