source("http://www.openintro.org/stat/data/present.R")
# load the source file for study

present
# show the structure of the data

dim(present)
# show the dimension of the dataframe (rows and columns)

names(present)
# show the names of variables (column names)

present$boys
# show a vector containing data of one variable

plot(x=present$year, y=present$girls)
# plot between a numeric data and a categorical data (two variables)

plot(x = present$year, y = present$girls, type = "l")
# plot line graph instead of scatterplot

present$boys/present$girls
# data manipulation of two columns, generate a new numeric vector

present$boys > present$girls
# also can be used to generate a logical vector

