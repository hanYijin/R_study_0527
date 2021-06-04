#공공데이터 오픈 API
install.packages("XML")
library(XML)
library(ggplot2)

#공공데이터 요청주소
api <-"http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getMinuDustFrcstDspth"
# 개인 api키
apikey <-"H7J7uLgD9PdCIm3xPaTGiRqsInYdN2ANv42apuqJVqFywsRVGkqG5Znn0Q6NqulKUbw1%2FXlS%2FwFuRsgj1o4KPg%3D%3D"

#요청변수
returnType <- "xml"
numOfRows <- 100
pageNo <- 1
InformCode <- "PM10"
#주소열 합치기
url <- paste(api,"?serviceKey=",apikey,"&returnType=", returnType, "&numOfRows=", numOfRows,
             "&pageNo=",pageNo,"$InformCode=",InformCode,sep="")#문자열 연결
url
#xml 파싱하기
xmlFile <- xmlParse(url)
xmlRoot(xmlFile)
df <- xmlToDataFrame(getNodeSet(xmlFile,"//items/item"))
df


#데이터 시각화
library(ggplot2)
ggplot(data=df,aes(x=dataTime,y=informCode)) + geom_bar(stat="identity", fill= "pink")
 
ggplot(data=df,aes(x=dataTime,y=informCode)) + geom_bar(stat="identity", fill= "pink")+
  theme(axis.text.x = element_text(angle=90))+#x축 눈금 라벨 90도 회전 
  labs(title="대기질 예보통보 조회", x="통보날짜", y="통보코드")

ggplot(data=df,aes(x=dataTime,y=informCode, fill=informCode)) + geom_bar(stat="identity")+
  theme(axis.text.x = element_text(angle=90))+#x축 눈금 라벨 90도 회전 
  labs(title="대기질 예보통보 조회", x="통보날짜", y="통보코드")+
  scale_fill_manual(values = rainbow(10))

api <-"http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getMinuDustWeekFrcstDspth"
apikey <-"H7J7uLgD9PdCIm3xPaTGiRqsInYdN2ANv42apuqJVqFywsRVGkqG5Znn0Q6NqulKUbw1%2FXlS%2FwFuRsgj1o4KPg%3D%3D"

returnType <-"xml"
numOfRows <-100
pageNo <- 1

url<- paste(api, "?serviceKey=", apikey,"&returnType=",returnType,"&numOfRows=",numOfRows,
            "$pageNo=",pageNo,"$InformCode=",InformCode,sep="")
url
xmlFile2 <-xmlParse(url)
xmlRoot(xmlFile2)
df2 <- xmlToDataFrame(getNodeSet(xmlFile2,"//items/item"))
df2

library(ggplot2)
ggplot(data = df2,aes(x=dataTime,y=informCode))+
  geom_bar(stat = "identity",fill="pink")+
  theme(axis.title.x = element_text(angle = 90))+
  labs(title="초미세 먼지 주간예보", x="통보날짜",y="통보코드")
