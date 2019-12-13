## Put comments here that give an overall description of what your
## functions do

## This function is used to create a special matrix object to cache its inverse

makeCacheMatrix <- function(x = matrix()) {

	m<-NULL
	set <- function(y) {
                x <<- y
                m <<- NULL
        }
	get <- function() x
      setinverse <- function(inverse) m <<- inverse
      getinverse <- function() m

}


## This function computes the inverse of the matrix and stores it in cache if not present.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'


	  m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m		


}
