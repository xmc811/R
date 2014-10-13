install.packages("RMySQL")
library(RMySQL)
# install and load the package needed for extracting MySQL data.


ucscDB <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
# connect databases with one particular host


result <- dbGetQuery(ucscDB,"show databases;"); dbDisconnect(ucscDB);
# list all the databases connected
# the dbGetQuery command pass the arguments to SQL language to execute

## remember to close the connection once if we will not use that

hg19 <- dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")
# with db argument, we can access a specific database from our connection
# here we use hg19

allTables <- dbListTables(hg19)
# list the table names of that database



dbListFields(hg19,"affyU133Plus2")
# check out one table from hg19 database



dbGetQuery(hg19,"select count(*) from affyU133Plus2")
# peform query of that specific database


affyData <- dbReadTable(hg19,"affyU133Plus2")
# read in the table as R dataframe
# thus allowing furthur manipulations

### however, in most cases, one whole table is too big for manipulation in R
### we need to use specific commands for extracting a subset of data

query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query)
# dbSendQuery is uses to extract subset of table
# fetch to get the dataframe-form result

quantile(affyMis$misMatches)


affyMisSmall <- fetch(query,n=20); dbClearResult(query)
# n is to define a specific number of resuls to avoid load large amount of data
# we need to clear the result of data quering



