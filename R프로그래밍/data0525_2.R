#텍스트 마이닝
# KoNLP: 사전을 통해 문서에 포함된 단어의 품사를 분석

#패키지 설치
#빈도수별 단어 구름형태 표현, 단어 빈도 시각화
install.packages("wordcloud2")
# 세종 사전
install.packages("Sejong")
# hash테이블
install.packages("hash")

install.packages("rJava")
# 텍스트 분석
install.packages("tau")
# 텍스트 가공
install.packages("tm")
install.packages("devtools")
install.packages("KoNLP")
library("KoNLP")
useSejongDic()
remotes::install_github('haven-jeon/KoNLP',upgrade = "never",INSTALL_opts=c("--no-multiarch"))

library("KoNLP")
#시스템 사전
useSystemDic()
# 세종 사전
useSejongDic()
# NIA 사전
useNIADic()


useSejongDic()
# 1. 형태소 분석
docData <- "롯데마트가 판매하고 있는 흑마늘 양념 치킨이 논란이 되고 있다."
# 1) 명사 추출
extractNoun(docData)
# KAIST tag 9개 품사
SimplePos09(docData)
SimplePos22(docData)
MorphAnalyzer(docData)

exData<-c("아버지께서 방에 스르륵 들어가신다.")
extractNoun(exData)
MorphAnalyzer(exData)

useNIADic()
exData<-c("아버지께서 방에 스르륵 들어가신다.")
extractNoun(exData)
MorphAnalyzer(exData)

useSejongDic()
chData <- c("스르륵")
#mag 일반부사 -> nch 명사로 사용
buildDictionary(ext_dic = "woorimalsam",
                user_dic = data.frame(chData,c("nch")),replace_usr_dic = T)
extractNoun(exData)
MorphAnalyzer(exData)

txtData <-"R은 오픈소스로 통계, 기계학습, 금융, 생물정보학, 그래픽스에 이르는 다양한 
통계 패키지를 갖추고 있는 좋은 프로그램이다."

extractNoun(txtData)
exData <-c("오픈소스","기계학습","생물정보학","다양한")
buildDictionary(ext_dic = "woorimalsam",
                user_dic = data.frame(exData,c("ncn")),replace_usr_dic = T)
extractNoun(txtData)

library(dplyr)
library(ggplot2)
 
txtData2 <- "1993년 뉴질랜드에 위치한 오클랜드 대학교에서 개발된 통계 및 그래프 작업을 위한 인터프리터 프로그래밍 언어이다. 
R이 가지는 특이사항 중 하나로, color를 colour라고 쓰는 것 또한 인정된다. 
영국식 영어를 사용하는 뉴질랜드에서 개발돼서 얻은 특징인듯."

sejongRes <- MorphAnalyzer(txtData2)
sum(sapply(sejongRes, length))

useNIADic()
niaRes<-MorphAnalyzer(txtData2)
sum(sapply(niaRes, length))

library(data.table)
install.packages("data.table")
rbindRes <- rbind(data.table(dic=names(sejongRes),count=sapply(sejongRes, length),kind="sjong 사전"),
                  data.table(dic= names(niaRes),count=sapply(niaRes,length),kind="nia 사전"))

ggplot(rbindRes,aes(dic, count))+
  geom_bar(stat="identity", aes(fill=kind),Position="dodge")+
  coord_flip()+ggtitle("형태소 분석 결과 빈도")
