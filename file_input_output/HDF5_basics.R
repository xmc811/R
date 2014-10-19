
### HDF5 bascis


source("http://bioconductor.org/biocLite.R")

biocLite("rhdf5")

library(rhdf5)

## install the rhdf5 package


created <- h5createFile("example.h5")
# create an hdf5 file


created <- h5createGroup("example.h5","foo")
created <- h5createGroup("example.h5","baa")
created <- h5createGroup("example.h5","foo/foobaa")
# create directories and files


h5ls("example.h5")
# show the list of files

## output:
## group   name     otype dclass dim
## 0     /    baa H5I_GROUP           
## 1     /    foo H5I_GROUP           
## 2  /foo foobaa H5I_GROUP   



A <- matrix(1:10,nrow=5,ncol=2)
B <- array(1:75,dim=c(5,5,3))
# construct some dataset


h5write(A,"example.h5","foo/A")
h5write(B,"example.h5","foo/foobaa/B")
# write the dataset into the hdf5 file directories


h5ls("example.h5")
# look at the data


## output:
## group   name       otype  dclass       dim
## 0           /    baa   H5I_GROUP                  
## 1           /    foo   H5I_GROUP                  
## 2        /foo      A H5I_DATASET INTEGER     5 x 2
## 3        /foo foobaa   H5I_GROUP                  
## 4 /foo/foobaa      B H5I_DATASET INTEGER 5 x 5 x 3

readA <- h5read("example.h5","foo/A")
# read the hdf5 object

h5write(c(11,12,13),"example.h5","foo/A",index=list(1:3,1))





