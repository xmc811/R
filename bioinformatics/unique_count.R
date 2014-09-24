setwd("C:/Users/HGSC/Desktop/Shell script")
getwd()
id_mt = read.csv("C:/Users/HGSC/Desktop/Shell script/id_mt.csv",header = FALSE)
id_total = read.csv("C:/Users/HGSC/Desktop/Shell script/id_total.csv",header = FALSE)
dim(id_total)



## This block returns the true result
## check if elements in list A is also in List B
sum=0
y=id_mt[1:108,1]
for (i in y){
       count = sum(id_total[1]==i)
       if (count>0){
              sum=sum+1
       }
}

sum
# get the totol "positive" results


## This block returns a test result
sum=0
x=id_mt[,1]
for (i in x){
       count = sum(id_mt[1]==i)
       if (count>0){
              sum=sum+1
       }
}

sum


