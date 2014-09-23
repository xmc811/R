

## This file contains the codes for calculating CI and some functions in Z statistics 
## ames_estate.RData used

load(url("http://www.openintro.org/stat/data/ames.RData"))

dim(ames)
# [1] 2930   82
# very large data

population <- ames$Gr.Liv.Area
summary(population)
hist(population)
# analyze a set of data: population

samp_size <- 60

samp <- sample(population, samp_size)
# random sampling

sample_mean <- mean(samp)



## calculate CI

confidence <- 0.95
# define confidence level

se <- sd(samp)/sqrt(samp_size)
# calculate the standard error




## Interlude: the introduction of normal distribution functions

dnorm(x=1,mean=0,sd=1)
# [1] 0.2419707
# x is the actual value, not the quantile
# returns the density of the distribution(height)

pnorm(q=0,mean=0,sd=1)
pnorm(q=0.8,mean=0,sd=1)
# [1] 0.5
# [1] 0.7881446
# q is also the actual value, 
# returns the proportion of population lower than q (quantile)

qnorm(p=0.975,mean=0,sd=1)
# [1] 1.959964
# give the quantile, returns the actual value (not the z score)!!

rand <- rnorm(100,mean=3,sd=3)
hist(rand)
# generate random variables based on normal distribution

## Interlude ended





p <- mean(c(confidence,1))
z <- qnorm(p)
# calculate the z score



lower <- sample_mean - z * se
upper <- sample_mean + z * se
# define the CI

c(lower, upper)
# obtain the CI



## simulate the z statistics process
## calculate multiple CIs to test whether they represent the true confidence

true_mean <- mean(population)
samp_size<-60
confidence<-0.99
# setup parameters

count <- 0

# initiate count

for (i in 1:50){
       
       samp <- sample(population, samp_size)
       sample_mean <- mean(samp)
       se <- sd(samp)/sqrt(samp_size)
       p <- mean(c(confidence,1))
       z <- qnorm(p)
       lower <- sample_mean - z * se
       upper <- sample_mean + z * se
       # calculate CI as previously described
       
       
       if (true_mean > lower & true_mean< upper){
              count<-count+1
       } else {
              
       }
       # check if true population mean is in the CI
}
# perform sampling 50 times

count


