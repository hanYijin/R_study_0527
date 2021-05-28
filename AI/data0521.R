library(devtools)
library(ggmap)

apikey = 'AIzaSyD7gpTZYkQdVsLaSKNpS-70gGN0IYIYlck'

register_google(apikey)
ggDaegu <- get_googlemap('daegu', maptype='hybrid')
ggmap(ggDaegu)


library(dplyr)
library(ggplot2)

findName <- "동대구역"
geoCode <- enc2utf8(findName) %>% geocode()
geoData <- as.numeric(geoCode)

# "terrain", "satellite", "roadmap", "hybrid"
get_googlemap(center = geoData, maptype = "roadmap", zoom=17) %>% ggmap() +
  geom_point(data=geoCode, aes(x=lon, y=lat), size=4,
             alpha=0.9, col="red")

library(readxl)
library(stringr)
pop2019 <- read.csv(file.choose(), header = T)
pop2019

region <- pop2019$"지역명"
lon <- pop2019$LON
lat <- pop2019$LAT
totPop2019 <- as.numeric(str_replace_all(pop2019$"총인구수", ",", ""))

popDf <- data.frame(region, lon, lat, totPop2019)
popDf <- popDf[1:17, ]
popDf

# 정적 지도 이미지
baseMap <- c(left=123.4423013, bottom=32.8528306,
             right=131.601445, top=38.8714354)
map <- get_stamenmap(baseMap, zoom=7, maptype = 'watercolor')
layer1 <- ggmap(map)
layer1

# 포인트 추가
layer2 <- layer1 + geom_point(data=popDf, aes(x=lon, y=lat, color=factor(totPop2019),
                                              size=factor(totPop2019)))
layer2

# 텍스트 추가
layer3 <- layer2 + geom_text(data=popDf, aes(x=lon+0.01, y=lat+0.08, label=region),
                             size=3)
layer3

imgName <- "2019년도지역별인구수.png"
ggsave(imgName, scale = 1, width=10.24, height = 7.68)






















