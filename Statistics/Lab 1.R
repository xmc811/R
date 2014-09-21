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

