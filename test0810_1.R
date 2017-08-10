# NA를 식별하는 함수
x <- c(1, 2, 3, NA, 5, NA)
is.na(x)
!is.na(x)

# which : 조건을 만족시키는 위치 출력
which(z>3)
z[which(z>3)]

# any : 조건을 만족하는 것이 하나라도 있는가?
x <- c(3, 1, 4, 1)
any(x>5)

# %in% : 뒤의 벡터안에 존재하는가?
3%in%c(2, 1, 4)
x <- c(3, 1, 4, 1)
x%in%c(2, 1, 4)

# match x 가 벡터안에 포함된다면 위치가 어디인가?
match(3, c(2, 1, 4))
match(4, c(2, 1, 4))
match(c(1, 4), c(2, 1, 4))

# data.frame
kids <- c('jack', 'jill')
ages <- c(12, 10)
d <- data.frame(kids, ages, stringsAsFactors = FALSE)
d
str(d)
names(d)
d$kids
class(d)
dd <- unclass(d)
dd
class(dd)

pdf('./Rbasic/a.pdf')
hist(1:10)
dev.off()

install.packages('xlsx')
library(xlsx)
A <- read.xlsx('co2.xlsx', header = TRUE, sheetIndex = 1, stringsAsFactors = F)
head(A)
install.packages('rgl')
library(rgl)

# 패키지가 존재하는지 여부를 알려준다.
require(rgl)
if ( !require(glmnet) )
{
  install.packages('glmnet')
}
library(glmnet)

A = data.frame(x1 = rep(0, 10), x2 = rep('b', 10))
B = data.frame(x3 = rep(1, 10), x4 = rep('d', 10))
AB <- cbind(A, B)
AB
AB <- rbind(A, B) # 아래로 데이터를 추가 하려면 이름이 동일해야한다.
A = data.frame(x1 = rep(0, 10), x2 = rep('b', 10))
B = data.frame(x1 = rep(1, 10), x2 = rep('d', 10))
AB <- rbind(A, B)
AB


# Plotting point

class(mtcars)
str(mtcars)
mtcars$mpg
attach(mtcars) # 가능하면 사용안하는 것이 좋다.
mpg
ls(mtcars)
detach(mtcars)

plot(mpg ~ ., data = mtcars)
plot(mpg ~ disp, data = mtcars)
plot(mpg ~ log(disp), data = mtcars) # 선형적인 관계가 설명하기 쉽다.
