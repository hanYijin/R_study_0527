#List 자료구조: 다른 자료형과 자료구조(벡터, 행열, 리스트, 데이터프레임)를 객체로 생성
list1 <- list(c(1,2,3), c("제니","리사","로제"),TRUE,12.5)
list1

list2 <- list(c("제니","로제","리사"),c(20,30,40))
names(list2) <- c('NAME','AGE')
list2
print(list2[1])
print(list2$NAME)
print(list2$NAME[1])
print(list2$AGE[3])

blackpink <- list(name=c("제니","로제","리사","지수"),age=c(26,25,25,27),address=c("뉴질랜드","호주","태국","서울"),
               gender=c("여자","여자","여자","여자"),home=c("YG","yg","와이쥐","Yg"))

blackpink
blackpink$name
blackpink$name[1]
blackpink$address[2]
#값 변경
blackpink$age[1] <-100
blackpink$address[4] <-"한국"
blackpink

#데이터 프레임 data frame
id <- c(1,2,3,4,5)
gender <- c('m','F','m','F','F')
age <- c(25,32,45,51,12)
addr <- c('대구','서울','수원','울산','부산')
datavalue <- data.frame(id,gender,age,addr)
datavalue
mode(datavalue)
class(datavalue)
View(datavalue)

#데이터프레임 편집기
dataval <-edit(data.frame())
dataval

id_r1 <- c('a1','a2','a3','a4')
name_r1 <-c('제니','리사','로제','지수')
stu_r1 <- data.frame(id_r1,name_r1)

stu_r1

stu_r2 <- data.frame(id_r2 = c('b1','b2','b3','b4'), name_r2=c('한이','한수','한동','다발'))
stu_r2

names(stu_r1) <- c('ID','NAME')
names(stu_r2) <- names

#행 결합
studRbind <- rbind(stu_r1,stu_r2)
studRbind

#열 결합
stu_c1 <- data.frame(id=c("c1","c2","c3"),name=c('김씨','한씨','홍씨'))
names(stu_c1) <- c('ID','NAME')
stu_c1

stu_c2 <- data.frame(age= c(20,30,40),gender=c('M','F','F'))
names(stu_c2) <- c('AGE','GENDER')
stu_c2

studCbind <- cbind(stu_c1,stu_c2)
studCbind


# 내부 join
stu_j1 <- data.frame(id=c("c1","c2","c3"),name=c('김씨','한씨','홍씨'))
names(stu_j1) <- c('ID','NAME')
stu_j1

stu_j2 <- data.frame(id=c("c2","c3","c4"),gender=c('M','F','F'))
names(stu_j2) <- c('ID','GENDER')
stu_j2

studJoin <- merge(x= stu_j1, y=stu_j2, by='ID')
studJoin

#라이브러리 설치
install.packages('stringr')
library(stringr) # 라이브러리 설치 후 사용

strData <- c('제니26리사25로제25')
#stringr라이브러리 함수 
#str_extract
str_extract(strData,'[1-9]{2}')
#str_extract_all
str_extract_all(strData, '[1-9]{2}')

strData1<- 'hongkd1051eess1002you25감감찬2055'
str_extract_all(strData1,'[a-z]{3}') # 3자 연속하는 경우 추출
str_extract_all(strData1,'[a-z]{3,}') # 3자 이상 연속하는 경우 추출
str_extract_all(strData1,'[a-z]{3,5}') # 3~5자 연속하는 경우 추출

# 해당문자열 추출
str_extract_all(strData1,'hong')
str_extract_all(strData1,'25')
#한글 문자열 추출
str_extract_all(strData1,'[가-힣]{4}')
#알파벳 문자열 추출
str_extract_all(strData1,'[a-z]{3}')
#숫자 추출
str_extract_all(strData1,'[0-9]{3}')

#포함하지 않은 문자열 추출
#[^a-z]: 알파벳 제외 문자열 추출

str_extract_all(strData1,'[^a-z]')
str_extract_all(strData1,'[^a-z]{4}')

#한글을 제외한 문자열 추출
str_extract_all(strData1,'[^가-힣]{5}')
# 숫자를 제외한 문자열 추출
str_extract_all(strData1,'[^0-9]{3}')


name <-'홍길동1234이순신5678김길동1011'
str_extract_all(name,'\\w{8,}') # 콤마 기준으로 5자
str_extract_all(name, '\\d')
str_match_all(name,'\\d')

#문자열 길이 반환
size <- str_length(name)
size

#인데스 값 시작, 끝
str_locate(strData1,'감감찬')

#문자열 슬라이싱
#인덱스 1에서 부터 문자열 길이-10까지의 문자열 추출
strDatasub <- str_sub(strData1, 1, str_length(strData1)-10)
strDatasub
#문자열 대문자로 변경
upstr <- str_to_upper(strDatasub); upstr

# 소문자로 변경
str_to_lower(upstr)

#주민번호 
jumin <- '961116-2904567'
#주민번호 앞자리 추출
str_extract(jumin,'[0-9]{6}-')
str_extract_all(jumin,'[0-9]{6}')
#주민번호 뒤자리 추출
str_extract(jumin,'[0-9]{6}-[1-4][0-9]{6}')

# 1974년 미국 자동차 잡지 dataframe
mtcars
#구조 보기
#칼러(열) 단위 데이터를 보여줌
str(mtcars)
# 상위 6개의 데이터 
head(mtcars)
#하위 6개의 데이터
tail(mtcars)
#행과 열 개수 출력
dim(mtcars)
#데이터 자료 구조 길이, 칼럼(열) 길이
length(mtcars)
#해당 컬럼의 개수 (행의 길이)
length(mtcars$cyl)

# 칼러명 출력
names(mtcars)

class(mtcars)
mode(mtcars)

sapply(mtcars,class)

#문자열 추출
str <-"홍길동35이순신45유관순25"
str_extract(str,'[1-9]{3}')
str_extract_all(str,"[1-9]{3}")

#정규표현식
string <- "hongkd105leess1002you25강감찬2055"
str_extract_all(string,'[a-z]{3,5}')

# 해당 문자열 추출
str_extract_all(string,"[0-9]{4}")


# 특정 문자열을 제외하는 정규표현식
str_extract_all(string,'[^0-9]{3}')

#
jumin <- "123456-9234567"
str_extract(jumin,"[0-9]{6}-[9][0-9]{6}")
str_extract_all(jumin,"\\d{6}-[923]\\d{6}")
email <- "gksdlwls123@naver.com"
str_extract(email,"\\w{11}[@]\\w{5}")

name <- "홍길동1234,이순신5678,강감찬1012"
str_extract_all(name,"\\w{7,}")

string_sub<- str_sub(string,5,str_length(string))
string_sub
