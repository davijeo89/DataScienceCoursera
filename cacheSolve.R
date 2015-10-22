cacheSolve <- function(x) #this function solves the inverse of a matrix if it does not already exisist. 
{
  m <- x$getInverse() ##Grabbing m from makeCacheMatrix function
  if(!is.null(m)) ##if m already exisits it will print the statement and then return the value of m
  {
    message("getting cached data")
    return(m)
  }
  data <- x$get()##grapping the matrix from makeCacheMatrix
  #if (det(x)==0) ##You can only take the inverse when the matrix's determinant is not equal to 0
  #{
   # message("Eror, determinant is equal to 0 cannot take the invese")
  #}
  #else ##compute the inverse of matrix
  #{
  m <- solve(data)
  x$setInverse(m)
  #}
  m ##return m, the inverse
}