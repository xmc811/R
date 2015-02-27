
setwd("C:/Users/HGSC/Desktop/Uyg/")


# the function to calculate evenness

evenness <- function(depth) {
       
       x <- read.table(depth)
       
       coverage <- x[[6]]
       
       rm (x)
       
       mean.cov <- as.integer(mean(coverage))
       
       total.cov <- sum(coverage)
       
       for (i in 1:length(coverage)) {
              
              if (coverage[i] > mean.cov) {
                     
                     coverage[i] <- mean.cov
                     
              }
              
       }
       
       even.total.cov <- sum(coverage)
       
       evenness <- even.total.cov/total.cov
       
       evenness
       
       
}

BatchEvenness <- function(filepath) {
       
       depth.files <- list.files( path = filepath, pattern = "*depth")
       
       
       
       result <- double()
       
       for (k in 1:length(depth.files)) {
       
              result[k] <- evenness(depth.files[k])
              
       }
       
       report <- cbind(depth.files, result)
       
       write.table(report, "evenness.report.txt", sep="\t")
       
}


BatchEvenness(getwd())
