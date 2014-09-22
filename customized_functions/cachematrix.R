## This is a function to cache the already-calculated value to avoid repeated calculations

## This is a homework of R course in Coursera

## Put comments here that give an overall description of what your
## functions do

## The functions here are used to check whether the inverse of a matrix has been calculated or not
## to avoid unnecessary calculations and make the running faster

## Write a short comment describing this function

## makeCacheMatrix() is a list of functions that perform the different operations to
## obtain, store and print cached data

makeCacheMatrix <- function(x = matrix()) {
       m <- NULL                           #set the placeholder to store inverse
       set <- function(y) {
              x <<- y
              m <<- NULL
       }                                   #used to store a new matrix and perform calculations
       get <- function() x
       setSolve <- function(Inv) m <<- Inv
       getSolve <- function() m            #retrieve the stored result and return it
       list(set = set, get = get,
            setSolve = setSolve,
            getSolve = getSolve)

}


## Write a short comment describing this function

## cacheSolve is a function that check whether the inverse has already been calculated
## if so, it skips the calculation and directly shows the result
## if not, it will calculate the result and show it
## cacheSolve will call the functions listed in makeCacheMatrix to perform specific operations

cacheSolve <- function(x, ...) {
       m <- x$getSolve()
       if(!is.null(m)) {                   #check if the inverse has been calculated before
              message("getting cached data")
              return(m)                    #if calculated before, return that and make an alert
       }
       data <- x$get()                     #if not, initiate a new calculation
       m <- solve(data, ...)
       x$setSolve(m)
       m
        ## Return a matrix that is the inverse of 'x'
}
