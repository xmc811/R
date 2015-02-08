library(datasets)

head(airquality)

hist(airquality$Temp)
# draw a simple histogram

plot(airquality$Wind,airquality$Temp, pch = 1)
# draw a scatter plot with "X" as the data point

boxplot(airquality$Ozone ~ airquality$Month, xlab = "Month", ylab = "Ozone")
title(main = "Ozone levels")
# draw a boxplot and add labels
# add title

par("bg")
# global parameter setup