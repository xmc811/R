

## Use simulation to analyze the independence of a random variable
## Kobe's shot as an example

load(url("http://www.openintro.org/stat/data/kobe.RData"))
# load database instead of loading r file

head(kobe)

kobe_streak <- calc_streak(kobe$basket)
barplot(table(kobe_streak))

#calc_streak is customized function to count the streak of one outcome in one random variable



## basic simulation in R

outcomes <- c("heads", "tails")
sample(outcomes, size = 10, replace = TRUE)
# do a coin-flipping simulation, replace means whether it is replaced after each trial

outcomes <- c("H", "M")
sim_basket <- sample(outcomes, size = 100, replace = TRUE, prob=c(0.45,0.55))
barplot(table(calc_streak(sim_basket)))
# another simulation with unequal probability and plot the result
# simulate Kobe's shot in R






## simulation with distributions

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




## simulation of a linear model

## y=ax+b+e

x <- rnorm(10,500,200)
e <- rnorm(10,0,1)

y <- 2*x+10+e

plot(x,y)
cor(x,y)

## this linear model can be played around for understanding the x,y correlation

## the smaller e variation, the larger correlation, given others unchanged
## the larger the y value (mean of x or coefficient of y), the larger correlation
## the larger x variation, the larger correlation


## more real random variables
## error distribution is Poisson instead of normal

x <- rnorm (100,0,1)
log.mu <- 0.5+x
y <- rpois(100,exp(log.mu))

plot(x,y)





