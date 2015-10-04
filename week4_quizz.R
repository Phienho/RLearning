rm(list=ls())
# x<-rnorm(100,2,4)
# x
# str(x)
# library(datasets)
# str(airquality)
# set.seed(1)
# rpois(5,2)
# x<-rnorm(10,2,2)
# dnorm(x)
# #
# set.seed(10)
# x<-rep(0:1,each=5)
# e<-rnorm(10,0,20)
# y<-0.5+2*x+e
# plot(x,y)
# 
# #
# ppois(6,2)
#
library(datasets)
Rprof()
y<-rnorm(10);
x1<-rnorm(10);
x2<-rnorm(10);
fit<-lm(y~x1+x2)
Rprof(NULL)
summaryRprof()
by.total