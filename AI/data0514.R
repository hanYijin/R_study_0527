
library(googleVis)
library(ggplot2)

str(women)
gScatter <- gvisScatterChart(women,
                             options = list(
                               legend='none',
                               lineWidth=2, pointSize=0,
                               title='Women',
                               vAxis="{title:'weight (lbs)'}",
                               hAxis="{title:'height (in)'}",
                               width=300, height=300))
plot(gScatter)

str(OpenClose)
gCandle <- gvisCandlestickChart(OpenClose,
                                options = list(legend='none'))
plot(gCandle)

gPie <- gvisPieChart(CityPopularity)
plot(gPie)

str(CityPopularity)
gauge <- gvisGauge(CityPopularity, labelvar = 'jfkdj',
                   numvar = 'dfdf',
                   options = list(min=0, max=1000))
plot(gauge)

str(OpenClose)
gauge2 <- gvisGauge(OpenClose, labelvar = '',
                   numvar = '',
                   options = list(min=0, max=1000))
plot(gauge2)

gauge3 <- gvisGauge(CityPopularity, 
                   options=list(min=0, max=1000,
                                greenFrom=800, greenTo=1000,
                                yellowFrom=500, yellowTo=800,
                                redFrom=0, redTo=500,
                                width=400, height=300))
plot(gauge3)

str(Exports)
g1a <- gvisGeoChart(Exports,
                    locationvar = 'Country',
                    colorvar = 'Profit')
plot(g1a)

g1b <- gvisGeoChart(Exports,
                    locationvar = 'Country',
                    colorvar = 'Profit',
                    options = list(projection='kavrayskiy-vii'))
plot(g1b)

# 유럽 지역
g2b <- gvisGeoChart(Exports, 'Country', 'Profit',
                    options = list(region='150'))
plot(g2b)

city <- c('서울특별시', 'Daegu', 'Busan', 'Gwangju')
val <- c(12, 8, 10, 6)
kor <- data.frame(city, val)
kor
g3b <- gvisGeoChart(kor, 'city', 'val',
                    options = list(region='KR',
                                   displayMode='regions',
                                   resolution='provinces',
                                   width=600, height=400))
plot(g3b)

# 미국 각 주의 문맹률
library(datasets)
str(state.x77)
str(state.name)
states <- data.frame(state.name, state.x77)
gStates <- gvisGeoChart(states, 'state.name', 'Illiteracy',
                        options=list(region='US',
                                     displayMode='regions',
                                     resolution='provinces',
                                     width=600, height=400))
plot(gStates)

# 지진정보
library(readxl)
eq <- read.csv('http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_week.csv')
str(eq)
eq$loc = paste(eq$latitude, eq$longitude, sep=':')
eq$loc
str(eq)
g3 <- gvisGeoChart(eq, 'loc', 'depth', 'mag',
                   options = list(gvis.editor='EQ',
                                  width='800', height='600',
                                  displayMode='Markers',
                                  colorAxis="{color:['purple', 'red', 'orange', 'gray']}",
                                  backgroundColor='lightblue'), chartid = 'EQ')
plot(g3)

# airquality 에서 특정 달의 날짜와 온도 정보를 추출하여
# 온도 >= 75 인 정보만 gauge 차트 출력.
# 온도 범위 0 ~ 100
# 색상 범위 yellow : 25%, green: 50%, red: 25%

# 1. data.go.kr 에서 임의의 정보를 추출하여 gvisGeoChart 출력
# 2. 행정구역_시군구_별__성별_인구수 csv or excel 데이터 사용 가능
# 3. 주민등록 인구 및 세대현황 csv or excel 데이터 사용 가능










                             
                             
                             