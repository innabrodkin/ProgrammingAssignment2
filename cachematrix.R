## The folowing 2 functions create an object that can be used to cache the matrix
## and it's inverse in memory

## makeMatrix 
##
## this function takes in invertible matrix and creates an object with 
## the following 4 functions :
## 1. set() - caches the contents of the function & resets the inverse to NULL
## 2. get() - returns the cached matrix
## 3. setinverse() - caches the inverse matrix
## 4. getinverse() - returns the cached inverse matrix or NULL if it's not available yet

makeMatrix <- function(x = matrix()) {
    inv <- NULL 
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) inv <<- solve
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## cacheSolve 
##
## this function takes in an invertible matrix, compute the inverse, than both 
## caches the inverse and returns it to the caller

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

    cachedInverse <- x$getinverse()
    if(!is.null(cachedInverse)) {
            return(xInverse)
    }
    cachedMatrix <- x$get()
    cachedInverse <- solve(cachedMatrix)
    x$setinverse(cachedInverse)
    cachedInverse
}
