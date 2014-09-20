

pollutantmean <- function(directory, pollutant, id = 1:332) {
       
       setwd(paste("C:/Users/HGSC/Downloads/Rcourse",directory,sep="/")) 
       #set the correct working directory
       
       AllData<-data.frame() 
       #generate an empty dataframe for storing the data
       
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
       #calculate the mean without NAs
       
}