makeCacheMatrix <- function(x) ##This functions caches the inverse of the matrix if it does not exist and redefines it if it already exisists
{
  m <- NULL ##Setting m to nothing
  set = function(y) 
  {
    x <<- y ##Setting x as a global variable 
    m <<- NULL ##Setting m as a global variable
  }
  get <- function() x
  setInverse <- function(Inverse) m <<- Inverse ##sets global variable m as Inverse 
  getInverse <- function() m ##defines getInverse as m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse) ##creates a list of functions that will be used/callled between the two functions 
}
