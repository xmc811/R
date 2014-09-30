
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





