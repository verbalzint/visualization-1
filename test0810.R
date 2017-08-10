a <- c(1, 1)

1:10

afun <- function(x, y)
{
  v <- x + y
  return(v)
}

v <- 0
for (i in 1:100)
{
  v <- i + v
}
print(v)

