## The second programming assignment is to write R function
## that is able to cache potentially time-consuming computations.
## Specifically, you will take advantage of the scoping 
## rules of the R language and how they can be 
## manipulated to preserve state inside of an R object

## This function creates a special "matrix" object
## that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  # Initialize the inverse property
  i <- NULL
  
  ## method to set the matrix
  set <- function(matrix) {
    m <<- matrix
    i <<- NULL
  }
  
  ## get the matrix
  get <- function() m
  
  ## set the inverse of the matrix
  setInverse <- function(inverse) i <<- inverse
  
  ## get the inverse of matrix
  getInverse <- function() i
  
  # return a list of methods
  list(set=set, get=get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## This function computes the inverse of the special 
## "matrix" returned by the makeCacheMatrix above.
## If the inverse has already been calculated (and 
## the matrix has not changed), then the cachesolve
## should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
  
  ## return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  
  ## return the inverse if its already set
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  ## get the matrix from our object
  data <- x$get()
  
  ## calculate the inverse using matrix multiplication
  m <- solve(data) %*% data
  
  ## set the inverse to the object
  x$setInverse(m)
  
  ## print the matrix
  m
}
