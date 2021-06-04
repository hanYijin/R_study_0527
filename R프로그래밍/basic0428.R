# ctrl + Enter : 1라인 또는 선택영역 실행 
# ctrl + Alt + R : 전체 실행
# ctrl + Alt + B : 처음에서 현재 행까지 실행
# ctrl + Alt + E : 현재행에서 마지막까지 실행
# 주석처리 : ctrl + shift + C
# 변수 값 할당 방법 3가지
n = 100 #1
n <- 90 #2
n <<-80 #3
# 변수 출력하기
n
print(n)
#출력방법
#sprintf 와 Cat 출력 형태 차이점
sprintf("점수: %d", n)
cat("점수: ", n)

x <- 10
y <- 20
z <- x * y
cat('x * y의 결과는 ', z, '입니다.\n')
sprintf('%d * %d = %d', x, y, z)
#실수형
x<-3.5
x
print(x)
sprintf('x: %f', x)

#문자열
y <-'String'
print(y)
y <- "문자열"
y

#논리형
#(FALSE, F, TRUE, T)
z <- FALSE 
z <- TRUE
z

10+3
10-5
2*3
4/3
4 %/% 3 #정수값 소수점 버림
4 %% 3 #나머지 연산자
2^3 #거듭제곱 연산자

#data 입력
print('숫자를 입력하세요')
#scan(): 숫자를 입력받는 표준입력함수
num <- scan()
num
#R의 배열 인덱스 값은 1부터 시작한다!

#문자열 입력함수
print('문자열을 입력하세요.')
str <- scan(what='')
str
#데이터 프레임
df <- data.frame()
df <- edit(df)
df

#변수의 값이 할당되어야 변수의 자료형이 결정되어진다.

#제어문 & 논리문
x <- 8
if(x > 0 && x < 10){
  print('1~10 사이의 숫자입니다.')
}else{
  print('1~10 사이의 숫자가 아닙니다.')
}

if(x==1 || x==10){
  print('1이거나 10 입니다.')
}else if(x!=8){
  print('8이 아닙니다.')
}else{
  sprintf('정보는 %d 입니다.',x)
}

num <- 30L
if(is.integer(num)){
  print('x는 숫자')
}else{
  print('x는 문자열')
}
#vector: 백터는 배열과 동일한 개념
#백터 배열과 같이 여러 개의 자료를 저장할 수 있는 1차원의 선형 자료구조 
data <- c('제니','리사','로제','지수')
if('로제' %in% data){
  print('로제는 블랙핑크 멤버입니다')
}else{
  print('로제는 없습니다.')
}
#스칼라 변수:한 개의 값만 갖는 변수 
#데이터 프레임

#반복문 while
i <- 0
while (i<10){
  i<- i+1
  print(i)
}

#향상된 for문
sum <-0
for(i in c(1,4,7)){
  print(sum<-sum+i)
}

sum<-0
for(i in 1:10){
  if(i %% 2 == 0){
    next #contine와 동일
  }
  if(i == 7){
    break
  }
  sum <-sum + i
}
print(sum)

index <- seq(1, 10, by =2) # num [1:5] 1 3 5 7 9
for(i in index){
  print(i)
}

#사용자 정의 함수
#c언어의 함수 포인터와 동일한 개념
func1 <- function(start, end){
  sum <-0
  for( i in start:end){
    sum <- sum + i
  }
  return (sum)
}
sprintf('합계: %d', func1(1,10))

func2 <- function(num1, num2, op){
  if(op=='+'){
    return(num1+num2)
  }else{
    return (num1- num2)
  }
}

func2_2 <- function(num1, num2){
  return(num1+num2)
}
func2_1<-function(...){#가변인자
  res <- func2(...)
  #val <- func2_2(...)
  return(res+val)
}
func2_1(10,5,"+")
func2_1(20,10,'-')

func2(10,5,'+')

func_var <- function(...){
  var <- c(...) # 전달받은 인자 벡터 객체 생성
  for(i in var){
    cat(i,'\t')
  }
}
func_var(1,2,3,4,5)
func_var(2,3,42,1,6)

#전역 변수 와 지역 변수

x <- 3 # 전역변수
func1 <- function(){
  x <- 5 #함수(중괄호)내 선언된 변수, 지역변수
  # 변수 이름이 같지만 메모리 위치가 다름
  print(x)
}
func1()

print(x) #  values x 3

func2 <- function(){
  x <<- 100 # <<- 전역변수를 가르킴, 전역변수를 재사용
  print(x)
}
func2()
print(x)

#클로저
add_x <- function(x){
  function(y){
    return (x+y)
  }
}
addx <- add_x(3) #function(x)의 매개변수에 3
addx(2) #function(y)의 매개변수에 2 전달
print(addx)
