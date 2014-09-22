load(url("http://www.openintro.org/stat/data/kobe.RData"))
# load database instead of loading r file

outcomes <- c("heads", "tails")
sample(outcomes, size = 10, replace = TRUE)
# do a coin-flipping simulation, replace means whether it is replaced after each trial

outcomes <- c("H", "M")
sim_basket <- sample(outcomes, size = 100, replace = TRUE, prob=c(0.45,0.55))
barplot(table(calc_streak(sim_basket)))
# another simulation with plot
