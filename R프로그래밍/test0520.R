#단순회귀분석
y= diamonds$price
x= diamonds$price
df<-data.frame(x,y)
df
result_lm <- lm(formula = y ~ x, data = df)
result_lm

names(result_lm)
fitted.values(result_lm)[1:2]
head(df,1)

plot(price~carat,data=diamonds)
result.lm <- lm(price~carat, data = diamonds)
result.lm
abline(result.lm,col='red')

#다중회귀분석
str(diamonds)
re_lm<- lm(price~carat+cut+color,data = diamonds)
re_lm
library("car")
vif(re_lm)
summary(re_lm)




#실시간 뉴스 수집과 분석
#해당 웹 문서를 수집하기 위해서는 URL을 통해 웹문서 소스형태로 수집하고, 
#HTML 문서로 바꾸는 과정이 필요

#원격서버의 URL 요청
install.packages("httr")
library(httr)

#HTML 문서 파싱
#파싱(parsing): 어떤 페이지에서 사용자가 원하는 데이터를 특정 패턴이나 순서로
#추출하여 정보를 가공하는 것
install.packages("XML")
library(XML)
url <- "https://media.daum.net"
web<- GET(url)
web
#HTML 파싱
#htmlTreeParse(소스, userInteralNodes, trim, encoding)
#url 소스 -> html태그 파싱
#userInteralNodes: 소스 내부의 노드로 변환 여부 지정
#trim: 텍스트의 맨앞과 맨뒤의 공백제거 여부 지정
#encoding: 문자셋 인코딩 방식
html <- htmlTreeParse(web,useInternalNodes=T, trim=T, encoding ="utf-8" )
rootNode<-xmlRoot(html) #최상위 노드 찾기
rootNode

#태그 자료 수집하기
news <- xpathSApply(rootNode,"//a[@class='link_txt']", xmlValue)
View(news)
news
#자료 전처리하기-수집한 문서를 대상으로 불용어 제거
#이스케이프 제거
news_pre <-gsub("[\r\n\t]",'',news)
#단순회귀분석
y= diamonds$price
x= diamonds$price
df<-data.frame(x,y)
df
result_lm <- lm(formula = y ~ x, data = df)
result_lm

names(result_lm)
fitted.values(result_lm)[1:2]
head(df,1)

plot(price~carat,data=diamonds)
result.lm <- lm(price~carat, data = diamonds)
result.lm
abline(result.lm,col='red')

#다중회귀분석
str(diamonds)
re_lm<- lm(price~carat+cut+color,data = diamonds)
re_lm
library("car")
vif(re_lm)
summary(re_lm)




#실시간 뉴스 수집과 분석
#해당 웹 문서를 수집하기 위해서는 URL을 통해 웹문서 소스형태로 수집하고, 
#HTML 문서로 바꾸는 과정이 필요

#원격서버의 URL 요청
install.packages("httr")
library(httr)

#HTML 문서 파싱
#파싱(parsing): 어떤 페이지에서 사용자가 원하는 데이터를 특정 패턴이나 순서로
#추출하여 정보를 가공하는 것
install.packages("XML")
library(XML)
url <- "https://media.daum.net"
web<- GET(url)
web
#HTML 파싱
#htmlTreeParse(소스, userInteralNodes, trim, encoding)
#url 소스 -> html태그 파싱
#userInteralNodes: 소스 내부의 노드로 변환 여부 지정
#trim: 텍스트의 맨앞과 맨뒤의 공백제거 여부 지정
#encoding: 문자셋 인코딩 방식
html <- htmlTreeParse(web,useInternalNodes=T, trim=T, encoding ="utf-8" )
rootNode<-xmlRoot(html) #최상위 노드 찾기
rootNode

#태그 자료 수집하기
news <- xpathSApply(rootNode,"//a[@class='link_txt']", xmlValue)
View(news)
news
#자료 전처리하기-수집한 문서를 대상으로 불용어 제거하기
#gsub()함수를 이용하여 전처리
news_pre<-gsub("[\r\n\t]",'',news)
news_pre<-gsub('[[:punct:]]','',news_pre) #문장부호 제거
news_pre<-gsub('[[:cntrl:]]','',news_pre)#특수문자 제거
news_pre<-gsub('\\d+','',news_pre) #숫자 제거생략 (코로나19숫자 유지)
news_pre<-gsub('[a-z]+','',news_pre)#영문자 제거
news_pre<-gsub('[A-Z]+','',news_pre)
news_pre<-gsub('\\s+','',news_pre)#2개 이상 공백 교체
news_pre

#기사와 관계없는 검색어 순위 등의 내용 제거
news_data <-news_pre[1:59]
news_data
#파일 저장
setwd("D:/jsp_pr/resource")
write.csv(news_data,"news_data.csv",quote=F)

news_data<-read.csv("news_data.csv",header = T,stringsAsFactors = F)
str(news_data)
names(news_data)<-c("no","news_text")
head(news_data)
news_text<-news_data$news_text
news_text

#토픽분석
#패키지 설치
install.packages("KoNLP")
library("KoNLP")
install.packages("tm")
install.packages("wordcloud")
library("tm")
library("wordcloud")
#추가 단어 만들기
user_dic <- data.frame(term=c("백신예방접종","코로나19","집단감염"),tag='ncn')
#세종사전에 단어추가
buildDictionary(ext_dic="sejong",user_dic=user_dic)


library(readxl)
co_data<-read.csv("res/covid.csv",header = T,stringsAsFactors = F)
str(co_data)
con_data<-co_data$"접촉력"
con_data
substr(con_data[1],1,5)

library("tm")
cor_covi=Corpus(VectorSource(con_data))
cor_covi_TM <- tm_map(cor_covi,stripWhitespace)
cor_covi_TM<-tm_map(cor_covi_TM,removePunctuation)
cor_covi_TM=tm_map(cor_covi_TM,removeNumbers)
cor_covi_TM=tm_map(cor_covi_TM,tolower)

coData <- DocumentTermMatrix(cor_covi_TM)
inspect(coData)
coData
install.packages("rJava")
install.packages("memorise")
install.packages("KoLNP")
library("KoNLP")


install.packages("https://cran.rstudio.com/bin/windows/contrib/3.4/KoNLP_0.80.1.zip",
                 repos= NULL)
install.packages("Sejong")
install.packages("wordcloud")
install.packages("tm")
library("KoNLP")
install.packages("RSQLite")
install.packages("KoNLP")
library("RSQLite")
