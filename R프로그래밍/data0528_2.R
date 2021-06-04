library(readxl)
library(caret)
install.packages("caret")
creditData <- read.csv("res/credit.csv", stringsAsFactors = T)
View(creditData)

# 대출기간
summary(creditData$months_loan_duration)
# 대출금액
summary(creditData$amount)

#default = no: 미상환, yes:상환
table(creditData$default)

set.seed(12345)
# order() : 오름차순으로 정렬, 결측치 제거
creditRandData <-creditData[order(runif(1000)),]
head(creditData$amount)
head(creditRandData$amount)

#학습용: 900명, 테스트용:100명
creditTrain <- creditData[1:900, ]
creditTest <- creditRandData[901:1000, ]
# R에서는 비율을 구하는 방법 중 matrix 테이블을 한번에 proportion(비율) 테이블로 변환
prop.table(table(creditTrain$default))
prop.table(table(creditTest$default))

#C50은 정보획득량을 기준으로 결정트리를 시각화
library(C50)
install.packages("C50")
creditModel <- C5.0(creditTrain[-17], creditTrain$default)
summary(creditModel)

creditPred <- predict(creditModel, creditTest)
table(creditPred)

install.packages("gmodels")
library(gmodels)
CrossTable(creditTest$default,creditPred, dnn=c("Actual","prdict"))

# chi-square 검정: 교차분석으로 얻어진 교차 분할표를 대상으로 유의 확률(p값)을 
# 적용하여 변수들 간의 독립성 및 관련성 여부등을 검정하는 분석.

# 앙상블 기법
# 단독 모델로 예측하는 것이 아닌 여러 모델을 생성하여 예측하고 평균을 통해 이 결과를 예측
# 1. Boosting: 가중치를 이용하여 약한 학습기를 강한 학습기로 만드는 방법

# 2.Bagging: 부트스크랩을 집계하는 것.
# 부트스크랩: random sampling을 적용하는 방법
# - 학습 데이터가 충분하지 않더라도 부트스크랩을 집계하여 충분한 학습효과를 주는 효과
# - 램덤 포레스트 분석

creditBoost10 <- C5.0(creditTrain[-17], creditTrain$default, trials= 10)
summary(creditBoost10)
creditBoost10Pred <- predict(creditBoost10,creditTest)
CrossTable(creditTest$default, creditBoost10Pred, dnn=c("Actual", "predict"))

creditBoost100 <- C5.0(creditTrain[-17], creditTrain$default, trials= 100)
summary(creditBoost10)
creditBoost10Pred <- predict(creditBoost100,creditTest)
CrossTable(creditTest$default, creditBoost100Pred, dnn=c("Actual", "predict"))
