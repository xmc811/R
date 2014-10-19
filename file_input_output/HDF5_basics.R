
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

