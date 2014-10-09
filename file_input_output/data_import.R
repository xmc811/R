
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