# 8 카이제곱 분포와 카이제곱 검정

# 독립성검정과 적합성 검정
# 교차표를 통해 범주형으로 수집된 두 변수의 조합별 빈도 파악
# 독립성 검정: independence test
# 두 범주형 변수 간의 관련성이 모집단에서 존재하는지 검정
# 적합성 검정: goodness of fit test
# 두 개 이상의 범주를 갖는 범주형 변수의 범주별 비율의 분포를 관측
# 관측된 범주별 빈도로 모집단에서 기대되는 비율 분포가 존재하는지 검정

# 카이스퀘어 검정: chi-square test
# 교차표상의 응답 빈도를 바탕으로 범주형 변수 간의 관련성 검정
# 예) 안전벨트 차굥과 승객 안전 간의 관계 분석
# 교통사고 환자의 안전벨트 착용 유무와 환자 상태를 조사한 교차표
survivors <- matrix(c(1443,151,47,1781,312,135), ncol=2)
dimnames(survivors) <- list('Status'=c('minor injury', 'serious injury', 'dead'),
                            'Seatbelt'=c('With Seatbelt','Without Seatbelt'))
survivors

# 두 변수 간의 관계 파악을 위해 교차표에 합계와 비율을 추가
addmargins(survivors)

addmargins(prop.table(addmargins(survivors, 2), 2), 1)

# 안전벨트 착용과 안전 간의 관계 파악을 위한 막대그래프 그리기
par(mfrow=c(1,2))
barplot(survivors, ylim=c(0,2500), las=1,
        col=c('yellowgreen','lightsalmon','orangered'),
        ylab='Frequency', main='Frequency of Survivors')
legend(0.2,2500,rownames(survivors),
       fill=c('yellowgreen','lightsalmon','orangered'))
survivors.prop <- prop.table(survivors,2)
barplot(survivors.prop*100, las=1, col=c('yellowgreen','lightsalmon','orangered'),
        ylab='Percent',main='Percent of Survivors')
par(mfrow=c(1,1))

# 통계적 가설검정
# 귀무가설: 안전벨트 착용과 승객 안전 간에는 관련이 없다
# 관측빈도: observed count
# 실제로 관측된 값. 교차표상으 ㅣ셀 ㄱ밧
# 기대빈도: expected count
# 귀무가설이 참이라는 전제하에 우리가 기대할 수 잇는 빈도
# 기대빈도의 계산
# 귀무가설이 참이라면 안전벨트 착용 여부와 관계없이
# 두 집단 모두에게서 환자의 상태별 비율이 동일하게 나타날 것

# 환자 상태별 기대빈도 계산
# 경상 환자의 비율 : 83.3%
# 안전벨트 착용자의 경상 기대빈도: 0.83*1641=1367
# 안전벨트 미착용자의 경상 기대빈도: 0.9=83*228=1855.9
# 중상 환자의 비율: 12%
# 안전벨트 착용자의 중상 기대빈도:0.12
# 사망 환자의 비율 4,7%
#    0.047

# 카이스퀘어 검정 절차
# 카이제곱  - value: 기대빈도와 관측빈도의 비교를 통해 계산되는 ㄱ밧
# 카이제곱 oij 관측빈도 , eij 기대빈도, ij 행과 열
# 카이제곱- 검정
# 표본으로부터 산출된 카이제곱 값이 귀무가설이 참이라는 가정하에 
# 카이제곱 분포 상에서 얼마나 나타나기 어려운 희박한 경우인지
# 혹은 흔하게 관찰될 수 있는 경우인지 ㅕㅇ가

# 환자별 상태
# 환자 상태별 기대빈도
# 관측빈도 - 기대빈도 제곱해서 기대빈도로 나누기

expected <- matrix(c(1367,1855,196,267,77,104),ncol=2, byrow=T)
dimnames(expected) <- list('Status'=c('minor injury','serious injury','dead'),
                           'Seatbelt'=c('withe Seatbelt','Without Seatbelt'))
expected

chisqr <- sum((survivors - expected)^2 / expected)
chisqr

# 카이스퀘어 분포
# 자유도에 따라 분포의 모양이 달라지며, 대체로 오른쪾으로 긴 꼬리르 가짐
# 카이제곱 분포의 자유도: 교차표를 구성하는 두 변수의 범주의 개수에 의해 결정
# 자유도=(행 변수의 범주의 개수 -1)* (열 변수의 범주의 개수 -1)
# 자유도=(교차표의 행 개수-1)*(교차표의 열개수-1)

# pchisq() 함수를 이용하여 특정 카이제곱값에 대응 되는 유의확률을 구할 수 있음
pchisq(45.91, df=2, lower.tail=F) # 누적확률함수, 카이제곱 분포

# qchisq() 함수를 이용하여 특정 확률에 대응하는 카이제곱 값을 구할 수 있음
qchisq(0.05,df=2,lower.tail=F)  # 백분위수함수, 카이제곱 분포

# 독립성 검정: independence test
# 두 범주형 변수가 서로 독립인지 검정
# 독립: 두 변수가 서로 관련이 없다
# 성별과 선호하는 도서 장르가 독립이다.
# 성별에 따라서 좋아하는 도서 장르가 다르지 않다(써로 관련이 ㅇ벗다)
# 두 변수의 범주 조합별 빈도를 기록한 교차표를 토대로 카이제곱-검정 절차를 수행

# titanic 데이터 셋을 이용하여 독립성검정 수행
str(Titanic)
Titanic

# 타이타닉호 탑승객의 승객 구분(1등실, 2등실, 3등실, 승무원)에 따른 생존율 차이 분석
Titanic.margin <- margin.table(Titanic, margin=c(4,1))
Titanic.margin

# 카이스퀘어 분석을 위한 교차표 만들기
addmargins(Titanic.margin)

addmargins(prop.table(addmargins(Titanic.margin,2),2),1)

?addmargins
prop.table(addmargins(Titanic.margin))


prop.table(addmargins(Titanic.margin,2))

# 생존율 차이가 있는지 확인하기 위한 독립성 검정
chisq.test(Titanic.margin)

# 두 범주형 변수 간의 관련성의 강도를 평가하기
library(vcd)
assocstats(Titanic.margin)

# 두 범주형 변수 간의 관계를 뫚이ㅡㅋ 플로승로 시각화하기
library(vcd)
windows(width=7.0, height=5.5)
mosaic(Titanic.margin, shade=T, legend=T)
mosaic(~ Survived + Class, data=Titanic.margin, shade=T, legend=T)

# 데이터프레임 형태의 데이터셋에 대해서는 교차표 생성 없이 직접 독립성검정 수행 가능 함
# MASS 패키지의 sur

library(MASS)
str(survey)
levels(survey$Smoke)

# table() 함수를 이용하여 다음과 같이 Smoke 변수에 대한 네 가지 레벨별 빈도를 구할 수 있다.
# table() 함수는 table 객체를 반환한다.
# table 객체는 배열과 동일한 데이터 구조를 가진다. 따라서 배열에서와 마찬가지로 
frqtab <- table(survey$Smoke)
frqtab
class(frqtab)
frqtab[2]
# 최빈값은 데이터 가운데 가장 높은 빈도를 갖는 변수값을 의미한다
# table() 함수를 이용하여 생성한 table 객체로부터 최빈값을 계산할 수 있다.
# 논리 연산을 이용하여 빈도표상에서 빈도의 최대값에 대응되는 변수값을 추출한다.
frqtab==max(frqtab)
frqtab[frqtab==max(frqtab)]
names(frqtab[frqtab==max(frqtab)])
# 또는 다음과 같이 which.max() 함수를 이용하여 구할 수도 있다.
# which.max() 함수는 주어진 벡터의 최대값 위치를 인덱스로 반환한다.
which.max(frqtab)
frqtab[which.max(frqtab)]
names(frqtab[which.max(frqtab)])

# 비율을 구하기 위해서는 다음과 같이 prop.table() 함수를 잉한다.
# 각 변수값에 대응되는 빈도에 대한 비율이 출력ㄴ된다.
# 비율에 100을 곱하여 간단히 퍼센트로 환산할 수 있다.
frqtab.prop <- prop.table(frqtab)
frqtab.prop

frqtab.prop['Never']
frqtab.prop * 100 

# 특정 값이 출현하는 비율을 알고자 할 때 논리 연산을 이요하면 편리하다.
# 논리값 TRUE, FALSE는 숫자 1,0으로 변환될 수 있다. 따라서 논리 연산을 이용하여 특정 값의 출현 여부를 식별한 후
# mean() 함수로 평균을 구하면 그 값이 나타나는 상재거 빈도, 즉 비율을 구할 수 있다.
# 예를 들어, survey 데이터셋으로부터 담배를 피우지 않는 사람의 비율은 다음과 같이 구할 수 있따.
mean(survey$Smoke=='Never', na.rm=T)
# 논리 연산을 수행하면 논리값 벡터가 반환된다.
# 즉 Smoke 변수의 값이 Never인 원소는 TRUE이고 그렇지 않은 원소는 FALSE인 벡터가 생성된다.
# mean() 함수는 TRUE는 1로 FALSE는 0으로 변환하 후 이값들의 ㅕㅇㄱㄴ을 계산한다.
# 이 평균값은 TRUE인 값의 비율을 의미하며, 따라서 이는 응답자 가운데 담배를 피우지 않는 사람의 비율이 된다.
# NA(결측값(missing value))가 포함된 데이터 셋에 평균 계산 함수인 
# mean() 함수를 적용하면 NA가 출력된다.
# NA를 계산에 포함시키지 않으려면 na.rm=T를 징정
# 이러한 논리 연산을 이용하면 다양한 상황에서 발생 빈도에 따른 비율을 계산할 수 있다.
# MASS 패키지에 포함된 데이터셋을 이요하여 다음과 같은 몇 가지 예를 더 살펴보자.
mean(anorexia$Postwt>anorexia$Prewt)
mean(abs(mammals$brain-mean(mammals$brain))>2*sd(mammals$brain))
mean(diff(SP500)>0)

# 첫 번째 예는 치료 후 몸무게가 증가한 식욕부진증 환자의 비율을 보여준다.
# 두번째 예는 두뇌의 무게가 평균으로부터 두 개의 표준편차보다 큰 동물의 비율을 계산한다.
# 세번째 예는 S&P 500 지수 수익률이 전일보다 증가한 일자의 비율을 나타낸다.
# diff() 함수는 주어진 벡터로 부터 연속된 두 숫자의 차이를 계산하여 반환한다

# 빈도표를 이용하여 변수의 범주별 빈도를 파악하면 개별 변수의 범주별 분포를 대략적으로 이해할 수 이싿.
# 마찬가지로 하나의 변수가 아닌 두 