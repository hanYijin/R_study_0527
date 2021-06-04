library(readxl)
ex <- read_excel('res/sample1.xlsx')
View(ex)
#열단위 자료형 출력
str(ex)
#행과 열의 개수 합산
dim(ex)
#열 이름
ls(ex)

#데이터 조작
library('dplyr')
#열이름 바꾸기
ex<- rename(ex, Y17_AMT=AMT17, Y16_ATM=AMT16)
View(ex)

#새로운 열 추가 특정 속성 값 지정 연산
ex$AMT_NEW <- ex$Y17_AMT + ex$Y16_ATM
ex$CNT_NEW <- ex$Y17_CNT + ex$Y16_CNT
View(ex)

# 평균 이체 값
ex$AVG_AMT <- ex$AMT_NEW / ex$CNT_NEW
View(ex)

#AVG_GR 속성 조건문 이용하여 AGE속성 값 비교하여 값 설정
ex$AVG_GR <- ifelse(ex$AGE >= 50, 'A1', 
                    ifelse(ex$AGE>=40,'A2',
                           ifelse(ex$AGE>=30,'A3',
                                  ifelse(ex$AGE>=20,'A4','A5'))))
View(ex)
# 특정 열(속성) 값 출력
ex %>% select(ID)
ex %>% select(ID,AREA, Y17_CNT)

#특정 속성 값 제외 출력
ex %>% select(-AREA)
ex %>% select(-ID,-SEX,-AGE)

# 속성 값 추출하여 출력
ex %>% filter(AREA =='서울')
ex %>% filter(AREA =='서울' & Y17_CNT >= 20)

# 정렬
ex %>% arrange(AGE) # 나이 기준 오름차순순
# 나이 기준 내림차순
ex %>% arrange(desc(AGE))

# 속성 값의 모든 합
ex %>% summarise(TOT_Y17_AMT=sum(Y17_AMT))

#지역별 
ex %>% group_by(AREA) %>% summarise(SUM_AMT17_BY_AREA=sum(Y17_AMT))


mData <- read_excel('res/sample1_m.xlsx')
fData <- read_excel('res/sample1_f.xlsx')
View(mData)
#데이터프레임 병합
#inner_join(c1,c2,x): c1과 c2 모두 x칼럼이 존재하는 관측치만 병합
#left_join(c1,c2,x): 왼쪽 c1의 x칼럼을 기준으로 병합
#ringt_join(c1,c2,x): 오른쪽 c2의 x칼럼을 기준으로 병합
#full_join(c1,c2,x): c1, c2 중 x 칼럼이 있으면 모두 병합

#데이터프레임 합치기
#bind_rows(c1,c2): 행단위
#bind_cols(c1,c2): 열단위
# 행기준으로 join: bind_rows()함수
ex_binjoin <- bind_rows(mData,fData)
View(ex_binjoin)
ex_binjoin

jeju_y17 <- read_excel('res/sample1_jeju_17.xlsx')
jeju_y16 <- read_excel('res/sample1_16.xlsx')
View(jeju_y16)

#열기준으로 join
bind_col <- left_join(jeju_y17,jeju_y16, by="ID")
View(bind_col)

bind_col2 <- right_join(jeju_y17,jeju_y16,by="ID")
View(bind_col2)

# 내부조인
bind_col_inner <- inner_join(jeju_y17, jeju_y16, by="ID")
View(bind_col_inner)


bind_col_full <- full_join(jeju_y17,jeju_y16,by="ID")
View(bind_col_full)


x1<- c(1, 2, 3, 4, 5 ,6, 100)
# 평균
mean(x1)
avg<- x1 / 7
avg

#NA = NULL : 결측값

data <- c(10, 20, 5, 4, 40, 7, NA, 6, 3, NA, 2, NA)

#결측값을 통계 분석 시 제외(미포함): na.rm = TRUE


# 결측값이 포함되어 있는지 확인하는 방법: is.na()
na <- function(x){
  print(x)
  print(mean(x, na.rm=T))
  
  data = ifelse(!is.na(x),x,0) # 삼항연산자
  print(data)
  print(mean(data))
  #round() 반올림 함수
  #na를 평균값으로 변경
  data2 = ifelse(!is.na(x),x,round(mean(x,na.rm= T), 2))
  print(data2)
  print(mean(data2))
}
na(data)

#중앙값(중위수)
x2 <- c(1,2,3,4,5,100)
median(x2)
max(x2)
min(x2)
range(x2)

#분위수(변위값)
#1사분위수(Q1), 2사분위수(Q2), 3사분위수(Q3)
quantile(x2)
quantile(x2,probs = 0.25)
quantile(x2,probs = 0.5)
quantile(x2,probs = 0.75)
quantile(x2,probs = 0.8)

# 표준편차: 평균에 대한 오차
# 실제 데이터 값이 평균으로 기준으로 할때의 분포값
x2 <- c(1,2,3,4,5,100)
mean(x2)
sd(x2)
# 분산: 편차의 제곱의 합
var(x2)

sd(x2)

x <- c(1,1,1,1)

var_sd <- function(x){
  # 데이터가 평균으로부터 분포하는 정동
  
  var <- sum((x-mean(x))^2)/(length(x)-1)
  sd <- sqrt(var) #제곱근 sqrt() 함수
  cat('분산: ',var, '\n')
  cat('표준편차: ',sd)
}
length(x)
var_sd(x)

install.packages('fBasics')
library('fBasics')
#x 변수 첨도: 데이터 분포가 뾰족한 정도
#통계량이 0보다 크면 정규분포 대비 뾰족한 형태
# 0보다 작으면 정규분포 대비 평평한 형태
kurtosis(x)

#정규분포: 동일한 확률을 가진 변수들이 적당히 크면, 해당 변수들의 평균은 일정한 패턴을 가지는 분포

# x 변수 왜도: 데이터 분포의 비대칭성
#통계량의 절대값이 클수록 비대칭이 심함
# +값이면 오른쪽으로 꼬리가 길고, -값이면 왼쪽으로 꼬리가 긴 형태
skewness(x)

install.packages('reshape2')
library('reshape2')
airquality
head(airquality)
str(airquality)

#melt()함수는 식별자id, 측정 변수 variable, 측정치 value 형태로 데이터를 재구성하는 함수
#melt(데이터,id.vars= 식별자 컬럼들, measure.vars= 측정치 컬럼들)
# measure.vars가 생략되면 id.vars에 해당하지 않은 모든 컬럼이 측정치 컬럼이 됨.
melt_test2 <- melt(airquality, 
                   #기준열
                   id.vars = c('month','day'),
                   #변환열
                   measure.vars = 'ozone')
head(melt_test2)
View(airquality)
class(airquality)
melt_Test3<- melt(airquality,id.vars = 'Month','Day',variable.name = 'climate_variable',value.name = 'climate_value')
head(melt_Test3)

#칼러명 소문자 변경
names(airquality)<-tolower(names(airquality))
head(airquality)
melt_Test3<- melt(airquality,id.vars = c('month','day'),variable.name = 'climate_variable',value.name = 'climate_value')
head(melt_Test3)
melt_air <- melt(airquality,id=c('month','day'),na.rm=T)
head(melt_air)
acast(aq_melt,day~month~variable)

# acast(): vector, matrix, array 변환
# dcast(): data frame 변환

aq_melt <- melt(airquality, id=c('month','day'), na.rm=T)
head(aq_melt)

aq_dcast <- dcast(aq_melt, month + day ~ variable)
head(aq_dcast)
class(aq_dcast)

aq_acast <- acast(aq_melt, day ~ month ~ variable)
head(aq_acast)
mode(aq_acast)

acast(aq_melt, month ~ variable, mean)
dcast(aq_melt, month~ variable, mean)

##################################################################
library('dplyr')
# 1. ozone 합, 평균값, 표준편차, 분산 구하기 (NA 값 제거)
ozone_data <- melt(airquality,id=c('month','day'),na.rm = T)
head(ozone_data)
summarise(ozone_data, SUM=sum(value),Mean=mean(value),SD=sd(value),VAR=var(value))
################################################################################
# 1) 모든 정보 칼럼명을 소문자로 변경
names(airquality)<-tolower(names(airquality))
str(airquality)
class(airquality)
# 모든 기본함수에는 매개변수로 NA 제거 옵션 제공
sum(airquality$ozone,na.rm=T) # 합
mean(airquality$ozone, na.rm = T) # 평균
var(airquality$ozone, na.rm=T) # 분산
sd(airquality$ozone, na.rm = T) # 표준편차

# 2. 모든 NA 제거 후, 각 월별로 측정 값들의 평균
air_mean <- acast(ozone_data,month~variable, mean)
air_mean
class(air_mean)

# 3. 5월 달 평균 온도, 풍속
temp <- melt(airquality,id='month',measure.vars = 'temp',na.rm=T)
wind <- melt(airquality, id='month',measure.vars = 'wind', na.rm=T)
data1 <- filter(temp,month==5)
data2 <- filter(wind,month==5)
mean_temp<-summarise(data1,temp_mean=mean(value))
mean_wind<-summarise(data2,wind_mean=mean(value))
mean_temp;mean_wind
mean_temp_wind <- cbind(mean_temp,mean_wind)
mean_temp_wind
################################################################################
# 1) 5월 달 온도, 풍속 
tw5Data<- subset(airquality,month==5,select = c('wind','temp'))
tw5Data
mean(tw5Data$wind,na.rm = T);mean(tw5Data$temp, na.rm = T)

########################################################################
fil_data <- filter(airquality,month==5) %>% select(wind,temp)
witeData <- summarise(fil_data,wind_mean=mean(wind,na.rm = T),temp_mean=mean(temp,na.rm = T))
witeData

# 4. ozoen 5월달 합, 평균, 분산, 표준편차 (NA 제거)
# --> R기본 함수와 사용자 정의 함수 각각 사용
oz_data<-filter(ozone_data,month==5 & variable=='ozone')
oz_data
summarise(oz_data,sum=sum(value),mean=mean(value),var=var(value),sd=sd(value))
#사용자 정의 함수
as.list(oz_data)
oz_val <- oz_data$value
oz_val
f <- function(x){
  sum <- 0
  for(i in x){
    sum <- sum+i
  }
  cat("합계: ",sum,'\n')
  
  mean <- sum/length(x)
  cat("평균: ",mean,'\n')
  
  var<-sum((x-mean(x))^2)/(length(x)-1)
  cat("분산: ", var,'\n')
  
  sd <- sqrt(var)
  cat("표준 편차: ",sd)
}
f(oz_data$value)
f(oz_val)
###########################################################################
ozone5 <- subset(airquality, month==5, select = ozone)
ozone5$ozone
mean(ozone5$ozone,na.rm=T)
sum(ozone5$ozone, na.rm=T);var(ozone5$ozone,na.rm=T);sd(ozone5$ozone, na.rm=T)

delNa= ifelse(!is.na(ozone5$ozone),ozone5$ozone,round(mean(ozone5$ozone,na.rm = T),5))
delNa
mean(delNa)
sum(delNa);var(delNa);sd(delNa)

func <- function(x){
  sum <- 0
  for(i in x){
    sum <- sum + i
    len<-length(x)
  }
  cat("합: ",sum,'\n')
  
  mean <- sum / len
  cat("평균: ",mean,'\n')
  
  var <- sum((x-mean)^2) / (len-1)
  cat("분산: ",var,'\n')
  
  sd<- sqrt(var)
  cat("표준 편차: ",sd,'\n')
}
func(delNa)
#############################################################################
airquality %>% filter(month==5) %>%  select(ozone) %>% summarise(ozone5_sum=sum(ozone,na.rm = T),ozone5_avg=mean(ozone,na.rm = T)
                                                                 ,ozone5_var=var(ozone,na.rm = T),ozone5_sd=sd(ozone,na.rm = T))
# 5. 5월 7일 데이터 출력
str(airquality)
airquality[airquality$month==5 & airquality$day==7,]
###################################################################
subset(airquality,month==5 & day==7)

airquality %>% filter(month==5) %>% filter(day==7) %>% select(ozone)

class(filter(airquality,month==5& day==7))

# 6. 5/1 ~ 5/6까지 오존농도
#-->기준열(month,day)
oz <-melt(airquality, id=c('month','day'),measure.vars = 'ozone',na.rm=T)
oz
printInfo <-function(){
  data<-data.frame()
  for(i in c(1:6)){
    print(filter(oz,month==5&day== i))
  }
  return(data)
}
printInfo()
# 7. 기온이 가장 높은 날짜를 기준으로 출력
airquality[which.max(airquality$temp), c('month','day')]
# 8. 기온이 가장 높은 날의 모든 데이터 출력
airquality[which.max(airquality$temp),c(1:6)]
# 9. 6월달에 발생한 가장 강한 바람의 세기 출력
#--> subset() 사용
wind6 <- subset(airquality,month=6, select = wind)
class(wind6)
class(wind6$wind)
wind6[which.max(wind6$wind),]

#####################################################
blackpink <- data.frame(name=c('제니','리사','로제','지수'),age=c(26,25,25,27),from=c('뉴질랜드','태국','호주','한국'))
blackpink[blackpink$name=='제니'&blackpink$age==26,]
jenInfo <- subset(blackpink,name=='제니',select=from)
jenInfo <- subset(blackpink,name=='제니',)
class(jenInfo)

jenInfo
filter(blackpink,name=='제니') %>%select(from)
filter(blackpink,name=='제니')
blackpink[which.max(blackpink$age),]
blackpink[which.max(blackpink$age),c('name','from')]
