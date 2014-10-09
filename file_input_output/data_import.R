
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
# this can install the XML package






