
## the basic techniques of apply functions

## 1st function
## apply

## input the simulation data

m<-matrix(cbind(rnorm(10),rnorm(10,sd=2),rnorm(10,sd=5)),nrow=10)
## Note: the cbind function doesn't automatically make a 10*3 matrix
## we still need to use nrow option

dim(m)

apply(m,1,mean)
## row-wise application of function
## row:1
## column:2
## both: c(1,2)

apply(m,2,mean)
## column-wise application


## user-defined function
## to calculate the average difference in a number sequence
gap <- function(x) {
       sum <- 0
       for (i in 2:length(x)) {
              a <- abs(x[i]-x[i-1])
              sum <- sum+a
       }
       sum/length(x)
}

apply(m,2,gap)
## apply it to the matrix


apply(m,1, function(x) {
       sum <- 0
       for (i in 2:length(x)) {
              a <- abs(x[i]-x[i-1])
              sum <- sum+a
       }
       sum/length(x)
})
## it can also be directly applied using the anonymous function method



## 2nd function
## lapply and sapply

n <- lapply(m,mean)
## thougth m is a matrix, since it's not a list, mean will be applied
## to each element of m, generating a list with 30 vectors of length 1


p <- list(rnorm(10),rnorm(10,sd=2),rnorm(10,sd=5))
## generate a list of 3 vectors of length 10
## Note: if c function is used, will return a list of 1 vector of length 30
## since we first already concatenate them

## sapply

## it intuitively returns the simplified form of result
lapply(p,mean)
# return a list of 3 vectors of length 1

sapply(p,mean)
# return a vector of length 3

sapply(p,mean,simplify=FALSE)
# return back to a list of 3 vectors
## thus lapply and sapply are very similar






## 3rd function
## tapply
## A dataset that can be broken up into groups, We want to break it up into groups
## Within each group, we want to apply a function

paper <- data.frame(quant=c(sample(5:25,20,replace=TRUE),sample(4:20,20,replace=TRUE),
       +      sample(3:15,20,replace=TRUE)),inst=gl(3,20,labels=c("BCM","UT","Rice")))

## generate a dataframe simulating publication IFs in three institutions

stat <- tapply(paper$quant,paper$inst,mean)
## calculate the average IF per institution
## Note: the first parameter should be a specific variable instead of the whole dataframe




## 4th function

## mapply

## this function, rather than sapply, extend the parameters to one element in multiple lists
## list numbers should be less than parameter numbers (including triple dot)
## thus alowing the lists can be passed to parameters

## list of random noise

noise <- mapply(rnorm,seq(10,20,by=5),rep(70,3),seq(5,15,by=5))
## generate a list of 3 set variables






## 5th function

## similar to tapply, but do not apply the functions

paper.sp <- split(paper,paper$inst)


paper.stat <- lapply(paper.sp, function(x) mean(x[,"quant"]))

## for a list of vectors, it's easy to directly apply functions
## for a list of dataframes, usually anonymous functions are needed.




## split can also subset data by multi layers

gender <- factor(rep(c("M","F"),each=90))
inst <- factor(rep(c("BCM","UT","Rice"),each=30,times=2))
field <- factor(rep(c("gen","biochem","immuno"),each=10,times=6))

type <- interaction(gender,inst,field)

## this method is used to generate multiple factor lists
## type is a factor vector with 18 levels (10 elements each level)

## be careful when dealing with multiple layers of factors

publication <- sample(seq(1,25,by=0.1),180)

data <- data.frame(publication=publication,gender=gender,inst=inst,field)

subdata <- split(data,list(gender,inst,field))

pub.stat <- lapply(subdata,function(x) mean(x[,"publication"]))

## theoretically, by this manipulation, we can easily handle the dataset with multiple layers
## of factors



