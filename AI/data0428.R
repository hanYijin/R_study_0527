
ex_vector <- c(1, 2, 3, 4, 5, 6)
ex_vector
print(ex_vector)
ex_vector[c(1, 5)]
ex_vector[1:3]

ex_vector <- c('홍길동', '김길동', '박길동')
ex_vector[c(1, 5)]
ex_vector[1:2]

ex_vector <- c(1:6)
matrix(ex_vector, nrow=2, ncol=3)
matrix(ex_vector, nrow=3, ncol=2)
matrix(ex_vector, nrow=3, ncol=2, byrow=T)

arr <- c(1:9)
array(arr, dim=c(2, 2, 3))
array(arr, dim=c(2, 2, 3),
      dimnames = list(c('1행', '2행'),
                      c('1열', '2열'),
                      c('1페이지', '2페이지', 
                        '3페이지')))

#[연습문제]
# 1. 'R' 문자가 5회 반복 처리되는 벡터 
#    ---> rep() 함수 사용
vec1 <- rep('RAT', 5)
vec1
# 2. 1~10까지 3간격으로 연속되는 벡터
#    ---> seq() 함수
vec2 <- seq(1, 10, by=3)
vec2
# 3. 1~10까지 3간격으로 연속된 정수가 3회 반복
#    ---> rep() 함수
vec3 <- rep(vec2, 3)
vec3
# 4. 2번, 3번이 모두 포함되는 벡터
vec4 <- c(vec2, vec3)
vec4
# 5. 4번에서 홀수번째 값들만 저장하는 벡터
vec5 <- vec4[seq(1, 16, by=2)]
vec5

list1 <- list(c(1, 2, 3), c('홍길동', '이길동'),
              TRUE, 12.5)
list1

list2 <- list(c('홍길동', '김길동', '박길동'),
              c(20, 30, 40))
names(list2) <- c('NAME', 'AGE')
print(list2[1])
print(list2$NAME[1])
print(list2$AGE[3])

member <- list(name=c('홍길동', '전우치'),
               age=c(200, 300),
               address=c('한양', '강원'),
               gender=c('남자', '남자'),
               home=c('홍대감댁', '두메산골'))
member
member$name
member$name[1]
member$home[2]

member$age[1] <- 100
member$address[1] <- '경기'
member$home[2] <- '기와집'
member

# data frame
id <- c(1, 2, 3, 4, 5)
gender <- c('M', 'F', 'M', 'F', 'F')
age <- c(25, 32, 45, 51, 12)
addr <- c('대구시 동구 신암1동', '대구시 동구 신암2동',
          '대구시 동구 신암3동','대구시 동구 신암4동',
          '대구시 동구 신암5동')
dataValue <- data.frame(id, gender, age, addr)
dataValue
mode(dataValue)
class(dataValue)
View(dataValue)

dataVal <- edit(data.frame())
dataVal

id_r1 <- c('a1', 'a2', 'a3', 'a4')
name_r1 <- c('김길동', '이길동', '홍길동', '박길동')
stu_r1 <- data.frame(id_r1, name_r1)
stu_r1

stu_r2 <- data.frame(
  id_r2 = c('j1', 'j2', 'j3', 'j4'),
  name_r2 = c('전우치', '김우치', '이우치', '박우치'))
stu_r2

names(stu_r1) <- c('ID', '이름')
names(stu_r2) <- names(stu_r1)

# 행결합
studRbind <- rbind(stu_r1, stu_r2)
studRbind

stu_c1 <- data.frame(
  id = c('i1', 'i2', 'i3'),
  name = c('홍길동', '김길동', '박길동'))
names(stu_c1) <- c('ID', '이름')
stu_c1

stu_c2 <- data.frame(
  age = c(20, 30, 40),
  gender = c('M', 'F', 'M'))
names(stu_c2) <- c('나이', '성별')
stu_c2

# 열결합
studCbind <- cbind(stu_c1, stu_c2)
studCbind

stu_j1 <- data.frame(
  id = c('i1', 'i2', 'i3'),
  name = c('홍길동', '김길동', '박길동'))
names(stu_j1) <- c('ID', '이름')
stu_j1

stu_j2 <- data.frame(
  id = c('i2', 'i3', 'i4'),
  gender = c('M', 'F', 'M'))
names(stu_j2) <- c('ID', '성별')
stu_j2

studJoin <- merge(
  x = stu_j1, y = stu_j2, by = 'ID')
studJoin

#install.packages('stringr')
library(stringr)

strData <- c('홍길동35이순신45유관순25')
str_extract(strData, '[1-9]{2}')
str_extract_all(strData, '[1-9]{2}')

strData1 <- 'hongkd105leess1002you25강감찬2005'
str_extract_all(strData1, '[a-z]{3}')
str_extract_all(strData1, '[a-z]{3,}')
str_extract_all(strData1, '[a-z]{3,5}')

str_extract_all(strData1, 'hong')
str_extract_all(strData1, '25')
str_extract_all(strData1, '[가-힣]{4}')
str_extract_all(strData1, '[a-z]{3}')
str_extract_all(strData1, '[0-9]{3}')

str_extract_all(strData1, '[^a-z]')
str_extract_all(strData1, '[^a-z]{4}')
str_extract_all(strData1, '[^가-힣]{5}')
str_extract_all(strData1, '[^0-9]{3}')

name <- '홍길동1234,이순신5678,김길동1011'
str_extract_all(name, '\\w{7,}')
str_extract_all(name, '\\d')
str_match_all(name, '\\d')

size <- str_length(name)
size

str_locate(strData1, '강감찬')
strDataSub <- str_sub(strData1, 1, 
                      str_length(strData1)-10)
strDataSub

upstr <- str_to_upper(strDataSub); upstr
str_to_lower(upstr)

jumin <- '891228-5234567'
str_extract(jumin, '[0-9]{6}-[1-4][0-9]{6}')

# 1974년 미국 자동차 잡지 data frame
mtcars
# 구조
str(mtcars)
head(mtcars)
tail(mtcars)
dim(mtcars)
length(mtcars)
length(mtcars$cyl)
names(mtcars)
class(mtcars)
mode(mtcars)
sapply(mtcars, class)




