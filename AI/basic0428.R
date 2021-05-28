# Ctrl + Enter : 1라인 또는 선택영역실행
# ctrl + Alt + R : 전체 실행
# ctrl + alt + B : 처음에서 현재 행까지 실행
# ctrl + alt + E : 현재 행에서 마지막까지 실행
# 주석처리 : Ctrl + shift + C

n = 100
n <- 90
n <<- 80
n
print(n)
sprintf("점수: %d", n)
cat("점수: ", n)

x <- 10
y <- 20
z <- x * y
cat('x * y의 결과는', z, '입니다.\n')
sprintf('%d * %d = %d', x, y, z)

x <- 3.5
x
print(x)
sprintf('x:%.2f', x)

y <- 'string'
print(y)
y <- "문자열"
y

z <- FALSE # (FALSE, F, TRUE, T)
z <- TRUE
z

10 + 3
10 - 5
2 * 3
4 / 3
4 %/% 3 # 정수값
4 %% 3  # 나머지
2^3     # 거듭제곱


# data 입력
print('숫자를 입력하세요')
num <- scan()
num

print('문자열을 입력하세요')
str <- scan(what='')
str

df <- data.frame() # data frame
df <- edit(df)
df

x <- 8
typeof(x)
if (x > 0 && x < 10) {
  print('1~10 사이의 숫자입니다.')
} else {
  print('1~10 사이의 숫자가 아닙니다.')
}


if (x == 1 || x == 10) {
  print('1이거나 10입니다.')
} else if (x != 8) {
  print('8이 아닙니다.')
} else {
  sprintf('정보는 %d 입니다.', x)
}

num <- 30
typeof(num)
if (is.integer(num)) {
  print('x는 int')
} else {
  print('x는 double')
}

# vector
data <- c('홍길동', '김길동', 
          '박길동', '이길동')
if ('박길동' %in% data) {
  print('박길동이 존재합니다.')
} else {
  print('박길동이 없습니다.')
}

i <- 0
while (i<10) {
  i <- i + 1
  print(i)
}

sum <- 0
num <- c(1, 4, 7)
for (i in num) {
  print(sum <- sum + i)
}

sum <- 0
for (i in 1:10) {
  if (i %% 2 == 0) {
    next
  }
  
  if (i == 7) {
    break
  }
  sum <- sum + i
}
print(sum)

index <- seq(1, 10, by=2)
for (i in index) {
  print(i)
}

func1 <- function(start, end) {
  sum <- 0
  for (i in start:end) {
    sum <- sum + i
  }
  return(sum)
}
sprintf('합계: %d', func1(1, 10))

func2 <- function(num1, num2, op) {
  if (op == '+') {
    return (num1 + num2)
  } else {
    return (num1 - num2)
  }
}

func2_2 <- function(num1, num2) {
  return (num1+num2)
}

func2_1 <- function(...) {
  res <- func2(...)
  #val <- func2_2(...)
  return (res + val)
}
func2_1(10, 5, '+')
func2_1(20, 10, '-')

func_var <- function(...) {
  var <- c(...)
  for (i in var) {
    cat(i, '\t')
  }
}
func_var(1, 2)
func_var(1, 2, 3)
func_var(1, 2, 3, 4, 100)

x <- 3
func1 <- function() {
  x <- 5
  print(x)
}
func1()
print(x)

func2 <- function() {
  x <<- 100
  print(x)
}
func2()
print(x)

# 클로저
add_x <- function(x) {
  function(y) {
    return (x + y)
  }
}

addx <- add_x(3)
addx(2)

runif(5, min=0, max=1)

coinTest <- function(n) {
  r <- runif(n, min=0, max=1)
  res <- c()
  for (i in 1:n) {
    if (r[i] <= 0.5) {
      res[i] <- 0
    }
    else {
      res[i] <- 1
    }
  }
  return(res)
}

res <- coinTest(1)
res
hist(res)

monteTest <- function(n) {
  cnt <- 0
  for (i in 1:n) {
    cnt <- cnt + coinTest(1)
  }
  result <- cnt / n
  return(result)
}

monteTest(2)
monteTest(10000)
monteTest(1000000)












