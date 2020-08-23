## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makecachematrix<- function(x=matrix()){
  q<-NULL             #initiating inverse function
  set<- function(z){
    q<<-NULL
  }
  get<- function()x                 #function to get x
        setinverse<- function(inverse)q<<- inverse
  getinverse<- function()q              #function to get inverse of matrix
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}

cachesolve<- function(x,...){   #obtatin cachedata
  q<- x$getinverse()
  if (!is.null(q)){          #check if inverse is NULL
    message("getting cached data")
    return(q)     #return inverse value
  }
  data<- x$get()
  q<- solve(data,...)
  x$setinverse(q)     #solves the inverse value
  q
}
