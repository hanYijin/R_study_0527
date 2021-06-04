# 라이브러리 설치
#엑셀 데이터 불러오기 함수 라이브러리
library(readxl)
library(xlsx)
#엑셀 데이터 가져오기
excelData <- read_excel('res/data_ex.xlsx')
View(excelData)

#파일 경로로 가져오기
studentx <- read.xlsx(file.choose(),sheetIndex = 1,encoding = 'UTF-8')
studentx
View(studentx)

#1. 텍스트 파일 생성 
#2. 데이터 불러오기

txtData <- read.table('res/data_ex.txt')
View(txtData)
txtData
#현재 작업 디렉터리의 경로 확인
getwd()
#작업 디렉터리 설정
setwd("D:/MysecondRepository_20210402/R프로그래밍")

person <- read.table(file.choose())
names(person)<-c('번호','성별','나이','주소')
person

#header: 데이터에서 1행이 변수명인지 판별
# -->1행이 변수명이면 header=TRUE

# skip : 특정 행까지 제외하고 데이터 가져오기
#ex) 3행부터 가져오기 -> skip =2

#nrows: 특정 행까지 데이터 가져오기
# ex) 7행까지 데이터 가져오기 -> nrows=7

# sep : 데이터 구분자 지정
# ex) 쉼표로 구분된 데이터 집합 -> ','
txtData1 <-read.table('res/data_ex1.txt', header = T,sep=',')
View(txtData1)
txtData1

#칼럼명 지정하여 데이터 불러오기
#col.names=
varName <- c('ID','성별','나이','지역')
txtVar <- read.table('res/data_ex2.txt',sep = ',',col.names = varName)
View(txtVar)
txtVar

txttxt <- read.table('res/data_ex2.txt',sep=',')
colnames(txttxt) <-varName
txttxt

#.rda(통계용 파일)
id <- c(1, 2, 3, 4, 5)
name <- c('제니','리사','로제','지수','블링크')
rdaData <-data.frame(ID=id, NAME=name)
# rda file 저장 save()
save(rdaData, file='res/data_ex.rda')
load('res/data_ex.rda')
View(rdaData)

#csv 파일 데이터 저장 write.csv()
id <- c(1, 2, 3, 4, 5)
name <- c('제니','리사','로제','지수','블링크')
dataCsv <- data.frame(ID=id, NAME=name)
write.csv(dataCsv, file = 'res/data_ex.csv')

#txt 파일로 데이터 저장 write.table()
dataTxt <- data.frame(ID=id, NAME=name)
write.table(dataTxt,file = 'res/data_ex_sav.txt')

titanic <- read.csv('https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv')
titanic
#7행 까지 불러오기
tt <-read.csv('https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv',nrows = 7)
tt
#sikp
t2 <- read.csv('https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv', skip = 1000)
t2

#차수 확인 함수
dim(titanic)
# 자료 구조 확인 
str(titanic)
#각각의 정보 차수 확인
table(titanic$age) #연령별 차수
table(titanic$sex) #성별 차수
table(titanic$survived) #생존여부 차수

head(titanic)
tail(titanic)

#교차 분할표
tab <- table(titanic$survived,titanic$sex)
tab
# 생존율 기준으로 성(m/w)별로 통합결과

plot(tab,col=c('green','blue'),main='성별에 따른 생존 여부')

barplot(tab,col=c('green','blue'),main='성별에 따른 생존 여부')


write.table(titanic,'res/titanic.txt',row.names = F)
titanicDf <- read.table(file='res/titanic.txt', sep='',header = T)
View(titanicDf)

write.csv(titanicDf,'res/titanic.csv',row.names = F,quote = T)
write.csv(titanicDf,'res/titanic2.csv',row.names = T,quote = T)

#라이브러리 writexl 패키지 사용
#엑셀 쓰기 라이브러리 (데이터 저장)
library(writexl)
#엑셀 파일로 데이터 저장 write_xlsx
write_xlsx(x=titanicDf, path = 'res/titanic.xlsx', col_names = T)

#연습문제
#1. 동전 앞면과 뒷면에 대한 확률 함수 구현
#랜덤 생성 함수: runif()
#ex) runif(5, min,max)
runif(5,min=0,max=2)
#랜덤 생성 함수
rand_coin <- function(num){
  
    rand<-as.integer(runif(num,min=0,max=2))
    return(rand)
}

c<-rand_coin(20)
c

#랜덤 확률 분포 함수 
#몬테카를로 시뮬레이션
monteTest <- function(num){
  cnt<-0
  for(i in 1:num){
    cnt <-cnt+rand_coin(1)
  }
  result<-cnt/num
  return(result)
}

print(monteTest(20))
print(monteTest(1000000))
# 동전 20회 던졌을 때 앞뒤를 출력 
coin<-as.integer(runif(20,0,2))

coin

#동전 앞뒤 랜덤 생성 함수
coinTest <- function(n){
  r<-runif(n, min=0, max=1)
  res<- c()
  for(i in 1:n){
    if(r[i]<=0.5){
      res[i]<- 0
    }
    else{
      res[i]<- 1
    }
  }
  return(res)
}
res <- coinTest(5)
res
hist(res) #histogram으로 결과를 보여줌

#랜덤 확률 분포 함수 
#몬테카를로 시뮬레이션

monte <- function(n){
  cnt <- 0
  for(i in 1:n){
    cnt <- cnt + coinTest(1)
  }
  result<- cnt / n
  return(result)
}
monte(2)
monte(1000)
monte(100000)

