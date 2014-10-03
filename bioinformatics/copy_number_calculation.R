setwd("C:/Users/HGSC/Desktop/Mitochondria/")
getwd()

data <- read.csv("batch1.csv")

data <- data[,1:7]
## delete the spaces


data[,8] <- rowSums(data[,2:6])
## sum the rows to generate reads number of all autosomes

colnames(data)[8]="autosomal"


data[,9] <- data[,7]/19517
data[,10] <- data[,8]/97958719
data[,11] <- data[,9]/data[,10]

## calculate the copy number after normalization

colnames(data)[9:11] <- c("mito_density","auto_density","copy")
## name the columns

size <- read.table("bamsizelist")
## read the file size list

data <- cbind(data,size)
## bind the file size to the dataframe

colnames(data)[12] <- "bamsize"

data <- data[1:53,]
## cutoff the last record (bad file)




library(ggplot2)

qplot(data[,11])


qplot(x=data[,9],y=data[,12])
cor(x=data[,9],y=data[,12])


qplot(x=data[,10],y=data[,12])
cor(x=data[,10],y=data[,12])


qplot(x=data[,11],y=data[,12])
cor(x=data[,11],y=data[,12])


