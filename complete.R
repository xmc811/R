
complete <- function(directory, id = 1:332) {
       setwd(paste("C:/Users/HGSC/Downloads/Rcourse",directory,sep="/")) 
       
       ## 'directory' is a character vector of length 1 indicating
       ## the location of the CSV files
       
       complete<-data.frame()
       
       for (i in id){
              FileName <- formatC(i, width = 3, flag = "0")  
              #generate strings corresponding to csv names
              NewData<- read.csv(paste(FileName,"csv",sep=".")) 
              #import a new csv file
              count<-sum(complete.cases(NewData))
              
              newrecord<-data.frame(id=i,nobs=count)
              
              complete<- rbind(complete,newrecord) 
              #merge the new csv file to the previous dataframe
       }
       
       complete
      
       ## Return a data frame of the form:
       ## id nobs
       ## 1  117
       ## 2  1041
       ## ...
       ## where 'id' is the monitor ID number and 'nobs' is the
       ## number of complete cases
}