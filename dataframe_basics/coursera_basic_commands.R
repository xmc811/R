## 1st dataset

source("http://www.openintro.org/stat/data/present.R")
# load the source file for study

present
# show the general structure of the data

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



## 2nd dataset

source("http://www.openintro.org/stat/data/cdc.R")

cdc

head(cdc)
# show the first 6 records

tail(cdc)
# show the last 6 records

summary(cdc$weight)
# summary of a numeric variable (give the centerness of data)

mean(cdc$weight)
var(cdc$weight)
median(cdc$weight)
# give some basic statistics of one variable

table(cdc$smoke100)
# summary of a categorical varible

barplot(table(cdc$smoke100))
# plot the bar graph of a categorical variable

gender_smokers <- table(cdc$gender, cdc$smoke100)
mosaicplot(gender_smokers)
# summary of two categorical varibles and plot the 2*2 table

cdc[1:10, 6]
cdc[1:10, ]
cdc$gender == "m"
cdc$age > 30
#some basic subsetting expressions

m_or_over30 <- subset(cdc, cdc$gender == "m" | cdc$age > 30)
#logical subsetting with multiple conditions

boxplot(cdc$height)
#box plot of data

bmi = (cdc$weight/cdc$height^2) * 703
boxplot(bmi ~ cdc$genhlth)
#comprehensive plotting