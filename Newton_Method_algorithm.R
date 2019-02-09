f <- function(x){x**4 - 4*x + 1}
df <- function(x){4*x**3 - 4}
p0 <- 0
iter <- 0
for(i in 1:200){
  p = p0 - (f(p0)/df(p0))
  err1 = abs(p)
  err2 = abs(p-p0)
  iter = iter+1
  if(err1 >= 10**(-8) & err2 >= 10**(-8)){
    p0 = p
    print(p)
  }
}


