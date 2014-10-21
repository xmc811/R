
setwd("C:/Users/HGSC/Desktop/RP/BATCH-2/")

getwd()

x <- read.table("SRF988.filt_indel.vcf",header=F)
# read.delim is used to read vcf files
# Note; diffrent vcf files have different headers in certain column
# thus, read,table() is still recommended




vcfParse <- function(data) {
       
       read <- as.character(data[[10]])
       pattern <- gregexpr(":",read)
       
       alt <- rep (NULL,length(read))
       ref <- rep (NULL,length(read))
       
       for (i in 1:length(read)) {
              alt[i] <- substr(read[i],pattern[[i]][1]+1,pattern[[i]][2]-1)
              ref[i] <- substr(read[i],pattern[[i]][2]+1,pattern[[i]][3]-1)
       }
       
       parsed <- cbind(data[,1:2],data[,4:5],alt,ref,data[,11:23])
       
       parsed
       
}




batchVcf <- function() {
       
       vcfList <- list.files(pattern="*.vcf")
       batchData <- data.frame()
       
       for (i in vcfList) {
              data <- read.table(i,header=F)
              record <- vcfParse(data)
              
              batchData <- rbind(batchData,record)
       }
       
       write.csv(batchData,"batch.vcf")
       
       Batch <<- batchData
}





batchVcf()


count <- function(string,vector) {
       num <- length(which(vector==string))
       num
}






selectTwohit <- function(data) {
       
       data$alt <- as.numeric(data$alt)
       data$ref <- as.numeric(data$ref)
       data[,13] <- as.character(data[,13])
       
       homo <- subset(data,subset=(data$alt>=data$ref*3))
       
       genelist <- data[[13]]
       
       complogic <- rep(NULL,length(genelist))
       
       for (i in 1:length(genelist)) {
              
              num <- count(genelist[i], genelist)
              
              if (num>=2) {
                     complogic[i] <- TRUE
              } else {
                     complogic[i] <- FALSE
              }
       }
       
       comp <- data[complogic,]
       
       total <- rbind(homo,comp)
       
       total <- unique(total)
       
       total
}







x <- selectTwohit(test)









batchselectTwohit <- function(data) {
       
       sampleID <- factor(data[,12])
       
       listBatch <- split(data,sampleID)
       
       Twohit <- data.frame()
       
       for (i in 1:length(listBatch)) {
              record <- selectTwohit(listBatch[[i]])
              
              Twohit <- rbind(Twohit,record)
       }

       Batch2hit <<- Twohit
       write.csv(Batch2hit,"Twohit.vcf")
}



batchselectTwohit(Batch)


