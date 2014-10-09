
# this code contains several functions of data importing, downloading

getwd()
setwd("C:/Users/HGSC/Downloads/Rcourse")

if (!file.exists("GetData")){
       dir.create("GetData")
}


# create a directory in the working directory if there is not

list.files()
# this is like ls command in shell script




fileUrl<-c("https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD")

download.file(fileUrl,destfile="./GetData/camara.csv")


list.files("./GetData/")

# destfile defines the destination path and filename
# http doesn't require specifying method. https requires curl method in Mac synstem

dateDownloaded<-date()

# this is used to record the download time


camaraData<- read.table("./GetData/camara.csv",sep=",",header=TRUE)
# this is the most robust and flexible function to be used for data importing
# rather than read.csv
# however in csv files, it is delimited by comma instead of tab
# if we don't specify the separation, error will occur
# here we use comma

# if using read.csv, it automatically sets seq to be comma and header to be TRUE

# there are also some important parameters to choose

# nrows and skip: choose or skip first n rows
# na.strings: set a series of string to be NA, including black ("")
# quote is used to eliminate quoting problems (some strange behaviours in R)

xlsxUrl<-c("https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD")

download.file(xlsxUrl,destfile="./GetData/camara.xlsx")

datexlsxDownloaded<-date()




install.packages("xlsx", repos="http://cran.stat.auckland.ac.nz")
# this can be used for installing xlsx package


libary(xlsx)

read.xlsx("./GetData/camara.csv",sheetIndex=1,header=TRUE)
# this function is used to read data from xlsx, contains some useful parameters

install.packages('XML')
library(XML)
# this can install the XML package

xmlUrl<-c("http://www.w3schools.com/xml/simple.xml")


doc<-xmlTreeParse(xmlUrl,useInternal=TRUE)
rootNode<-xmlRoot(doc)
## accessing the top-level XMLNode object 

xmlName(rootNode)
## accessing the name of the node
names(rootNode)
## accessing all the nested elements in the root node

rootNode[[1]]
# accessing the first element of rootNode
# it's similar to accessing the element of a list using double bracets

rootNode[[1]][[1]]
# first element of first element of the rootNode
# rootNode -> food -> name


xmlSApply(rootNode,xmlValue)
# get the values of all the sub-nodes of XML
# similar to lapply in R




xpathSApply(rootNode,"//name",xmlValue)

# to use this function, we need to know about XPath language
# access all the nodes that corresponds with title name and get the value

xpathSApply(rootNode,"//price",xmlValue)



htmlUrl<-c("http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens")
library(XML)
htmlDoc<-htmlTreeParse(htmlUrl,useInternal=TRUE)
# useInternal should be TRUE to get all the nodes inside the file



scores<-xpathSApply(htmlDoc,"//li[@class='score']",xmlValue)
teams<-xpathSApply(htmlDoc,"//li[@class='team-name']",xmlValue)
# accessing two types of objects in the XML data








install.packages("rjson")
library(rjson)


library(jsonlite)
# JSON is another form of data storage of webpages

jsonUrl<-"http://kassiesa.home.xs4all.nl/bert/uefa/data/method4/match2015/data.json"

jsonData <- fromJSON(jsonUrl)






install.packages("data.table")
library(data.table)

DT <- data.table(x=letters,y=rnorm(26),z=rnorm(26,sd=2))

DT[2,]
DT[DT$y>=0]
# the subsetting methods are similar to dataframe

DT[c(2,3)]
# data.table has a different subset rule when only using one index number
# it returns rows instead of columns

DT[,list(sum(y),mean(z))]
# in data.table indexing, a comma means separation of expressions

DT[,w:=z*y]
# directly add new columns by expressions, very convenient


DT2 <- DT
DT[,y:=y+2]
# if we do some data manipulation in DT after copying DT to DT2, the data in DT2 will also be changed
# we should be careful about this


DT[,u:={tmp=y-z;u=tmp*w}]
# the expression can also be used to perform complex manipulations like functions with multiple steps
# which is a very handy function of data.table
# also logical evaluations


setkey(DT,x)
# this allows datatable to do search and match with key features (like SQL)
# this function will be very handy in merging datatables with different column names






