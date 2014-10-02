

system.time(readLines("http://www.jhsph.edu"))

## output
##  user  system elapsed 
## 0.008   0.008   1.231 

## user time is the time used for excuting the command
## system time relates to the CPU
## elapsed time is the time waiting for outside processes

g <- rnorm(10000)

quickadd <- function(g){ 
       return(sum(g))
}

slowadd <- function(g){
       x <- 0
       for (i in 1:length(g)){
             x <- x+g[i] 
       }
       x
}

system.time(quickadd(g))
system.time(slowadd(g))

## > system.time(quickadd(g))
## user  system elapsed 
## 0       0       0 
## > system.time(slowadd(g))
## user  system elapsed 
## 0.009   0.000   0.008 

## do avoid loopings in R programming




