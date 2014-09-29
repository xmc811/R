

## This file contains three functions for analyzing hospital data
## specifically the data of 3 mortality variables in more than 50 states 
## the main techniques used here are indexing, ranking, subsetting

## data used is outcome-of-care-measures.csv in the same folder


# 1st function
## find the best hospital (in term of one specific mortality rate) in a given state

best <- function(statename,disease) {
       
       setwd("C:/Users/HGSC/Downloads/Rcourse")
       outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
       ## read outcome data
       
       statelist<-unique(outcome[[7]])                   
       # get a list of state names(unordered)
       
       diseaselist<-c("heart attack","heart failure","pneumonia")
       disease_vec<-c(11,17,23)
       names(disease_vec)<-c("heart attack","heart failure","pneumonia")
       # construct an index vector
       # used for lookup the column selected in the following parts
       
       
       if (statename %in% statelist==FALSE) {
              stop("invalid state")           # check if state name is valid 
              
       }      else if (disease %in% diseaselist==FALSE) {
              stop("invalid outcome")         # check if disease name is valid 
       } 
       
       
       else { 
              rawdata <- subset(outcome,subset=(State==statename))
              # cut the data for a specific state
              
              data<-rawdata[,c(2,disease_vec[match(disease,names(disease_vec))])]
              # cut the unnecessary columns off
              
              data[,2]<-as.numeric(data[,2])
              # convert the data type to numeric for sorting
              
              index<-match(min(data[,2],na.rm=TRUE),data[,2])
              # find the index for minimal mortality rate
              
              result<-data[index,1]
              # get the hospital name
              
              result
              # return the result
       }       
       
}




# 2nd function
## find a hospital in give ranking (in term of one specific mortality rate) in a given state

rankhospital <- function(statename,disease,number) {
       
       setwd("C:/Users/HGSC/Downloads/Rcourse")
       outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
       ## read outcome data
       
       statelist<-unique(outcome[[7]])
       # get a list of state names(unordered)
       
       diseaselist<-c("heart attack","heart failure","pneumonia")
       disease_vec<-c(11,17,23)
       names(disease_vec)<-c("heart attack","heart failure","pneumonia")
       # construct an index vector
       # used for lookup the column selected in the following parts
       
       
       if (statename %in% statelist==FALSE) {
              stop("invalid state")                   # check if state name is valid    
              
       }      else if (disease %in% diseaselist==FALSE) {
              stop("invalid outcome")                 # check if disease name is valid 
       } 
       
       else {
              origindata<-subset(outcome,subset=(State==statename))
              # cut the data for a specific state
              
              rawdata<-origindata[,c(2,disease_vec[match(disease,names(disease_vec))])]
              # cut the unnecessary columns off
              
              rawdata[,2]<-as.numeric(rawdata[,2])
              # convert the data type to numeric for sorting
              
              data<-subset(rawdata,subset=complete.cases(rawdata))
              # remove data with NA values
              
              
              data<-data[order(data[,2],data[,1]),]
              # rearrange the data with a new index
              # this index is the ranking 
              # primary keyword outcome
              # secondary keyword hospital name
              
              while (number=="best") {number=1}
              while (number=="worst") {number=nrow(data)}
              
              result<-data[number,1]
              # retrieve the hospital name
              
              result
              # return the result
       }
       
}



# 3rd function
## find the hospital name in specific ranking (in term of one specific mortality rate)
## of all the states


rankall <- function(disease,number) {
       
       setwd("C:/Users/HGSC/Downloads/Rcourse")
       outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
       ## read outcome data
       
       rawstatelist<-unique(outcome[[7]])               # get a list of state names(unordered)
       
       statelist<-rawstatelist[order(rawstatelist)]     # order the state list
       
       diseaselist<-c("heart attack","heart failure","pneumonia")
       disease_vec<-c(11,17,23)
       names(disease_vec)<-c("heart attack","heart failure","pneumonia")
       
       # construct an index vector
       # used for lookup the column selected in the following parts
       
       
       
       if (disease %in% diseaselist==FALSE) {
              stop("invalid outcome")                   # check if disease name is valid 
       } 
       
       else {                                           # enter the main part of function
              result<-data.frame()
              # setup a placeholder for the result dataframe
              
              
              # since we need a comprehensive list of the data from all states
              # we need to do calculation in every state
              # the for loop here is to looping our lokking up in every state
              
              for (i in statelist){
                     origindata<-subset(outcome,subset=(State==i))
                     # cut the data for a specific state
                     
                     rawdata<-origindata[,c(2,7,disease_vec[match(disease,names(disease_vec))])]
                     # cut the unnecessary columns off
                     
                     rawdata[,3]<-as.numeric(rawdata[,3])
                     # convert the data type to numeric for sorting
                     
                     data<-subset(rawdata,subset=complete.cases(rawdata))
                     # remove data with NA values
                     
                     data<-data[order(data[,3],data[,1]),]
                     # rearrange the data with a new index
                     # this index is the ranking 
                     # primary keyword outcome
                     # secondary keyword hospital name
                     
                     num<-number
                     # retrieve num variable for subsequent test
                     ## Note: we need to do this step for every state
                     ## especially when number is "worst"
                     ## because if we don't use a new variable
                     ## the number will be a specific integer, not "worst" anymore
                     ## the following calculations will be wrong
                     
                     while (num=="best") {num<-1}
                     while (num=="worst") {num<-nrow(data)}
                     
                     record<-data.frame(hospital=data[num,1],state=i)
                     # final subsetting for retriving the hospital name and its state
                     # store it in a cache dataframe
                            
                     result<-rbind(result,record)
                     # add the record to the whole data
                     
              }
              
              row.names(result)<-statelist
              # add names of the result dataframe
       }
       
       result
       # return the result
}



       