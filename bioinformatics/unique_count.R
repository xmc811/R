setwd("C:/Users/HGSC/Desktop/Shell script")
getwd()
id_mt = read.csv("C:/Users/HGSC/Desktop/Shell script/id_mt.csv",header = FALSE)
id_total = read.csv("C:/Users/HGSC/Desktop/Shell script/id_total.csv",header = FALSE)
dim(id_total)

## Background
## The csv files contain NGS reads mapped to whole genome and mitochondria
## We want to know if the mitochondria reads also mapped to the whole genome, if so, how many?

## This block returns the true result
## The basic algorithmic question is check if elements in list A is also in List B and count how many

sum=0
y=id_mt[1:108,1]    # generate a list A
for (i in y){
       count = sum(id_total[1]==i)           # count times that reads appear
       if (count>1){                         # 1 is the threshold because list A is a subset of list B
              sum=sum+1                      # counter for final calculation
       }
}

sum                   


# get the total "positive" hits


## This block only returns a test result
sum=0
x=id_mt[,1]
for (i in x){
       count = sum(id_mt[1]==i)
       if (count>0){
              sum=sum+1
       }
}

sum


