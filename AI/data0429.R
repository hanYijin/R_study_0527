library(readxl)
library(xlsx)

excelData <- read_excel('res/data_ex.xlsx')
View(excelData)

studentx <- read.xlsx(file.choose(),
                      sheetIndex = 1, 
                      encoding = 'UTF-8')
View(studentx)
# 연습문제
# 1. "2021-04-29 수입3000원", 
#    "2021-04-30 수입4500원",
#    "2021-05-01 수입5500원"
# 1번의 문자열을 이용하여 아래와 같이 출력
# 출력 형태> "3000원" "4500원" "5500원"
library(stringr)
suip <- c("2021-04-29 수입3000원",
          "2021-04-30 수입4500원",
          "2021-05-01 수입5500원")
price <- str_extract_all(suip, 
                         '[0-9]{4}[가-힣]{1}')
price

# 2. 1번에서 '-' 를 '/' 로 변경
#    --> str_replace_all()
str_replace_all(suip, '-', '/')

# 3. 임의의 국어, 영어, 수학점수를 
#    가지는 벡터3개 생성
#    ex) kor <- c(90, 85, 90)
kor <- c(90, 85, 90)
eng <- c(95, 80, 75)
math <- c(100, 90, 80)

# 4. 3번 벡터를 가지는 data frame 생성
# 5. 국,영,수 data frame에서 최대값 구하기
#    --> apply(object, 1, max) : 가로방향
#    --> apply(object, 2, max) : 세로방향
jumsu <- data.frame(kor=kor, eng=eng, mat=math)
jumsu
apply(jumsu, 1, max)
apply(jumsu, 2, max)

txtData <- read.table('res/data_ex.txt')
View(txtData)

# header : 데이터에서 1행이 변수명인지 판별
# ex) 1행이 변수명이면 header = TRUE

# skip : 특정 행까지 제외하고 데이터 가져오기
# ex) 3행부터 데이터 가져오기 -> skip = 2

# nrows : 특정 행까지 데이터 가져오기
# ex) 7행까지 데이터 가져오기 -> nrows = 7

# sep : 데이터 구분자 지정
# ex) 쉼표로 구분된 데이터 집합 -> ','
txtData1 <- read.table('res/data_ex1.txt',
                       header = TRUE,
                       sep = ',')
View(txtData1)

varName <- c('ID', '성별', '나이', '지역')
txtVar <- read.table('res/data_ex2.txt',
                     sep=',',
                     col.names = varName)
View(txtVar)

# .rda(통계용 파일)
id <- c(1, 2, 3, 4, 5)
name <- c('홍길동', '김길동', '이길동',
          '박길동', '최길동')
rdaData <- data.frame(ID=id, NAME=name)
# rad file 저장
save(rdaData, file='res/data_ex.rda')
load('res/data_ex.rda')
View(rdaData)

id <- c(1, 2, 3, 4, 5)
name <- c('홍길동', '김길동', '이길동',
          '박길동', '최길동')
dataCsv <- data.frame(ID=id, NAME=name)
write.csv(dataCsv, file='res/data_ex.csv')

dataTxt <- data.frame(ID=id, NAME=name)
write.table(dataTxt, file='res/data_ex_sav.txt')

titanic <- read.csv('https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv')
titanic

dim(titanic)
str(titanic)

# 데이터 빈도
table(titanic$age)
table(titanic$sex)
table(titanic$survived)

head(titanic)
tail(titanic)

# 교차 분할표
tab <- table(titanic$survived, titanic$sex)
tab

plot(tab, col=c('green', 'blue'),
     main='성별에 따른 생존 여부')
barplot(tab, col=c('green', 'blue'),
        main = '성별에 따른 생존 여부')


write.table(titanic, 'res/titanic.txt', 
            row.names = FALSE)
titanicDf <- read.table(file='res/titanic.txt',
                        sep='', header = T)
View(titanicDf)
write.csv(titanicDf, 'res/titanic.csv',
          row.names = F, quote = F)

library(writexl)
write_xlsx(x=titanicDf, path='res/titanic.xlsx',
           col_names = T)




