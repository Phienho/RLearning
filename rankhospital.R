rankhospital <- function(state, outcome, num) {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    ## 30-day death rate

    outcomelist<-c("heart attack","heart failure","pneumonia")
    outcomecol<-c(11,17,23)
    
    dataF <-read.csv("outcome-of-care-measures.csv",colClasses = "character")  
    hname<-dataF[,2]
    col_state<-dataF[,7]
    if ((state %in% dataF[,7])&(outcome %in% outcomelist)){
        idx<-match(outcome,outcomelist)        
        col_out<-dataF[,outcomecol[idx]]
        col_out<-as.numeric(col_out)        
        id_state<-which(col_state==state)
        col_out <- col_out[id_state]                    
        hname<-hname[id_state]
        
        #Find the missing data of col_out
        idx<-is.na(col_out)        
        #vector of unmissing values
        col_out <- col_out[!idx]                    
        hname<-hname[!idx]
        #
        if (num=="best"){
            id_min<-which(col_out==min(col_out))   
            hname1<-hname[id_min]
            hname1<-sort(hname1)
            rankhospital<-hname1[1]
        } else if (num=="worst"){
            id_max<-which(col_out==max(col_out))   
            hname1<-hname[id_max]
            hname1<-sort(hname1)
            rankhospital<-hname1[1]
        } else {
            if (num <= length(id_state)){
                id_min<-order(col_out,hname)
                id_min_num<-id_min[1:num]
                hname1<-hname[id_min_num]
                rankhospital<-hname1[num]
            }else{
                rankhospital<-NA
            }
        }
        }else if (!(state %in% dataF[,7])){
        stop("invalid state")
        }else{
        stop("invalid outcome")
        }
    rankhospital
}
