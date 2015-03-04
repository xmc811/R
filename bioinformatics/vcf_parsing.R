



vcfParse <- function(data) {
       
       read <- as.character(data[[10]])
       pattern <- gregexpr(":",read)
       
       alt <- rep (NULL,length(read))
       ref <- rep (NULL,length(read))
       
       for (i in 1:length(read)) {
              alt[i] <- substr(read[i],pattern[[i]][1]+1,pattern[[i]][2]-1)
              ref[i] <- substr(read[i],pattern[[i]][2]+1,pattern[[i]][3]-1)
       }
       
       parsed <- cbind(data[,1:2],data[,4:5],alt,ref,data[,11:ncol(data)])

       parsed
       # return parsed dataframe
       
}


## this is the function to 

batchVcf <- function() {
       
       library(plyr)
       
       vcfList <- list.files(pattern="*.vcf")
       batchData <- data.frame()
       
       for (i in vcfList) {
              data <- read.table(i,header=F, sep="\t", fill = TRUE, stringsAsFactors = FALSE)
              ## exclude headers, seperated by tab, avoid factors
              
              
              record <- vcfParse(data)
              
              
              batchData <- rbind.fill(batchData,record)
              # avoid unequal column length
              
              
       }
       
       batchData$alt <- as.numeric(as.character(batchData$alt))
       batchData$ref <- as.numeric(as.character(batchData$ref))
       # must have two-step
       
       
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





batchselectTwohit <- function(data) {
       
       sampleID <- factor(data[,12])
       
       listBatch <- split(data,sampleID)
       
       Twohit <- data.frame()
       
       for (i in 1:length(listBatch)) {
              record <- selectTwohit(listBatch[[i]])
              
              Twohit <- rbind(Twohit,record)
       }

       Batch2hit <<- Twohit

}



batchselectTwohit(Batch)


write.table(Batch, file ="Batch.vcf", sep = "\t")

write.table(Batch2hit, file ="Twohit.vcf", sep = "\t")


