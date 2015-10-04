# rm(list=ls(all=TRUE))
# source("best.R")
# outcome<-"heart attack"
# state<-"TX"
# h<-best(state, outcome)
# h
# outcome<-"heart failure"
# state<-"TX"
# h<-best(state, outcome)
# h
# outcome<-"pneumonia"
# state<-"MD"
# h<-best(state, outcome)
# h
# outcome<-"heart attack"
# state<-"BB"
# h<-best(state, outcome)
# 
# outcome<-"hert attack"
# state<-"NY"
# h<-best(state, outcome)
# source("rankhospital.R")
# rankhospital("TX", "heart failure", 4)
# rankhospital("MD", "heart attack", "worst")
# rankhospital("MN", "heart attack", 5000)
source("rankall.R")
head(rankall("heart attack", 20), 10)
# tail(rankall("pneumonia", "worst"), 3)



