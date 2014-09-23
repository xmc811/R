

## This file contains the codes simulating random sampling process

load(url("http://www.openintro.org/stat/data/ames.RData"))

dim(ames)
# [1] 2930   82
# very large data

area <- ames$Gr.Liv.Area
price <- ames$SalePrice

summary(area)
hist(area)
# check basic data distribution

samp0 <- sample(area, 50)
summary(samp0)
hist(samp0)

# randomly sample 50 samples from area to simulate the true situation
# check the data



## This is a sample for multiple sampling process from a large dataset

sample_means50 <- rep(NA, 5000)    # set up placeholder 

for (i in 1:5000) {
       samp <- sample(area, 50)
       sample_means50[i] <- mean(samp)
}
# sampling 5000 times and add data to vector

hist(sample_means50,breaks=20)



# another three random sampling process with two different sample size

sample_means10 <- rep(NA, 5000)
sample_means100 <- rep(NA, 5000)
sample_means1000 <- rep(NA, 5000)

for (i in 1:5000) {
       samp <- sample(area, 10)
       sample_means10[i] <- mean(samp)
       samp <- sample(area, 100)
       sample_means100[i] <- mean(samp)
       samp <- sample(area, 1000)
       sample_means1000[i] <- mean(samp)
}

hist(sample_means10)
hist(sample_means100)
hist(sample_means1000)


## parallel plotting of three graphs

par(mfrow = c(3, 1))
# function for graph arrangment
# 3 rows and 1 column

xlimits = range(sample_means10)

hist(sample_means10, breaks = 20, xlim = xlimits)
hist(sample_means100, breaks = 20, xlim = xlimits)
hist(sample_means1000, breaks = 20, xlim = xlimits)

## parallel plotting of 3 distributions


## another simulation of random sampling in price
samprice50 <- rep(NA,5000)
samprice150 <- rep(NA,5000)

for (i in 1:5000){
       sam50 <- sample(price,50)
       sam150 <- sample(price,150)
       samprice50[i] <- mean(sam50)
       samprice150[i] <- mean(sam150)
} 

par(mfcol=C(1,2))

hist(samprice50,breaks=20)
hist(samprice150,breaks=20)
