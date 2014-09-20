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