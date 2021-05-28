#--------------------------------
#           [dplyr]
#--------------------------------
# 1.filter    - 조건에 맞는 행 추출
# 2.arrange   - 지정한 열을 기준으로 정렬
# 3.select    - 열 추출
# 4.mutate    - 열 추가
# 5.summarize - 데이터 요약
# 6.distinct  - 중복 값 제거
# 7.group_by  - 데이터 그룹 생성
# 8.sample_n  - n개의 샘플 추출
# 9.sample_frac - n% 비율의 샘플 추출
# 10.%>%      - 함수 연결
library(dplyr, warn.conflicts = FALSE)

mtcars
nrow(mtcars)
str(mtcars)

filter(mtcars, cyl==4)
filter(mtcars, cyl>=6 & mpg > 20)
# wt를 기준으로 오름차순, hp는 내림차순
head(arrange(mtcars, wt, desc(hp)))
head(arrange(mtcars, mpg, desc(wt)))

select(mtcars, am, gear)
select(mtcars, mpg, cyl, carb)

mutate(mtcars, years='1974')
head(mutate(mtcars, mpg_rank=rank(mpg)))

distinct(mtcars, cyl)
distinct(mtcars, cyl, gear)

summarise(mtcars, cyl_mean=mean(cyl),
          cyl_min=min(cyl),
          cyl_max=max(cyl))
summarise(mtcars, mean(cyl), min(cyl), max(cyl))

gr_cyl <- group_by(mtcars, cyl)
gr_cyl
# gr_cyl에서 cyl별 개수 요약 정보
summarise(gr_cyl, n())

# gear 중복값을 제외하고 cyl별 개수 요약 정보
summarise(gr_cyl, n_distinct(gear))

sample_n(mtcars, 10)
sample_frac(mtcars, 0.2)

# cyl별로 그룹으로 묶고 개수로 요약
group_by(mtcars, cyl) %>% summarise(n())

mp_rank <- mutate(mtcars, mpg_rank=rank(mpg))
# mpg_rank를 기준으로 오름차순 정렬
arrange(mp_rank, mpg_rank)

mutate(mtcars, mpg_rank=rank(mpg)) %>% arrange(mpg_rank)

#-----------------------------------------
# 연습
# 1. library(dplyr), library(hflights) 설치
# 2. 1월 2일 데이터 추출
# 3. 1월 or 2월 데이터 추출
# 4. 도착시간을 기준으로 오름차순 정렬
# 5. Year, Month, DepTime, ArrTime 데이터 검색
# 6. 도착지연 시간을 구한 후 새로운 컬럼 추가
#    도착시간지연: ArrTime-DepTiem
# 7. 비행시간 평균 (NA 제거)
# 8. 도착시간(ArrTime)의 표준편차, 분산 구하기







