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

# 워크스페이스의 객제 지우기
rm(list = ls())
# 메모리 정리
gc()
# pdf 그래픽 디바이스 열기(파일 생성)
pdf('xh.pdf')
# 히스토그램 그리기
hist(rnorm(10000))
# 그래픽 디바이스 닫기(파일로 저장)
dev.off()


# 벡터
x <- c(1,2,4)
x
xx <- c(x, x, 8)
xx

2.1:10

x <- 5:8
x1 <- x[1:3]
x2 <- c(x1[1:3], 168, x[4])
x2

length(x)

# 객체지향적 언어가 아니다.

c(5, 0, -4) + c(3, 1)
c(1, 5, 0, -4) + c(3, 1)


# :은 사칙연산보다 먼저 계산된다.
1:10*2
1:(10*2)

# 잘알아둬야하는 seq함수
y <- seq(from = 12, to = 30, by = 2)
y
x <- seq(12, 30, length = 19) # 19로 균등 분할
x
x <- seq(12, 30, length = 20) # 19로 균등 분할
x

x <- rep(8, 4)
x
x <- rep(c(2,5,9), 3)
x
x <- rep(c(2,5,9), each = 3)
x
x <- rep(c(2,5,9), c(1, 8, 4))
x

x <- 8
#몫 
5 %/% 2
#나머지
5 %% 3

# NA 결측값
x <- c(88, 12, NA, 168, 13)
mean(x)
mean(x, na.rm = TRUE)

# NULL 이름만 있고 값은 없는 상태, 변수를 초기화 시킬 때 유용하다.
x <- NULL
x <- c(x, 2)
x

z <- c(5, 2, -3, 8)
w <- z[z>0]
w

# 조건을 만족시키는 위치 출력
which(z>3)
z[which(z>3)]
