## Put comments here that give an overall description of what your
## functions do

## This function is used to create a special matrix object to cache its inverse

makeCacheMatrix <- function(x = matrix()) {

	m<-NULL
	## This function is to assign the value of y to x and value in 
	##  x persists for same oject called more than single time.
	set <- function(y) {
                x <<- y
                m <<- NULL
        }
	get <- function() x
      setinverse <- function(inverse) m <<- inverse
      getinverse <- function() m
      ## Creates a list which contains the value set, get, and the calculated inverse using solve().	
      list(set = set, get = get,
             setmean = setinverse,
             getmean = getinverse)	
}


## This function computes the inverse of the matrix and stores it in cache if not present.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

	  ## This code line calls the function named getinverse() of the of object x using the $ operator.
	  m <- x$getinverse()
	## This code line checks if the cache is empty or not.
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        ## The solve() function calculates the inverse of the matrix stored in the variable "data"
	m <- solve(data, ...)
	## This code line sets the value of the inverse to the cache by calling function setinverse() of x 
	## by its name using the $ operator
        x$setinverse(m)
        m		


}
