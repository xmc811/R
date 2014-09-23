ource("http://www.openintro.org/stat/data/present.R")
# load the source file for study

present
# show the general structure of the data

dim(present)
# show the dimension of the dataframe (rows and columns)


plot(x=present$year, y=present$girls)
# plot between a numeric data and a categorical data (two variables)
# another parameter "type" to specify graph types

plot(x = present$year, y = present$girls, type = "p")
# scatter plot

plot(x = present$year, y = present$girls, type = "l")
# plot line graph instead of scatterplot

plot(x = present$year, y = present$girls, type = "b")
# scatter plus line

plot(x = present$year, y = present$girls, type = "c")
# both plot but with line alone, kind of weird

plot(x = present$year, y = present$girls, type = "o")
# overplot, line over the point

plot(x = present$year, y = present$girls, type = "h")
# histogram-like bars

plot(x = present$year, y = present$girls, type = "s")
# stair-step plot like Kaplan-Meier

plot(x = present$year, y = present$girls, type = "n")
# no plot