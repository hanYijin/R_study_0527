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
