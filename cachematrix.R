getw## Put comments here that give an overall description of what your
## functions do

## This is whre the new function will be written

makeCacheMatrix <- function(x = matrix()) {
  
  m<-NULL
  set<-function(y){
      x<<-y
      m<<-NULL    ## set defaults
  }

  get<-function() x
  setmatrix<-function(solve) m<<- solve()## Call the solve function
  getmatrix<-function() m
  list(set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) { ## placeholder for parametes
        ## Return a matrix that is the inverse of 'x'
        ## This is where the new functin will be written
        ## take the parameters in, set defaults, and write the function.
  
    m<-x$getmatrix()
    if(!is.null(m)){
        message("getting data ")
        return(m)
    }
    matrix<-x$get()
    m<-solve(matrix, ...)
    x$setmatrix(m)
    m
}
