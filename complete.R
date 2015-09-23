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
