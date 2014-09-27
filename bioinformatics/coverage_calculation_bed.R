
## This file is used to read and calculate the average coverage from bedtools coverage file


wd <- readline()    
wd <- gsub("\\\\","/",wd)
wd
setwd(wd)
getwd()

## for the details of the above block about setting working directory from Windows format
## to R format
## check the R file (backslash_set_working_directory.R) in file_input_output folder 


x<-read.table("total_reads_filter.csv")
## seems cannot use read.csv function, reason unknown


head(x)
dim(x)
## check out the basic format of the data


data<-subset(x,select=V1,subset=(V1>0))

## filter reads number bigger than 0
## if the dataframe has no column names, use V# as the names

mean(data[,1])
median(data[,1])
nrow(data)

## basic statistics of data
## just for one threshold





## the block below is a looping to calculate multi-fold parameters

size<-107958719 
# fly autosomal genome size

stat<-data.frame()
# set a placeholder for statistics

for (i in c(1,2,5,10,20)){
       data<-subset(x,select=V1,subset=(V1>=i))
       # subsetting by the threshold from 1 to 20
       
       threshold<-paste(i,"X",sep="")
       
       coverage<-nrow(data)/size
       avecov<-mean(data[,1])
       medcov<-median(data[,1])
       # calculate 3 parameters
       
       substat<-data.frame(thr=threshold,cov=coverage,ave=avecov,med=medcov)
       
       stat<-rbind(stat,substat)
       # add one record
}

stat


