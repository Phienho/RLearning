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
#             print(nrow(data1))
            corri<-cor(data1["sulfate"],data1["nitrate"])
            corl<-c(corl,corri)}
    }
    corl
}