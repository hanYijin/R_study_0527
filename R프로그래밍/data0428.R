#vector 1차원 선형 구조 
ex_vector <- c(1, 2, 3, 4, 5, 6)
ex_vector
print(ex_vector)
ex_vector[c(1,5)] #index 1, 5 요소를 출력
ex_vector[1:3] # index 1~3 요소를 출력

ex_vector <- c('제니','리사','로제','지수')
ex_vector[c(1: 5)]

#Matrix(2차원 배열)
ex_vector <- c(1:6) 
matrix(ex_vector, nrow=2, ncol=3) #1차원 벡터를 2차원 매트릭스로 2행 3열 
#1열 부터 값을 채움 (열 우선으로)
matrix(ex_vector, nrow=3, ncol=2)
matrix(ex_vector, nrow=3, ncol=2, byrow=T)

#Array(다차원 배열)
arr <- c(1:12)
array(arr, dim=c(2, 2, 3))
#2 * 2 * 3 =>3차원 배열
arr <- c(1:12)
array(arr,dim=c(2,2,3), dimnames=list(c('1행','2행'), c('1열','2열'),c('1페이지', '2페이지','3페이지')))


m<-matrix(c(1:5))
m
m <- matrix(c(1:10),nrow=2, byrow=T)
m
#행 묶음으로 행렬 객체 생성
# rbind()함수
x1 <- c(5, 40, 50:52)
x2 <- c(30, 5, 6:8)
mr <- rbind(x1,x2)
mr
#열 묶음으로 행렬 객체 생성
# cbind() 함수
mc <- cbind(x1,x2)
mc
#matrix()함수 이용 행렬 객체 생성
m3 <-matrix(10:19,2)
m4 <- matrix(10:20,2)
m3
m4

m3[1,]
m3[,5]
m3[2,3]
m3[1,c(2:5)]
length(m3)
ncol(m3)
nrow(m3)

#Array 자료구조: 같은 자료형을 갖는 다차원 배열구조
#배열 생성 함수: array()

vec <- c(1:12)
arr <- array(vec, c(3,2,2))
arr
arr[,,1]
arr[,,2]
#[연습문제]
#1. 'R' 문자가 5회 반복 처리되는 벡터
vec1 <- rep('R',5)
vec1


#2. 1~10까지 3간격으로 연속되는 벡터
vec2 <- seq(1,10,3)
vec2


#3. 1~10까지 3간격으로 연속된 정수가 3회 반복
vec3 <- rep(vec2,3)
vec3


#4. 2번, 3번 모두 포함되는 벡터

vec4 <- c(vec2,vec3)
vec4


#5. 4번에서 홀수 번째 값들만 저장하는 벡터
vec5 <- vec4[seq(1,16,2)]
vec5


num<-30
typeof(num)
if(is.integer(num)){
  print('xsms int')
}else{
  print('')
}


list <-list("블랙핑크","제니", 26)
list
 # 리스트를 벡터구조로 변경하기
unlist <- unlist(list)
unlist

#key와 value 형식으로 리스트 객체 생성
member <- list(name= c("제니","로제"),age=c(25,26),from=c("뉴질랜드","호주"))
member
member$name
member$age
member$from
member$name[1]
member$name[2]

member$age[1] <- 100  #age key의 첫번째 요소 수정
memebr$id<-"gen" #id key 추가
memebr$pw<-"1234" #pw key 추가
member

member$age <-NULL
multi_list <- list (c1= list(1,2,3),
                    c2=list(10,20,30),
                    c3=list(100,200,300))
multi_list
multi_list$c1;multi_list$c2;multi_list$c3

#다차원 리스트Matrix 객체 생성, 열 단위로 바인딩
do.call(cbind,multi_list)

# 데이터프레임 자료구조
# 데이터베이스의 테이블 구조와 유사하다
# 칼럼(열) 단위로 서로 다른 데이터의 저장이 가능하다
# 칼럼은 리스트, 칼럼 내의 데이터는 벡터 자료구조
# 데이터프레임 생성 함수: data.frame(), read.table(), read.csv()
# 자료 처리 함수: str(),ncol(),nrow(), apply()

# 벡터를 이용한 데이터프레임 객체 생성하기
no <- c(1,2,3)
name <-c("hong","lee","kim")
pay <- c(150,250,400)
person <- data.frame(No=no, Name=name, Pay=pay) #칼럼명 지정
person

#matrix를 이용한 데이터프레임 객체 생성하기
p<-matrix(c(1,"h",450,2,"l",250,3,"k",300),3,byrow=T)#행 우선, 3개의 리스트 생성
person <- data.frame(p)
person

#데이터프레임 만들기
df <- data.frame(x=c(1:5),y=seq(2,10,2),z=c('a','b','c','d','e'))
df

df$x
df$x[2]

#자료구조 보기
str(df)

#행 수 보기
ncol(df)
#열 수 보기
nrow(df)
#칼러명 보기
names(df)

#특정 행 출력
df[c(2:3),1]

#데이터 프레임 자료에 함수 적용하기
apply(df[,c(1,2)],2,sum) # 열 단위의 합계

#부분 객체 만들기
#변수 <- subset(데이터프레임, 조건)
x1 <- subset(df,x>=3) # x가 3 이상인 행을 대상으로 생성
x1

#두개의 조건으로 부분 객체 만들기
y1<-subset(df,y<=8) # y가 8이하인 행
xyand <- subset(df,x>=2&y<=6) #AND 연산으로 2개의 조건 지정
xyor <- subset(df,x>=2|y<=6)
y1
xyand
xyor

#stdent dataframe 만들기
#벡터 객체 생성
sid =c("A","B","C","D")
score=c(90,80,70,60)
subject=c("컴퓨터","국어국문","소프트웨어","유아교육")

student <- data.frame(sid,score,subject)
student

#자료형과 자료구조 보기
mode(student);class(student)
str(sid);str(score);str(subject)
str(student)

# 두 개 이상의 데이터프레임 병합

height <- data.frame(id=c(1,2),h=c(180,185))
weight <- data.frame(id=c(1,2),W=c(80,75))

user <- merge(height,weight,by.x="id",by.y="id")
user
user1 <- merge(height, weight,by="id")
user1

