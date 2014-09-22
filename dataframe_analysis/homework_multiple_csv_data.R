
## This example is for analyzing data from multiple csv files


## 1st function
## calculate the mean of a column with a specific subgroup

pollutantmean <- function(directory, pollutant, id = 1:332) {
       
       setwd(paste("C:/Users/HGSC/Downloads/Rcourse",directory,sep="/")) 
       #set the correct working directory
       

       AllData<-data.frame() 
       #generate an empty dataframe placeholder for storing the data
       
       for (i in id){
              FileName <- formatC(i, width = 3, flag = "0")  
              #generate strings corresponding to csv names
              NewData<- read.csv(paste(FileName,"csv",sep=".")) 
              #import a new csv file
              AllData<- rbind(AllData,NewData) 
              #merge the new csv file to the previous dataframe
       }
       
       ## This "for" loop is used to combine all the data with specified ID 
       ## into an individual dataframe
       
       
       record<-subset(AllData,select=pollutant)[[1]] 
       #generate the record list for specified pollutant
       mean(record,na.rm=TRUE)  
       #calculate the mean without NAs and return the result
       
}


## 2nd function
## generate a new dataframe counting qualified records with a specific attribute


complete <- function(directory, id = 1:332) {
       setwd(paste("C:/Users/HGSC/Downloads/Rcourse",directory,sep="/")) 
       
       ## 'directory' is a character vector of length 1 indicating
       ## the location of the CSV files
       
       complete<-data.frame()
       
       for (i in id){
              FileName <- formatC(i, width = 3, flag = "0")  
              # generate strings corresponding to csv names
              
              NewData<- read.csv(paste(FileName,"csv",sep=".")) 
              # import a new csv file
              
              count<-sum(complete.cases(NewData))
              # complete.cases returns a logical vector of whether there is no NAs
              # get a new count
              
              newrecord<-data.frame(id=i,nobs=count)
              # use the id and count to generate a newrecord 
              
              complete<- rbind(complete,newrecord) 
              #merge the new row to the previous dataframe
       }
       
       complete
       
       ## Return a data frame of the form:
       ## id nobs
       ## 1  117
       ## 2  1041
       ## ...
       ## where 'id' is the monitor ID number and 'nobs' is the
       ## number of complete cases
       
       
       
## 3rd function
## perform calculations between data with a specific attribute
       
       
corr <- function(directory, threshold = 0) {
       
       ## 'directory' is a character vector of length 1 indicating
       ## the location of the CSV files
              
       setwd(paste("C:/Users/HGSC/Downloads/Rcourse",directory,sep="/")) 
       #set the correct working directory
              
       cr<-c()
              
       for (i in 1:332){
              
       FileName <- formatC(i, width = 3, flag = "0")  
       #generate strings corresponding to csv names
              
       NewData<- read.csv(paste(FileName,"csv",sep=".")) 
       #import a new csv file
              
       count<-sum(complete.cases(NewData))
              if (count>=threshold){
                     CompData<-na.omit(NewData)
                     newrecord<-cor(CompData[[2]],CompData[[3]])
                     cr<- append(cr,newrecord,after=length(cr)) 
              } else {
                            
              }
                     
                     
       }
       ## 'threshold' is a numeric vector of length 1 indicating the
       ## number of completely observed observations (on all
       ## variables) required to compute the correlation between
       ## nitrate and sulfate; the default is 0
       
       cr
       ## Return a numeric vector of correlations
}