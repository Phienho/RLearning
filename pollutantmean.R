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
