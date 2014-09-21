#1st function adding three numbers
add3<-function(a,b,c){
  a+b+c
}

#2nd function using logical expressions
abmed<-function(x){
  x[x>=median(x)]
}


#3rd function manipulating dataframes
colmean<-function(x){
  for (i in 1:ncol(x)){
    print(mean(x[[i]],na.rm=TRUE))
  }
}