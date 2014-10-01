

## simulation

x <- rnorm(20,mean=0,sd=2)
# a very basic simulation of normal distributed population

## dnorm, pnorm functions etc. can be found in z-statistics.R

y <- rpois(100,lambda=2)
## simulation of Poisson distribution, where lambda is the mean value

set.seed(7)
x <- rpois(10,2)
## output [1] 6 1 0 0 1 3 1 5 1 2
## set.seed functio fixes the seed of random variable generation process
## thus allowing people to generate exactly the same outcomes

x <- rpois(10,2)
## output [1] 1 1 3 0 2 0 2 0 6 1
## seed is changed after last random sampling

set.seed(7)
x <- rpois(10,2)
## output [1] 6 1 0 0 1 3 1 5 1 2
## the same dataset generated


