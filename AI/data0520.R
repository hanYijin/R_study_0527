# 회귀분석
# 독립변수와 종속변수의 인과관계를 파악하여, 종속변수를
# 독립변수로부터 설명하고 예측하는 분석.
# 독립변수: 다른 변수에 영향을 받지 않는 변수
# 종속변수: 독립변수에 영향을 받아서 값이 변하는 변수

# 단순회귀분석
# 독립변수가 1개.
# 독립변수 1단위의 증감에 따라 종속변수가 어느 정도
# 변하는지를 예측.
# 회귀식: 독립변수에 의한 종속변수의 값을 예측해주는
# 선형함수식: Y = Xa + b
# Y:종속변수, X:독립변수
# a:독립변수의 증감 정도
# b:독립변수로부터 영향을 받지 않는 값
# 산점도에서 데이터를 가장 잘 설명할수있는 선을 찾는 
# 분석

library(ggplot2)
str(diamonds)
dia <- lm(price ~ carat, data=diamonds)
dia
# 결정계수: 85%, Adjusted R-squared:  0.8493
# 독립변수가 만약에 2개 이상인겨우에는 더 많은
# 변화량을 설명하기 때문에 결정계수가 커지는 
# 경향이 있음.
#Residual standard error: 1549 on 53938 degrees of freedom
#Multiple R-squared:  0.8493,	Adjusted R-squared:  0.8493
#F-statistic: 3.041e+05 on 1 and 53938 DF,  p-value: < 2.2e-16
# p < 0.05 : 통계적으로 유의미 하다 판단.

# 잔차: 예상치와 실제 관측치의 차이
# 1. 잔차분포 그래프
# y축 0을 기준으로 고르게 분포하는게 좋음.
# 2. 정규화 관련
# 해당 점선에 잔차들이 놓여 있으면 정규성을 만족.
# 3. 잔차를 표준화해서 제곱
# x축: 선형회귀로 예측된 관측치
# y축: 표준화 잔차
# 기울기가 0인 직선형태가 좋고 점들도 고르게 분포.
# 4. 영향점 판별 그래프
# x축: Leverage, Y축: 표준화된 잔차
# x축: 변수가 얼마나 벗어나있는지 의미.
# outlier: 주어진 회귀모델에서 잘 설명되지 않는 
# 데이터
summary(dia)
par(mfrow=c(2,2))
plot(dia)
library(car)
outlierTest(dia)

# 다중회귀분석
# 종속변수1개, 독립변수가 2개 이상인 회귀분석
# 맛집(종속변수), 음식맛, 분위기, 청결, 가격, 위치..
library(readxl)
csvIns <- read.csv('res/insurance.csv')
# 범주형(분류 목적): sex, smoker, region
# 수치형(일정기간, 연속적인 수치): age, bmi, children, charges
summary(csvIns)

hist(csvIns$charges)
hist(csvIns$bmi)
table(csvIns$region)

library(psych)
scaMatrix <- csvIns[c("age", "bmi", "children", "charges")]
pairs.panels(scaMatrix)

# -1 ~ +1
cor(scaMatrix)

# 다중회귀분석
lmins <- lm(charges ~ age+children+bmi+sex+smoker+
              region, data=csvIns)
lmins
summary(lmins)

# 모델 성능 개선
# 1.의료비 지출에 대한 연령의 영향은 전 연령에 걸쳐
# 일정하지 않다.
# 20->30대 비용증가폭보다 60->70대 비용증가폭이 크다.
# y = a + b1x + b2x^2
csvIns$age2 <- csvIns$age^2

# 2.비만인 사람들은 의료비가 많이 발생하지만,
# 정상체중인 사람들은 적게 발생.
csvIns$bmi30 <- ifelse(csvIns$bmi >= 30, 1, 0)

# 3. bmi30 x smoker 이 경우 의료비 지출에 크게
# 영향을 미친다.

lmins2 <- lm(charges ~ age+age2+children+bmi+sex+
               (bmi30*smoker)+region, data=csvIns)
summary(lmins2)

# 추가 개선 모델
# 후진소거법, 전진선택법, 부분집합선택법
# step() - 의미없는 독립변수 제거
# 후진소거법: 회귀모델에서 AIC가 큰 변수를 
# 삭제하면서 AIC가 작은7 변수를 찾아 적용하는 방법
# AIC: 최고의 성능을 가진 모델(AIC값이 0인 모델)과
# 각 비교되는 모델간의 상대적 차이값
lmins3 <- step(lmins2, direction = "backward")
summary(lmins3)

# diamonds dataset을 다중회귀분석 처리













