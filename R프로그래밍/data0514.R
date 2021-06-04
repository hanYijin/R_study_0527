library(googleVis)
library(ggplot2)
#분산형 차트 gvisScatterChart (data, options = list (), chartid)
str(women)
gScatter<- gvisScatterChart(women, options= list(legend='none', 
                           lineWidth=2, pointSize=0, title='Womaen', 
                           vAxis="{title:'weight(lbs)'}",
                           hAxis="{title:'height(in)'}",
                           width=300, height=300))
plot(gScatter)
#캔들 스틱 차트
str(OpenClose)
gCandle <- gvisCandlestickChart(OpenClose,options = list(legend='none'))
plot(gCandle)

#원형 차트
str(CityPopularity)
gPie<-gvisPieChart(CityPopularity)
plot(gPie)

#게이지 gvisGauge (data, labelvar = "", numvar = "", options = list (), chartid)
gauge <- gvisGauge(CityPopularity, labelvar = 'city', 
                   numvar = 'Popularity', option= list(min=0,max=1000))
plot(gauge)

gauge <- gvisGauge(CityPopularity, options = list(min=0,max=1000, greenFrom=800,
                                                  greenTo=1000, yellowFrom=500,yellowTo=800,
                                                  redFrom=0,redTo=500, width=400, height=300))
plot(gauge)
str(OpenClose)
gagueOC <- gvisGauge(OpenClose,labelvar = 'Weekday', numvar = 'Hight', options = list(min=0,max=100) )
plot(gagueOC)


#지도
str(Exports)
gla <- gvisGeoChart(Exports,locationvar = 'Country', colorvar = 'Profit')
plot(gla)

# 옵션 추가 projection 투사 = '스타일'
glb <- gvisGeoChart(Exports,locationvar = 'Country', colorvar = 'Profit', 
                    options = list(projection ='kavrayskiy-vii')) #원근감 추가
plot(glb)

g2b <- gvisGeoChart(Exports,locationvar = 'Country', colorvar = 'Profit', 
                    options = list(region='150')) #부분 확대
plot(g2b)


city <- c('Seoul', 'Daegu','Busan','Gwangju')
val <- c(12, 8, 10, 6)
kor<-data.frame(City=city,value=val)
kor
#displayMode='regions'부분확대 모드 resolution='provinces' 지방단위
g3b <- gvisGeoChart(kor,'City', 'value',
                    options = list(region='KR',displayMode='regions',
                                   resolution='provinces', width=600, height=400))
plot(g3b)

library(datasets)
#미국 각 주의 문맹률
states <- data.frame(state.name, state.x77)
states
str(state.x77)
str(state.name)
gStates <- gvisGeoChart(states,'state.name','Illiteracy',
                        options = list(region='US', displayMode='regions',
                                       resolution='provinces',
                                       width=600,height=400))
plot(gStates)
      
library(readxl)
#웹서버 상의 데이터 csv 파일 저장
eq <- read.csv('http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_week.csv') 
str(eq)
#위도:경도 칼럼(loc) 추가
#paste(): 원소 나열 함수
eq$loc = paste(eq$latitude,eq$longitude,sep = ':')

eq$loc
g3<-gvisGeoChart(eq,'loc','depth','mag',
             options = list(gvis.editor='EQ', width='800', height='600',
                            displayMode='Markers',
                            colorAxis="{color:['purple','red','orange','gray']}",
                            backgroundColor='lightblue'),chartid = 'EQ')
plot(g3)

# airquality 에서 특정 달의 날짜와 온도 정보를 추출하여
#온도 >=74 인 정보만 gauge 차트 출력
# 온도 범위: 0~100
# 색상 범위 25%: yellow, 50%:green, 25%: red

library('dplyr')
library('reshape2')
str(airquality)
head(airquality)
#5월달 온도 74도 이상인 데이터 추출
tp <- filter(airquality,Month==5 & Temp >= 74)%>%select(Day,Temp)
tp2<-select(tp,Temp)
tp2
tpGauge <- gvisGauge(tp2,labelvar = 'Temp', numvar = 'Temp', options = list(min=0, max=100,
                                                                          yellowFrom=0,yellowTo=25,
                                                                          greenFrom=25,greenTo=75,
                                                                          redFrom=75,redTo=100,
                                                                          width=600, height=400))
plot(tpGauge)
# data.go.kr에서 임의의 정보를 추출하여 gvisGeoChart 출력
# 행정구역별 인구수.csv or excel 데이터 사용
library(readxl)
addr<-read.csv('res/행정구역별 인구수.csv')
View(addr)
str(addr)

names(addr)<-c("regions","2_all","2_m","2_w","3_all","3_m","3_w","4_all","4_m","4_w")
addr
addr<-select(addr,regions,"4_all","4_m","4_w")
names(addr)<-c("regions","all","man","women")

addrGeo <- gvisGeoChart(addr,"regions","all",options = list(region="KR", displayMode='regions',
                                                            resolution='provinces', width=600, height=400))
plot(addrGeo)
