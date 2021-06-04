attributes(iris)
#변수와 변수사이의 관계를 시각화하는 방법
#산점도
#graphics 패키지에 제공되는 pairs()함수
# martrix, dataframe의 변수들 사이의 비교 결과를 행렬구조의 분산된 그래프로 제공
#두 변수 사이의 관계 : 상관분석
pairs(iris[iris$Species=='virginica',1:4])
pairs(iris[iris$Species=='setosa',1:4])
pairs(~Sepal.Width + Sepal.Length + Petal.Width + Petal.Length, 
      data = iris, col= iris$Species)


#상관분석
#두 변수가 서로 어떤 관계에 있는지 파악하는 분석기법
                                                          
#공분산
#각 확률 변수들이 어떻게 분포하는지를 나타내는 것
#x의 편차와 y의 편차를 곱한것의 평균값

#귀무 가설: 두 변수는 서로 상관 관계가 없음(r = 0)
#대립 가설: 두 변수는 서로 상관 관계사 있음(r != 0)

#상관계수- 상관관계의 정도를 파악
#pearson(피어슨) 상관계수 r : 상관분석에서 기본 사용 
#-> -1 ~ +1 사이의 값을 가짐
#+-0.9 이상: 매우 높은 상관관계
# +-0.9 ~ +-0.7: 높은 상관관계
#+-0.7 ~ +-0.4: 다소 낮은 상관관계
#+-0.4 ~ +-0.2: 낮은 상관관계
#+-0.2미만: 상관관계가 없음

#상관계수 식
#x바: 표본집단의 x의 평균
#y바: 표본집단의 y의 평균
#Sx: 표본집단의 x의 표준편차
#Sy: 표본집단의 y의 표준편차
# n: 표본집단의 개수

#kendall(켄달) 상관계수
#spearman(스피어만) 상관계수: 순위, 등급으로 변경해서 사용(학교등급, 졸업학위 성적)

#공분산
cov(mtcars$mpg, mtcars$cyl)
plot(mtcars$mpg, mtcars$cyl)
mtcars$mpg
#상관계수
cor(mtcars$mpg, mtcars$cyl)

plot(mtcars$mpg, mtcars$cyl)

#상관계수 구하기
#x바
n <- length(mtcars$mpg)
mean_x <- mean(mtcars$mpg)
mean_y <- mean(mtcars$cyl)
s_x <- sd(mtcars$mpg)
s_y <- sd(mtcars$cyl)
z_x <- (mtcars$mpg-mean_x) / s_x
z_y <- (mtcars$cyl-mean_y)/s_y
sum(z_x * z_y)/(n-1)

#결측지가 포함된 상관관계
cor(mtcars$mpg, mtcars$cyl, method = 'spearman', use='complete.obs')

#3차원 산점도
install.packages('scatterplot3d')
library('scatterplot3d')

#꽃 종류별 분류
iris$Species
iris_setosa = iris[iris$Species == 'setosa', ]
iris_versicolor= iris[iris$Species == 'versicolor', ]
iris_verginica= iris[iris$Species == 'virginica', ]

#3차원 틀 생성하기
#scatterplot3d(밑변, 오른쪽 변, 왼쪽 변)
d3 <- scatterplot3d(iris$Petal.Length, iris$Sepal.Length, iris$Sepal.Width, type='n')
d3$points3d(iris_setosa$Petal.Length, iris_setosa$Sepal.Length,iris_setosa$Sepal.Width,
            bg='orange', pch=21)
d3$points3d(iris_versicolor$Petal.Length, iris_versicolor$Sepal.Length,iris_versicolor$Sepal.Width,
            bg='blue', pch=23)
d3$points3d(iris_verginica$Petal.Length, iris_verginica$Sepal.Length,iris_verginica$Sepal.Width,
            bg='green', pch=25)

str(trees)

scatterplot3d(trees,type='h', highlight.3d = T,
              angle=55, scale.y = 0.8, pch=3,main='3차원 산점도 tree')
# 3D 원 그래프
exdata <- c(18, 12, 4, 16, 8, 9, 12)
lab <- c('미국', '영국', '호주', '독일', '캐나다', '인도', '한국')
install.packages('plotrix')
library('plotrix')

pie3D(exdata, labels = lab, explode = 0.05, cex=0.5, main='3D pie chart')

legend('bottomright', legend = lab, cex=0.9, fill= rainbow(length(exdata)))

#화신자료 투시도
install.packages('lattice')
library('lattice')
wireframe(volcano, shade= T, aspect = c(61/87,0.4), light.source=c(10,0,10))

wireframe(volcano, shade= T, aspect = c(50/90,2), light.source=c(100,10,10))
#aspect=c(가로/세로,높이)


#ggplot()함수
# 데이터의 각 속성에 크기 모양 색상 등의 미적요소(그래프 속성)를 맵핑한 후
# 스케일링과정을 거쳐 생성된 그래프 객체를 '+' 연산자를 사용하여 미적요소 맵핑을
# 새로운 레이어에서 상속받아 재사용할수 있도록 지원하는 ggplot2패키지의 함수

#aes()함수는 미학으로 데이터의 각 속성에 맵핑될 미적요소만 별도로 지정
#geom_xxx()의 함수를 이용하여 레이어 생성
install.packages('ggplot2')
library('ggplot2')
str(airquality)
#산점도
#aes(x축 변수, y출 변수, color=변수)미적 요소 맵핑
ggplot(airquality, aes(x=Day, y=Temp))+geom_point() # point 차트 추가
ggplot(airquality, aes(x=Day, y=Temp))+geom_point(size=3,color='red')
#선그래프 추가
ggplot(airquality, aes(x=Day, y=Temp))+geom_line()
# 선그래프와 점 차트 추가
ggplot(airquality, aes(x=Day, y=Temp))+geom_line()+geom_point()
# 각 각 차트의 색상, 크기 옵션추가
ggplot(airquality, aes(x=Day, y=Temp))+geom_line(color='pink',size=1)+geom_point(color='blue',size=3)

# 자동차 실린던 빈도수 -> 히스토그램(geom_bar: 막대그래프)
ggplot(mtcars, aes(x=cyl))+geom_bar(width = 0.5)
#factor 그래프 사이 존재하지 않은 값은 표시 X
ggplot(mtcars,aes(x=factor(cyl)))+geom_bar(width=0.5)

ggplot(mtcars,aes(x=factor(cyl)))+geom_bar(aes(fill=factor(gear)))

#선버스트 차트
# 1. 평면위의 위치를 각도로 거리를 사용하여 표시
# 2. 두점 사이의 관계를 각이나 거리로 표현
# 3. 계층 구조 표현

ggplot(mtcars, aes(x=factor(cyl)))+ # cyl를 x축 변수 지정
  geom_bar(aes(fill=factor(gear)))+ # cyl종류별 gear 빈도
  coord_polar()                     # 선버스트 차트로 변환


str(mtcars)

ggplot(mtcars,aes(x=factor(cyl)))+
  geom_bar(aes(fill=factor(gear)))+
  coord_polar(theta='y') #원그래프 변환환

# boxplot() 상자그래프
ggplot(airquality,aes(x=Day, y=Temp, group=Day))+
  geom_boxplot()
# histogram
ggplot(airquality,aes(x=Temp))+geom_histogram(binwidth = 1)

#구글차트
install.packages('googleVis')
library(googleVis)
motion <- gvisMotionChart(Fruits, idvar='Fruit', timevar='Year')
plot(motion)

mydf<- data.frame(country=c('US','GB','BR'), val1=c(10, 13, 14),
                                                val2=c(23, 12, 32))

line <- gvisLineChart(mydf)
plot(line)
line2 <- gvisLineChart(mydf,'country', c('val1','val2'),options= list(
  series='[{targetAxisIndex: 0},{targetAxisIndex:1}]',
  vAxes="[{title: 'val1'},{title:'val2'}]"
))

plot(line2)

bar <- gvisBarChart(mydf)
plot(bar)

column <- gvisColumnChart(mydf)
plot(column)

#연습문제
# 뉴욕대기오염 dataset 사용
# 1. 특정 달의 정보를 추출 (5~9)
library(reshape2)
library(dplyr)
airData<-melt(airquality, id=c('Month','Day'),na.rm = T)%>%
              filter(Month==5)
airData2<-melt(airquality, id=c('Month','Day'),na.rm = T)
select(airData,Month,Ozone,na.rm=T)
str(airData)
airData
oz3<-filter(airData,variable=='Ozone')
oz3
tp3<-filter(airData,variable=='Temp')
tp3
length(tp3$value)
length(oz3$value)
month5<-summarise(airData,O_avg = mean(airquality$Ozone,na.rm= T),O_sd=sd(airquality$Ozone,na.rm=T),
          S_avg= mean(airquality$Solar.R,na.rm = T),S_sd=sd(airquality$Solar.R,na.rm = T),
          W_avg=mean(airquality$Wind,na.rm = T),W_sd=sd(airquality$Wind,na.rm = T),
          T_avg=mean(airquality$Temp,na.rm=T),T_sd=sd(airquality$Temp,na.rm = T))
month5_1<-summarise(O_z=(airquality$Ozone-month5$O_avg)/month5$O_sd, T_z=(airquality$Temp-month5$T_avg)/month5$T_sd)
month5

oz2<-filter(airData2, variable == "Ozone")
oz2<-select(oz,Month, value)
names(oz2)<-c('month','ozone')
tp<-filter(airData,variable=='Temp')
tp<-select(tp,Month,value)
names(tp)<-c('month','temp')
tp
plot(oz$ozone)
oz2
# 2. X변수, y변수를 사용하여 상관분석- 산점도, 상관 계수
plot(oz2$ozone,oz2$month,color="pink",main="")
ggplot(oz2,aes(x=ozone,y=month))+geom_point(color='pink',)
oz_m<-mean(oz3$value)
tp_m<-mean(tp3$value)
oz_sd<-sd(oz3$value)
tp_sd<-sd(tp3$value)
n<-length(oz3$value)
o_z<-(oz3$value-oz_m)/oz_sd
t_z<-(tp3$value-tp_m)/tp_sd
o_z
t_z
sum(o_z*t_z)/(n-1)
cor(oz3$value,tp3$value)
# 3. 변수 4개를 사용하여 상관분석
pairs(airData2[airData2$variable=="Ozone",1:4])
# -산점도 행렬
# R함수, ggplot2, goole chart
str(airquality)
airquality$Month
