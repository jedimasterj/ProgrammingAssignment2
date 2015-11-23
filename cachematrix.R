
## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
## This is broken down into a list of the following 4 functions:

## 1. set the value of the matrix  - this is used when we want to update the vector to a different environment.
## 2. get the value of the matrix - return the value of the vector (that has already been set)
## 3. invert and set the (inverted) matrix  - store the calculated value in the main function 'makeCacheMatrix'
## 4. get the (inverted) matrix - return the calculated value in the main function 'makeCacheMatrix'

## In the context of this assignment, these functions will be called upon when needed by the 'cacheSolve' function
## to avoid duplicating previous calculations to invert a matrix.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  
  ## function 1 - set the value of the matrix (note the '<<' operator meaning it is returned to a different environment)
  set <- function(y){
      x <<- y
      m <<-NULL }

  ## function 2 - get the value of the matrix
  get <- function() x
  
  ## function 3 - invert and set the value of the matrix
  invertmatrix <- function(solve)m <<- solve() 
  
  ## function 4 - get the inverted value of the matrix 
  getmatrix <- function() m
  
  ##store the 4 created functions in a list
  list(set=set, get=get, invertmatrix=invertmatrix, getmatrix=getmatrix)
}





## Function 'cacheSolve'cacheSolve: This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix 
## has not changed), then the cachesolve should retrieve the inverse from the cache.

## The logic followed in this function is basically a single IF () ELSE () statement.
## Verify the value m (wich was stored previously) exists and is not NULL. 
## If it exists, return a message and the value m. The context in this assignment, is that it would 
## skip the computation needed to invert the matrix, thereby saving time and being more efficient.
## Otherwise (i.e. If it doesn't exist or it is null) then solve the matrix and store it.

cacheSolve <- function(x, ...) { ## placeholder for parametes

    ## If m exists, and is not NULL return a message and the value m.
    m <- x$getmatrix()
    if (!is.null(m)) {
        message("retrieving existing matrix")
        return(m)
    }
    
    ## Otherwise, get the matrix, invert it, and then set the inverted matrix (in essence 'caching' it)
    else{
        matrix <- x$get()
        m <- solve(matrix, ...)
        x$invertmatrix(m)
        m  
    }
    
}
