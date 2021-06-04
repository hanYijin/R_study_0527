# 데이터 조작_ dplyr 패키지
#
# 1. filter : 조건에 맞는 행 추출
# 2. arrange: 지정한 열을 기준으로 정렬
# 3. select : 열 추출
# 4. mutate : 열 추가
# 5. summarize : 데이터 요약
# 6. distinct : 중복 값 제거
# 7. group_by :  데이터 그룹 생성
# 8. sample_n : n개의 샘플 추출
# 9. sample_frac : n% 비율의 샘플 추출
# 10. %>% : 함수 연결

library(dplyr)
# 행의 갯수
nrow(mtcars)
str(mtcars) 

#filter(데이터프레임,조건)
filter(mtcars,cyl == 4)
# 조건 &연산자
filter(mtcars,cyl >= 6 & mpg > 20)
# wt를 기준으로 오름차순, hp는 내림차순 desc
arrange(mtcars,wt,desc(hp))
head(arrange(mtcars,mpg,desc(wt)))

#select(데이터프레임, 칼럼명,...):  특정 열 추출 
select(mtcars,am,gear) # am, gear 속성을 추출
select(mtcars,mpg,cyl,carb)

#mutate(데이터, 새로 추가할 칼러명='값')
mutate(mtcars,years="1974")

head(mutate(mtcars, mpg_rank=rank(mpg)))

# 중복값 제거
distinct(mtcars,cyl)
distinct(mtcars,cyl,gear)

summarise(mtcars,cyl_mean=mean(cyl), cyl_min=min(cyl),cyl_max=max(cyl))
summarise(mtcars, mean(cyl), min(cyl), max(cyl))

#데이터 그룹 group_by(데이터프레임, 집단변수)
gr_cyl <- group_by(mtcars,cyl)
gr_cyl
#gr_cyl에서 cyl별 개수 요약 정보
summarise(gr_cyl,n())

# gear 중복 값을 제외하고 cyl별 개수 요약 정보
summarise(gr_cyl,n_distinct(gear))

# 랜덤 데이터 추출
sample_n(mtcars,10)
sample_frac(mtcars,0.2)

#cyl별로 그룹으로 묶고 개수로 요약
# %>% : 파이프 라인 왼쪽 결과를 오른쪽으로 넘겨줌
group_by(mtcars,cyl) %>% summarise(n())


mp_rank <- mutate(mtcars, mpg_rank = rank(mpg))
# mp_rank를 기준으로 오름차순 정렬
arrange(mp_rank,mpg_rank)
# 위와 동일한 결과 출력 하나의 동작을 연결
mutate(mtcars, mpg_rank=rank(mpg)) %>% arrange(mp_rank,mpg_rank)


# 연습
# 1. library(dplyr), libray(hflights) 설치
library(dplyr)
install.packages("hflights")
library("hflights")
head(hflights)
str(hflights)
class(hflights)
View(hflights)
# 2. 1월 2일 데이터 구하기
head(filter(hflights,Month==1 & DayofMonth==2))
# 3. 1월 or 2월 데이터 추출
month1_2 <- filter(hflights,Month==1 | Month==2)
View(month1_2)
# 4. 도착시간을 기준으로 오름차순 정렬
arrange(hflights,DepTime)
# 5. Year, Month, DepTime, ArrTime 데이터 검색
select(hflights,Year,Month,DepTime,ArrTime)
# 6. 도착지연 시간을 구한 후 새로운 컬럼 추가
# 도착지연 시간: ArrTime-DepTime  
View(mutate(hflights,DelayTime= ArrTime - DepTime))
# 7. 비행시간 평균 (NA 제거)
mean(hflights$AirTime,na.rm=T)
# 8. 도착시간(ArrTime)의 표준편차, 분산 구하기
sd(hflights$ArrTime,na.rm = T)
var(hflights$ArrTime,na.rm=T)
