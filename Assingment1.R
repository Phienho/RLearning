pollutantmean <- function(directory, pollutant, id) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    files<-list.files(directory,full.names=TRUE)
    if(nargs()<3){
        id<-1:length(files)
    }
    meani<-numeric(0)
    for(i in id){                    
        data<-read.csv(files[i])
        #Extract the column of the pollutant
        dp<-data[pollutant]
        #Find the missing data of the pollutant
        idx<-is.na(dp)
        #vector of unmissing values
        dp_um1 <- dp[!idx]            
        meani <-c(meani,dp_um1)       
    }    
    mean(meani)
}
########################
########################
complete <- function(directory, id_dat) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    files<-list.files(directory,full.names=TRUE)
    L<-length(id_dat)
    count_id<-numeric(L)
    for(i in 1:L){                    
        data<-read.csv(files[id_dat[i]])    
        data1<-data[rowSums(is.na(data))==0,]
        count_id[i]<-nrow(data1)
    }
    data.frame(id = id_dat,nobs = count_id)
}
#####
corr <- function(directory, threshold) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    if(nargs()<2){
        threshold<-0
    }
    files<-list.files(directory,full.names=TRUE)
    id_dat<-1:length(files)
    L<-length(id_dat)
    corl<-numeric(0)
    for(i in 1:L){                    
        data<-read.csv(files[id_dat[i]])    
        data1<-data[rowSums(is.na(data))==0,]
        if(nrow(data1)>threshold){
            print(nrow(data1))
            corri<-cor(data1["sulfate"],data1["nitrate"])
            corl<-c(corl,corri)}
    }
    corl
}
################

setwd("/home/phho/WORK/CODE/COURSERA/RLearning")
getwd()
directory<-"specdata"
id_dat<-1:100
pollutant<-"nitrate"
m<-pollutantmean(directory, pollutant)
m
# source("pollutantmean.R")
# pollutantmean("specdata", "sulfate", 1:10)
# part2<-complete(directory, id_dat)
# part2
# corvalue<-corr(directory)
# corvalue