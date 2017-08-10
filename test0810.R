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
