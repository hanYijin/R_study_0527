#데이터 조작
#dplyr 패키지 활요
# 주요함수
# filter(): 데이터 셋에서 조건에 맞는 데이터 셋을 추출하는 기능
# arrange(): 데이터 셋의 특정 칼럼으로 정렬하는 기능
# select(): 데이터 셋을 대상으로 칼럼을 선택하는 기능
# mutate(): 데이터 셋에 새로운 칼럼을 추가하는 기능
# summarise(): 데이터 셋의 특정 칼럼으로 요약 집계 기능
# group_by(): 데이터 셋으 집단변수을 이용하여 그룹화하는 기능
# join(): 데이터 프레임과 데이터프레임을 결합하는 기능
# bind(): 행 또는 열단위로 데이터프레임을 합치는 기능
# names(): 칼럼 이름을 변경하는 기능

# 파이프 연산자(%>%)를 이용한 함수 적용
# 데이터프레임을 조작하는데 필요한 함수를 순차적으로 적용할 경우 사용하는 연사자
install.packages("dplyr")
library(dplyr)


#칼럼으로 데이터 검색

select(ex,ID,AGE)

select(ex,ID:AREA)

# 칼럼으로 데이터 정렬

arrange(ex,AGE,Y17_CNT)

#내림차순
arrange(ex,desc(AGE))

#조건에 맞는 데이터 필터링
# & : and 연산자
# | : or 연산자
filter(ex, AGE >30 | SEX =="F")

# 데이터 셋에 칼럼추가
mutate(ex, AMT= Y17_AMT + Y16_AMT)

#요약통계 구하기 
#summarise(데이터프레임,추가할 칼럼명=함수(칼럼명))

    
summarise(ex,cnt=n(),avg_AGE=mean(AGE))
# 표준편차: sd()와 분산 계산: var()
summarise(ex,arrAGE=sd(AGE,na.rm=T),arrAGEVar=var(AGE,na.rm=T))

#집단변수 대상 그룹화
group_by(ex,AREA)%>% summarise(SUM_AMT17_BY_AREA=sum(Y17_AMT))

#데이터프레임 병합
#inner_join(c1,c2,x): c1과 c2 모두 x칼럼이 존재하는 관측치만 병합
#left_join(c1,c2,x): 왼쪽 c1의 x칼럼을 기준으로 병합
#ringt_join(c1,c2,x): 오른쪽 c2의 x칼럼을 기준으로 병합
#full_join(c1,c2,x): c1, c2 중 x 칼럼이 있으면 모두 병합

#데이터프레임 합치기
#bind_rows(c1,c2): 행단위
#bind_cols(c1,c2): 열단위

#칼럼명 수정하기
#rename(데이터프레임, 변경후=변경전)
ex2<-rename(ex,age=AGE)
ex2

#reshape2 패키지활용
#melt(), dcast()/acast() 함수만을 적용하여 집단변수를 통해 데이터의 구조를 유연하게 변경해주는 기능 제공
#melt(데이터,id.vars= 식별자 컬럼들, measure.vars= 측정치 컬럼들)
# measure.vars가 생략되면 id.vars에 해당하지 않은 모든 컬럼이 측정치 컬럼이 됨.

#melt()함수는 식별자id, 측정 변수 variable, 측정치 value 형태로 데이터를 재구성하는 함수

# 데이터셋의 구조로 변경하기
