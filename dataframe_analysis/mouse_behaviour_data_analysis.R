


## this file contains codes analyzing mouse holeboard poking behaviour data

Hbd20140424seq <- read.csv("20140424Hbd_seq.csv")
# read the data

# every row of data is only one poke, a mouse can have multiple pokes


split(Hbd20140424,Hbd20140424$SUBJECT)
# split the dataframe into multiple pieces by mouse


a<-sapply(Hbd20140424seq,nrow)
write.csv(a,"Hbdtest.csv",col.names=F)

# count the poke number of each mouse
# col.names should be false since we don't have the colnames




seq.poke<- function(data) {

# this function is used to calculate the sequential poke of a mouse  
       
       count<-0
       subdata<-data[,8]
       for ( i in 2:length(subdata)) {
              if (subdata[i]==subdata[i-1]) {
                     count<-count+1
              }
       }
       count
}



read.csv("genotype test 20140424.csv",header=FALSE)->genotype
# read genotype data for matching individual mouse with genotype, gender, etc.

colnames(genotype)<-c("SUBJECT","DOB","GENO","GENDER","EAR")


  
mouse.chart<-function(data){
       geno<-rep(NULL,length(data))
       gender<-rep(NULL,length(data))
       
       ## construct placeholder for genotype and gender
  
       for (i in 1:length(data)) {
              geno[i]<-levels(genotype[,3])[genotype[(match(a.names[i],genotype[,1])),3]]
              gender[i]<-levels(genotype[,4])[genotype[(match(a.names[i],genotype[,1])),4]]
       }
       
       # Note: the geno and gender data stored are factorized, so we need to index the levels
       # for retrieving the information
       
       chart<-cbind(data,geno,gender)
       chart
}

