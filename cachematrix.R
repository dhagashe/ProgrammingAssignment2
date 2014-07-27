## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
	
	## get value of matrix
        get <- function() x

	## set inverse of matrix

        setinv <- function(solve) m <<- solve

	## get inverse of matrix

        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}



## Write a short comment describing this function

cachesolve <- function(x = matrix(), ...) {
	
	## get inverse of matrix	

        m <- x$getinv()

	## check if matrix returned exists	
        if(!is.null(m)) {
	
	## if available, then print message
                message("getting cached data")
                return(m)
        }

	## get a matrix value
        matrix <- x$get()

	## call solve function to create inverse of matrix		
        m <- solve(matrix, ...)

	## cache the value
        x$setinv(m)
	
	## return matrix m
        m
} 
