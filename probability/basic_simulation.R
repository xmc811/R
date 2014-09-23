

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




