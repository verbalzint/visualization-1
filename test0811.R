head(mtcars)

lm.fit <- lm(mpg ~ disp, data = mtcars)
lm.fit 
class(lm.fit)
lm.fit1 <- unclass(lm.fit)
class(lm.fit1)
class(lm.fit1) <- 'mylm' #mylm이라는 이름을 가진 list로 지
class(lm.fit1)

plot(lm.fit)
plot(lm.fit1)
class(lm.fit1) <- 'lm'
plot(lm.fit1)

plot(hp ~ disp, data = mtcars)

set.seed(1)
x <- rnorm(100)
y <- 2 + 2 * x + rnorm(100)
plot(x, y, main = 'plot (x - y)')

set.seed(2)
x <- rnorm(100)
y <- x ^ 2 + 2 * x + rnorm(100)
plot(x, y, main = 'plot (x - y)')

# 그래프의 종류 바꾸기 type
x <- seq(-2, 2, length = 10)
y <- x ^ 2
plot(x, y, main = 'plot (x - y)', type = 'b')

# 선의 모양 바꾸기 lty
plot(x, y, main = 'plot (x - y)', type = 'b', lty = 2)

# 점의 모양 바꾸기  pch
plot(x, y, main = 'plot (x - y)', type = 'b', lty = 2, pch = 10)
plot(x = 1: 25, y = rep(0, 25), pch = 1:25)
plot(x = rep(1:5, each = 5), y = rep(1:5, 5), pch = 1:25)
a <- rep(1, 25)
a[(1:25)%%3 == 0] <- 3
plot(x = 1: 25, y = rep(0, 25), pch = a)
a <- 1:25
plot(x = 1: 25, y = rep(0, 25), pch = if(a%%3 == 0){3}else{1})

# 점과 선의 색 바꾸기 col
plot(x, y, main = 'plot (x - y)', type = 'b', lty = 2, pch = 10, col = 'darkkhaki')
colors()[1:100]

# x, y축에 label 붙이기 xlab, ylab
plot(x, y, main = 'plot (x - y)', type = 'b', xlab = 'XX', ylab = 'yy')

# 좌표축의 범위 설정하기 xlim, ylim
plot(x, y, main = 'plot (x - y)', type = 'b', xlab = 'XX', ylab = 'yy', xlim = c(-1, 1), ylim = c(0, 1))


# 여러 변수 간의 산점도 그리기 pairs
pairs(~mpg+disp+drat+wt, data = mtcars, main = 'Simple Scatterplot Matrix')


# Add line
x <- rnorm(100)
y <- x ^ 2 + 2 * x + rnorm(100)
plot(x, y, main = 'scatter plot', pch = 20)
abline(a = 1, b = 2, col = 'red')
abline(v = 1, col = 'blue')
abline(h = 1, col = 'green')

# points
plot(x = 1, y = 1, type = 'n', xlim = c(0, 10), ylim = c(0, 5))# type = 'n' : none 관측이 안되었다.
x = 0:10
set.seed(3)
y = rpois(length(x), lambda = 1) # 포아송 분포, 0을 포함한 양의 정수
points(x, y, col = 'blue', type = 's')
points(x, y, col = 'red', type = 'l')


# lines
plot(0, 0, type = 'n', xlim = c(-2, 2), ylim = c(-2, 2))
x = c(-2, 1, 0, 1, 0)
y = c(0, -1, 2, -2, 1)
lines(x, y)


plot(0, 0, type = 'n', xlim = c(1, 10), ylim = c(0, 2))
x = seq(1, 10, by = 1)
abline(v = x, lty = 1:length(x))



# legend
z = sort(rnorm(100))
x = seq(1, 5, by = 1)
y1 = 2 + x + rnorm(100)
plot(z, y1, col = 'blue', pch = 3)
points(z, y1/2, col = 'red', pch = 19)
legend('topright', c('pch_3', 'pch_19'), col = c('blue', 'red'), pch = c(3, 19))
legend('bottomright', c('pch_3', 'pch_19'), col = c('blue', 'red'), pch = c(3, 19))
?legend



#par()
par(mfrow = c(2, 2), bg = 'gray50', col = 'white', col.main = 'lightblue', col.axis = 'yellow', col.lab = 'lightgreen')
x <- rnorm(100)
y <- 2 + 2 * x + rnorm(100)
plot(x, y, main = 'plot (x-y)', pch = 20 )
y <- 2 + x + rnorm(100)
plot(x, y, main = 'plot (x-y)')
y <- 2 * x + rnorm(100)
plot(x, y, main = 'plot (x-y)', col.main = 'black' )
y <- 2 + x ^ 2 + rnorm(100)
plot(x, y, main = 'plot (x-y)', col.axis = 'white' )



# visualization of k-nearest
par(mfrow = c(1, 1), bg = 'gray50', col = 'white', col.axis = 'white', col.lab = 'white')
set.seed(4)
x <- sort(rnorm(100))
y <- 3 + x ^ 2 + rnorm(100)
plot(x, y, pch = 20 )
fit <- lm(y~x)
fit$coefficient
plot(x, y, pch = 20)
abline(a = fit$coefficient[1], b = fit$coefficient[2], col = 'blue')
yTrueMean <- 3 + x ^ 2
lines(x, yTrueMean, lty = 2, col = 'black')

# k-nearest
install.packages('FNN')
library(FNN)
set.seed(4)
x <- sort(rnorm(100))
knnx.index(x, 0, k = 10) # 0 주변에서 가장 가까운 값의 index, matrix 형태이다.
idx <- c(knnx.index(x, 0, k = 10))
idx # Nk(x)
yhat <- mean(y[idx])
yhat
abline(h = 3.144473, v = 0)

x <- sort(rnorm(100))
y <- 3 + x ^ 2 + rnorm(100)
plot(x, y, pch = 20, col = 'white', col.axis = 'white', col.lab = 'white')
color.name = c('blue', 'green', 'red')
find.number = c(-1, 0, 1)
for (i in c(1, 2, 3))
{
  eval.point = find.number[i]
  idx <- c(knnx.index(x, eval.point, k = 10))
  points(x[idx], y[idx], col = color.name[i], pch = 20)
  abline(h = mean(y[idx]), v = eval.point, col = color.name[i])
  text(eval.point, mean(y[idx]) - 1, labels = round(mean(y[idx]), 2))
}


# 3D plotting
install.packages('rgl')
library(rgl)
attach(mtcars)
plot3d(wt, disp, mpg, col = 'red', size = 3)

mypal = c('blue', 'red', 'green')
class(mtcars$cyl)
a <- factor(mtcars$cyl)
mypal[a[1]]
mypal[factor(mtcars$cyl)]
plot3d(wt, disp, mpg, col = mypal[factor(mtcars$cyl)], size = 10)

library(rgl)
z <- 2 * volcano
x <- 10 * (1:nrow(z))
y <- 10 * (1:ncol(z))
par(bg = 'slategray')
persp(x, y, z, theta = 135, phi = 30, col ='green3', scale = FALSE, ltheta = -120, shade = 0.75, border = NA, box = FALSE)

persp3d(x, y, z, col = "green3")





