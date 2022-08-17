# 1 데이터 탐색과 통계분석

# 데이터에 대한 두 가지 접근법: EDA vs CDA
# 탐색적 데이터 분석: EDA
# 정해진 가설과 모형없이 데이터의 구조와 특성을 통해 통창을 얻는 분석 기법
# John Tukey: EDA는 우리가 존재한다고 믿는 것들은 물론이고, 존재하지 않는ㄴ다고 믿는 것들을 발견하렬는 태도, 유연성, 그리고 자발성이다.
# 확증적 데이터 분석: CDA
# 가설을 수립하고 데이터를 통해 통계적 유의성을 검정하는 전통적 분석 기법
# Ronald Fisher: 가설검정, 신뢰구간, 유의확률, 유의 수준(p-value)

# 통계분석
# 기술적 통계
# 수집한 데이터의 특성을 수치로 요약하거나 시각적으로 표현하는 통계분석 방법
# 평균, 표준편차, 교차표, 히스토그램, 막대그래프 등
# 추론적 통계
# 수집한 표본집단으로부터 모집단의 특성을 추정하기 위한  통계분석 방법
# 가설검정, 평균검정, 분산분석, 카이제곱검정, 회귀분석

# 데이터: datun or data
# 데이터: 관찰, 측정, 실험, 또는 조사를 통해 얻는 실ㅊ적 사실이나 정보
# 변수(변량): variable or variate
# 변수: 관찰, 측정, 실험, 또는 조사의 대상이 되는 수량
# 관측값(observations): 변수(변량)ㅇ 대한 관측을  통해 얻는 값
# 변수의 종류 
# 연속형: 수치로 표현할 수 있는 변량 키, 몸무게
# 범주형: 범주로 표현할 수 있는 변량 성별, 혈액형
# 변수의 구분
# 독립 변수: 종속변수에 영향을 주는 변수 부모의 키
# 종속 변수: 독립변수로 부터 영향을 받는 변수 자녀의 키

# 혼돈의 카오스: 비슷하고 헷갈리는 용어들
# 수치형 자료 양적 자료 연속형 자료 이산형 자료
# 범주형 자료 질적 자료 명목형 자료 순서형 자료
# 독립변수 특징변수 설명변수 예측변수
# 종속변수 목적변수 반응변수 결과변수

# 데이터의 수집
# 연구주제에 관련된 데이터를 관찰하고 정리: 설문응답 or 실험결과
# 데이터셋: 주로 2차원 테이블(data.frame) 형태로 정리된 데이터

# MASS 패키지: survey 데이터 셋
library(MASS)
str(survey)

?survey

# 범주형 변수의 데이터 탐색
levels(survey$W.Hnd)
freq.tab <- table(survey$W.Hnd)
freq.tab
freq.prop <- prop.table(freq.tab)
freq.prop

barplot(freq.prop, col ='steelblue',
        xlab = 'Writing Hand', ylab = 'Frequency',
        main =' Frequency table of writing hand')

# 연속형 변수의 데이터 탐색
survey$Height
height <- survey$Height
length(height)
mean(height)
mean(height, na.rm=T)
median(height, na.rm=T)
max(height, na.rm=T)
min(height, na.rm=T)
quantile(height,probs=0.9, na.rm=T)
quantile(height, probs=c(0.25,0.75), na.rm=T)

hist(height, col ='steelblue', breaks=15,
     xlim = c(140,210), ylim=c(0,50))

# 연속형 변수의 통계량 요약 정보
df <- subset(survey, select=c(2,3,6,10,12))
summary(df)

library(stargazer)
stargazer(survey, type='text', title='Summary of survey dataset')

# 집단별 기술통계량: 집단의 특성을 파악하거나 집단 간의 차이를 비교하고자 할 때.
mean(survey$Pulse, na.rm = T)
table(survey$Sex)
table(survey$Exer)
tapply(survey$Pulse, INDEX=survey$Sex, FUN=mean, na.rm =T)
with(survey, tapply(Pulse, Sex, mean, na.rm=T))
with(survey, tapply(Pulse, Exer, mean, na.rm=T))
with(survey, tapply(Pulse, list(Sex, Exer), mean, na.rm=T))
aggregate(survey$Pulse, by = survey$Exer, FUN = mean, na.rm =T)
aggregate(survey$Pulse, by = list(survey$Exer), FUN = mean, na.rm=T)
with(survey, aggregate(Pulse, list(Exer), mean, na.rm=T))
with(survey, aggregate(Pulse, list(Exercise=Exer), mean, na.rm=T))

# vcd 패키지: Arthritis 데이터셋
library(vcd)
str(Arthritis)
?Arthritis

# 교차표(cross table): 두 변수의 범주별 빈도수를 통해 번주형 변수 간의 관계를 파악
table(Arthritis$Improved, Arthritis$Treatment)
with(Arthritis, table(Improved, Treatment))
xtabs(~ Improved + Treatment, data = Arthritis)

mosaic(Improved ~ Treatment, data = Arthritis, gp=shading_max)

# 교차표의 행과 열을 기준으로 빈도수의 합과 비율을 계산
cross.tab <- with(Arthritis, table(Improved, Treatment))
cross.tab
margin.table(cross.tab, margin=1)
margin.table(cross.tab, margin=2)

prop.table(cross.tab)
prop.table(cross.tab, margin=1)
prop.table(cross.tab, margin=2)

addmargins(cross.tab)
addmargins(cross.tab, margin=1)
addmargins(cross.tab, margin=2)

# gmodels 패키지의 CrossTable() 함수: 교차분석을 위한다양한 정보를 담은 교차표 생성
library(gmodels)
with(Arthritis, CrossTable(Improved, Treatment),
     prop.r=F, prop.c=F, prop.t=t, prop.chisq=F)

# 다차원 테이블: 세 개의 범주형 변수 간의 관계를 파악
cross.tab <- with(Arthritis, table(Improved, Sex, Treatment))
ftable(cross.tab)
ftable(cross.tab, row.vars=c(2,3))
ftable(prop.table(cross.tab, margin=c(2,3)))
# 신약 처방을 받은 여성의 59.3% 는 현저한 정상의 개선(Marked)이 있으며, 
# 반면에 남성의 경우에는 그 비율이 357%에 그쳤다.


# 확률과 통계
# 확률: probability
# 생각할 수 있는 모든 경우의 수 중에서
# 우리가 관심을 갖는 경우의 수가 차지하는 비율
# 로또 복권의 1등 당첨 확률
# 모든 경우의 수 : 45C6=8145060, 관심 있는 경우의 수:1
# 반드시 한 가지 조건을 만족해야 함
# 1에서 45까지의 모든 숫자가 뽑힐 확률이 동일하다

# 확률 용어
# 시행:trial
# 다양한 결과가 나올 수 있는 어떤 것을 실제로 하는 것 동전 던저기
# 표본 공간: sample space
# 시행의 결과로 나올 수 있는 가능한 모든 결과의 집한 {앞, 뒤}
# 사건: event
# 가능한 결과들 중 어떤 요구사항을 만족하는 것 앞면이 나옴
# 배반사건: disjoint event
# 동시에 일어날 수 없는 두 사건. 앞면 뒷면이 동시에 나옴
# 여사건:complementary event
# 어떤 사건이 일어나지 않은 것 앞면이 나오지 않음

# 수학적 확률: mathematical probability
# 가능한 모든 경우 중에서 관심 있는 경우의 비율이 얼마냐?
# 예) 두 개의 주사위를 동싱 던졌을 때, 두 값을 곱해서 홀수가 나올 확률은?
# 모든 경우의 수 : 6x6=36
# 두 값을 곱해서 홀수가 나올 경우의 수 : 3x3=9
# 두 주사위의 곱이 홀수일 확률: 9/36=1/4=0.25
# 단 두 주사위의 각 숫자가 나올 가능성이 같아야 한다는 조건을 만족해야 함
# 동일한 가능성의 가정
# 표본공간의 모든 경우가 나올 가능성이 같아야 한다.

# 통계적 확률: statistical probability
# 전체 시행 횟수 중에서 특정 사건이 일어난 횟수의 비율
# 전체 시행 횟수를 n, 특정 사건이 일어날 횟수를 r이라고 하면
#그 사건이 일어날 통계적 확률 = r/n
# 통계적 확률은 수학적 확률과 정확히 일치하지 않을 수 있음
# 하지만, 시행 횟수를 늘릴수록 통계적 확률이 수학적 확률에 근접함

# 큰 수의 법칙:law of large numbers
# 표집 오차: sampling error
# 시행 횟수가 적을 때는 통계적 확률이 수학적 확률에서 벗어남
# 기댓값: expected value
# 표본평균이 자료의 크기가 커짐에 따라 한없이 가까워지는 특정값
# 시행 횟수가 많아질수록 통계적 확률은 기댓값에 가까워짐.
# 동전 던지기 10회 시행했을 경우
# 앞 뒤 앞 앞 뒤 뒤 뒤 앞 앞 앞
# 앞면이 나올 기댓값 = 0.5
# 앞면이 나올 통계적 확률 = 6/10 = 0.6
# 표집오차 = |0.6 - 0.5|=0.1

# 베르누이 시행: Bernoulli trial
# 가능한 결과가 두 개 밖에 없고, 성공의 확률이 정해져 있는 확률 시행
# 동전 던지기
# rbinom(n,size,prob)
# n:number of observations
# size:number of trials
# prob:probability of success on each trial.

?rbinom
x <- rbinom(10,2,0.5)
x
sum(x)/10
mean(x)
x<-rbinom(100,2,0.5)
x
mean(x)
x<-rbinom(10000,2,0.5)
mean(x)

# 몬테카를로 시뮬레이션: Monte Carlo Simulation
# 충분히 큰 횟수의 시행을 통해서 복잡한 확률을 계산하는 방법
# 시행 횟수가 늘어남에 따라 통계적 확률은 수학적 확률에 한없이 가까워진다.
# sample(x, size, replac=FALSE, prob=NULL)
# x: a vector of on or more elements from which to choose.
# size: a non-negatibe integer giving the number of items to choose.
# replace: should sampling be with replacement?
# prob: a vector of probability weights for obtaining the elements.

# 복원 추출과 비복원 추출
# 복원 추출: sampling with replacement
# 표본공간에서 표본을 추출한 다음 원래대로 돌려놓고 다음 뽑기를 하는 방법
# 비복원 추출: sampling without replacement
# 표본을 추출하고나서 원래대로 돌려놓지 않고 다음 뽑기를 하는 방법
sample(1:10, 10, replace=T)
sample(1:10, 10, replace=F)

# 난수 생성: random number generation
# 난수 생성기의 조건
# 수의 분포가 확률적으로 균일해야 하고
# 다음에 나올 값을 예측할 수 없어야 한다.
# 컴퓨터를 이용한 난수 생성: 의사 난수(pseudo random)
# 완전한 난수는 아니지만 난수의 조건을 충족하고 알고리즘을 적용
# runif(n, min = 0, max = 1)
# n : number of observations
# min, max: lower and upper limits of the distribution

# 몬테카를로 시뮬레이션으로 원주율 계산하기
n_sim <- 1000
x<-vector(length=n_sim)
y<-vector(length=n_sim)
res=0
for (i in 1:n_sim){
  x[i]<- runif(1)
  y[i]<-runif(1)
  if (x[i]^2 + y[i]^2 < 1) {
    res <- res + 1
  }
}
4 * res / n_sim

circle <- function(x) sqrt(1-x^2)
plot(x,y,xlab='X',ylab='Y',col='blue')
curve(circle, from=0, to=1, add=T, col='red',lwd=2)

# 조건부 확률: conditional probability
# 어떤 사건이 참일 때 특정 사건의 확률이 얼마인지를 일컫는 개념
# P(B|A): 사건 A가 일어났을 때의 사건 B의 조건부 확률
# P(B|A)=P(A교B)/P(A) 단, P(A) > 0
# 확률의 곱셈정리
# P(A) > 0, P(B) >0 일때,
# P(A교B) = P(A)P(B|A)=P(B)P(A|B)

# 조건부 확률 시뮬레이션
# 주사위를 던져서 홀수가 나왔을 경우 (A)ㅇ 5가 나올 (B) 확률
n_sim <- 10000
n_odd <- 0
n_five <- 0

for (i in 1:n_sim) {
  trial = sample(1:6, 1)
  if (trial %% 2 ==1) n_odd <- n_odd +1
  if (trial==5) n_five <- n_five + 1
}

n_five / n_odd
p_odd <- n_odd / n_sim
p_five <- n_five / n_sim
p_five / p_odd

# 베이즈 정리: Bayes'Theorem
# P(B|A)=P(B|A)P(B)/P(A)

# 베이즈 정리의 확률 해석
# 확률은 사건의 발생에 대한 기대치의 계산과
# 실제로 그것이 발생할 것으로 기대되는 가능성 간의 비율이다
# 즉 과거의 데이터를 보면 미래를 예측할 수 있다
# 빈도주의와 베이즈 주의
# 로널드 피셔 vs 토마스 베이즈
# 동전 던지기를 해서 연속으로 열 번 앞면이 나온 후에
# 다시 그 동전을 던졌을 때 앞면이 나올 확률은?
# 내일 아침ㅇ 해가 동쪽에서 뜰까, 서쪽에서 뜰까?

# 혼동 행렬: comfusion matrix
# 예측값이 실제 값을 얼마나 정확히 예측했는지를 보여주는 행렬
#                 예측값
# 실제값



# 3 확률 변수와 확률 분포 (1)
# 확률변수: random variable
# 확률적으로 서로 다른 값을 가질 수 있는 어떤 변수
# 어떤 시행에서 표본공간의 각 근원사건에 하나의 실수를 대응시키는 것
# 예) 동전 던지기의 확률 변수: 동전을 던졌을 때 나오는 면
# X = {H,T}
# 이산확률변수: discrete random variable
# 확률변수 X가 취할 수 있는 값이 불연속일 때
# 연속확률 변수: continuous random variable
# 확률변수 X가 취할 수 있는 값이 연속일 때

# 확률분포: probability distribution
# 확률변수 X가 갖는 값과 X가 이 값을 가질 확률 사이의 대응 관계(함수)
# 이산확률분포: discrete probability distributon
# 이산확률변수에 대한 확률 질량함수: PMF , mass
# 연속확률 분포: continuous probability distribution
# 연속확률변수에 대한 확률밀도함수 : PDF, density

# 확률분포의 성질
# 이산 확률분포: 시그마
# 연속 확률 분포  적분

# 확률분포의 성질
# 이산확률분포
# 기댓값(= 평균): E(X) = m = ,시그마
# 분산: (X -m)^2의 평균 V(X)
# 표준편차 : 분산 ^1/2  시그마(X)
# 연속확률분포
# 기댓값(=평균): E(x)
# 분산 V(X)
# 표준편차 시그마(X) = 루트 V(X)

# 정규분포: normal distibution
# 확률밀도 함수를 그래프로 그렸을 때 종형 곡선이 나타나는 확률 분포
# 확률밀도함수 : f(x)
# 평균이 m, 표준편차가 시그마 인 정규분포:N(m, 시그마^2)
# 표준정규분포: standard normal distribution
# N(0,1^2): 평균이 m=0, 표준편차가 시그마 =1인 정규분포
# 확률밀도함수:f(x)
x <- seq(-3, 3, length=200)
x
plot(x, dnorm(x, mean=0, sd=1), type = 'l', main='Normal Distribution')

# 정규분포의 유용성
# 다양한 사회 현상, 자연 현상에 대한 우리의 직관과 부합하는 특성을 가짐
# 대부분의 데이터는 평균을 중심으로 가까이 모여 있거나
#  평균에서양이나 음의 방향으로 떨어진 정도가 대기 비슷하거나
# 평균에서 많이 떨어진 값들은 그리 많이 존재하지 않는다.
# 모든 (확률) 모형은 틀렸다. 하지만 그 중 어떤 것은 유용하다.
# all models are wrong but some are useful.
# 확률분포는 어디까지나 이론적 단순화에 불과하고
# 현실에서 발견되는 데이터가 특정 확률분포에 완전히 부합하지 않는다.

# 정규분포의 특성
# 기댓값(평균): 데이터의 분포를 숫자 하나로 요약할 수 있음
# 정규분포곡선은 봉우리가 하나밖에 없고, 대부분의 값이 평균 주변에 있음
# 정규분포곡선은 평균을 중심으로 대칭 구조임
# 표준편차: 평균에서 자료가 얼마나 떨어져 잇는지를 나타내는 값
# 표준편차 안에 들어오는 값의 비율이 항상 일정함
# 1 X 표준편차 안에 들어오는 값의 비율: 70%
# 2X표준편차 안에 들어오는 값으 ㅣ비율은 95%
# 표준편차는 정규분포곡선의 모양과 관련이 잇음
# 표준편차가 클수록 그래프는 낮고 납작해지며
# 표준편차가 작을수록 그래프는 높고 뾰족해짐
x <- seq(0,100,length=200)
x
plot(x, dnorm(x, mean=50, sd=10), type='l', main='Normal Distribution(m=50, s=10)')
plot(x, dnorm(x, mean=50,sd=20), type='l', main='Normal Distribution(m=50, s=20)')


# pnorm(q, mean =0, sd=1)
# q: vector of quantiles
# mean: vector of means
# sd: vector of standard dexiations
pnorm(35000,30000,10000) - pnorm(25000,30000,10000)

x <- seq(10000, 50000, length=200)
y <- dnorm(x, mean= 30000, sd=10000)
plot(x, y, type= 'l', main='$25000 ~ $35000 사이에 있을 확률')
xlim <- x[25000 <=x & x<= 35000]
ylim <- y[25000 <=x & x <=35000]
xlim<-c(xlim[1], xlim, tail(xlim, 1))
ylim<-c(0,ylim,0)
polygon(xlim,ylim,col='grey')

# 표준화(정규화): standardization
# 정규분포를 따르는 확률변수 X를 표준정규분포를 따르는 확률변수 Z로 변환
# X ~ N(m, 시그마 ^2) -> Z = X-m/시그마, Z~N(0,1^2)
# 표준화를 하는 이유
# 평균과 표준편차가 다른 정규분포를 따르는 두 변수의 값을 비교하는 겨웅

curve(dnorm(x), -3, 3,
      xlab ='X', ylab = 'Y',
      main='probability Density Function')

curve(pnorm(x), -3, 3,
      xlab='X', ylab='Y',
      main='Cumulative Distribution Function')

# 이항분포: binomial distribution
# 어떤 시행에서 사건이 일어날 확률이 p인 독립시행을 n회 반복할 때
# 사건이 일어나는 횟수인 확률변수 X는 이항분포 B(n,p)를 따른다
# X~B(n,p)
# X의 확률 질량함수
# P(X=r)=nCrP^r(1-p)^n-r, r=0,1,2,...,n

n_sim <- 10000
y<- rbinom(n_sim, 100, 0.5)

hist(y, xlab='X', ylab='mass',
     main='B(100,0.5)',
     prob=T,
     breaks=30)
curve(dnorm(x, 50, 5), 25,75,
      lty=2,lwd=2,col='red',
      add=T)



# 4 확률벼수와 확률 분포(2)

# 확률변수와 확률 분포
# 확률변수: random variable
# 확률 사건에서 나타날 수 있는 개개의 결과를 수로 나타낸 것 (X로 표기)
# 이산 확률변수: discreate
# 연속 확률변수: continuous
# 확률분포: probability distribution
# 확률변수 X가 취하는 값에 대응하은 확률을 나타내는 함수
# 확률 질량함수: mass PMF
# 확률 밀도함수: density PDF

# 확률분포 관련 R 함수
# d: density, p: probability , q: quantile, r:random
# 구분    균일분포   이항분포    정규분포   t-분포    F-분포     x^2 - 분포
# 난수생성함수   runif() rbinom() rnorm() rt() rf() rchisq()
# 확률밀도함수 dunif() dbinom() dnorm() dt() df() dchisq()
# 누적확률함수 punif() pbinom() pnorm() pt() pf() pchisq()
# 백분위수함수 qunif() qbinom() qnorm() qt() qf() qchisq()

# 균일분포: uniform distribution
# 특정 범위 내에서 균등하게 나타나는 확률을 가지는 확률 분포
# runif(n, min, max)
# n: number of observations
# min: lower limits of the distribution
# max: upper limits of the distribution

runif(n=100,min=0,max=100)
par(mfrow=c(1,3))
hist(runif(100,0,100), col='orange')
hist(runif(1000,0,100), col = 'salmon')
hist(runif(10000,0,100), col =' tomato')
par(mfrow=c(1,1))

set.seed(2022)
hist(runif(100,0,100), col='steelblue')

# 이항분포: binomial distribution
# 베르누이 시행: Bernoulli trial
# 임의의 시행 결과가 성공 또는 실패 중 하나인 시행
# 이항분포 binomial distribution
# 성공확률이 p인 베르누이 시행을 독립적으로 n번 반복하여 시앻했을 대
# 시행의 결과가 성공인 시행의 횟수 X에 대한 확률 분포
# X~B(n,p): 확률변수 X가 이항분포 B(n,p)를 따름

# X: 공평한 동전 던지기를 size번 실행했을 때 앞면이 나온 횟수(성공=앞면, 성공확률 p=0.5)
set.seed(2022)
rbinom(n=1,size=1,prob=0.5)
rbinom(n=1, size=10, prob=0.5)
rbinom(n=10,size=10,prob=0.5)
rbinom(n=100, size=10, prob=0.5)

set.seed(2022)
X <- rbinom(n=10000, size=100, prob=0.5)
hist(X, col ='skyblue', breaks=15)

# 정규분포: normal distribution
# 자연현상 또는 사회현상에서 자주 관찰되는 종 모양의 확률 분포
# 정규분포는 평균과 분산(표준편차)에 따라 분포의 형태가 결정됨
# X~N(m,시그마^2): X는 평균 m이고, 표준편차가 시그마인 정규분포를 따름
# rnorm(n,mean,sd)
# n:number of observations
# mean: vector of means
# sd:vector of standard deviations

# X~N(172,10^2): 경북대 대학원 학생들의 키(평균이 172, 표준편차가 10이라고 알려진 경우)
set.seed(2022)
X<-rnorm(n=1000,mean=172,sd=10)
hist(X, col='skyblue',breaks=30)

hist(X, col='skyblue', breaks=30, freq=F)
x <- seq(min(X), max(X), length.out=200)
x
curve(dnorm(x,172,10),add=T, col='tomato', lwd=2)

# X~N(172,10^2)일 때 어떤 대학원 학생의 키가 160 보다 크거나 180보다 작을 확률은?
pnorm(q=160, mean=172,sd=10)
pnorm(q=160,mean=172,sd=10,lower.tail=F)
pnorm(q=180,mean=172,sd=10)
pnorm(q=180,mean=172,sd=10,lower.tail=F)

1 - pnorm(160,172,10) - pnorm(180,172,10,lower.tail=F)
1-pnorm(162,172,10)-pnorm(182,172,10,lower.tail=F)
1-pnorm(152,172,10)-pnorm(192,172,10,lower.tail=F)

# X~N(172,10^2)일때 상위 5% 또는 하위 5%에 속하는 대학원ㅅ생의 키는?
qnorm(p=0.05, mean = 172, sd = 10)
qnorm(p=0.95, mean=172,sd=10)
qnorm(c(0.05,0.95),172,10)
qnorm(c(0.025, 0.975), 172, 10)
qnorm(c(0.005, 0.995), 172, 10)

# 표준 정규분포: Z~N(0,1): 평균이 0이고 표준편차가 1인 정규분포(확률변수를 Z로 표기)
x <- seq(from=-3, to=3, length.out=200)
x
plot(x, dnorm(x), type='l', col='tomato', lwd=2)

# 정규 분포를 따르는 확률변수의 값은 m +- 1.96 x 시그마 범위 안에 있을 확률이 약 95% 이다.
qnorm(c(0.025, 0.975), 0, 1)
pnorm(c(-1.96, 1.96),0,1)
qnorm(c(0.005, 0.995),0,1)
pnorm(c(-2.58,2.58),0,1)
1-pnorm(-1)-pnorm(1,lower.tail=F)
1-pnorm(-1.96) - pnorm(1.96, lower.tail=F)
1-pnorm(-2.58)-pnorm(2.58,lower.tail=F)

# 모집단과 표본집단 : population and samples
# 모집단: 연구의 대상이 되는 전체 집합
# 모집단 분포: 모집단의 데이터가 가지는 확률분포
# 표본집단: 모집단으로부터 추출한 부분 집합
# 표본분포: 모집단에서 추출한 표본 데이터가 가지는 확률분포
# 표본추출: sampling
# 복원추출: 추출한 표본을 되돌려 놓고 다음 표본을 추출
# 비복원 추출: 이미 추출한 표본은 제외하고 다음 표본을 추출
x <- 1:9
sample(x, size = 7)
sample(x, size=10)
sample(x, size=10, replace=T)

# 중심극한정리: central limit theorem
# 표본의 크기가 충분히 클 때(n >=30)
# 표본분포는 모집단의 분포와 상관없이 정규분포를 따른다.
# 평균이 m, 표준편차가 시그마인 모집단으로부터 n개의 표본을 추출하면
# 표본 평균 X바 의 확률분포는 X바~N(m,시그마^2/n)인 정규분포에 근사한다.
# 표본분포의 평균은 모집단의 평균 m와 같다.
# 표본분포의 표준편차(=표준오차)는 시그마/n^1/2와 같다.
X.norm <- rnorm(n=10000, mean=50,sd=25)
hist(X.norm, col='orange',freq=F, ylim=c(0,0.02))
mean(X.norm)
sd(X.norm)

X.bar <- c()
for (i in 1:10000) {
  X.bar <- c(X.bar, mean(sample(X.norm, size=100)))
}
hist(X.bar, col='skyblue', freq=F)

X.unif <- runif(n=10000,min=0,max=100)
hist(X.unif, col='tomato',freq=F, ylim=c(0,0.02))
mean(X.unif)
sd(X.unif)

X.bar <- c()
for (i in 1:10000) {
  X.bar <- c(X.bar, mean(sample(X.unif, size = 100)))
}
hist(X.bar, col = 'cyan3', freq=F)



# 5 통계적 추정과 가설검정
# 통계적 추정과 구간추정
# 통계적 추정: 수집한 표본집단으로부터 모집단의 특성(모수)를 추정
# 점추정: 모수에 대한 추정값을 하나의 값으로 추정
# 구간추정: 모수의 값이 포함되리라고 믿을 수 있는 범위를 추정
# 구간 추정의 신뢰수준과 신뢰 구간
# 신뢰수준: cconfidence level
# 모수가 추정한 구간 안에 있을 것이라고 믿을 수 있는 정도(95%, 99%)
# 신뢰구간: confidence interval
# 신뢰도에 따라 모수가 포함될 것이라고 믿을 수 있느 구간

# 정규분포와 신뢰구간
# 정규분포 X~N(m,시그마^2)을 따르는 모집단에서
# 크기가 n인 표본을 임의추출하여 얻은 표본평균이 X바 일때
# 모평균 m에 대한 구간 추정
# 신뢰수준 95%의 신뢰구간: X바 - 1.96시그마/루트n <= 뮤 <- 엑스바 + 1.96 시그마/ 루트n
# 신뢰수준 99%의 신뢰구간: X바 - 2.58 시그마/루트 시그마 <= 뮤 <= 엑스바 + 2.58 시그마/루트n

height <- survey$Height
h.mean <- mean(height, na.rm =T)
h.mean
h.sd <- sd(height, na.rm =T)
h.sd
c(h.mean - 1.96 *h.sd, h.mean + 1.96*h.sd)

qnorm(0.025, mean=h.mean, sd=h.sd)
qnorm(0.975,mean=h.mean,sd=h.sd)
pnorm(153.0801,mean=h.mean,sd=h.sd)
pnorm(191.6817,mean=h.mean,sd=h.sd,lower.tail=F)

x <- seq(h.mean-3*h.sd, h.mean+3*h.sd, length.out=200)
y<-dnorm(x,h.mean,h.sd)
plot(x,y,type='l', col='lightgrey',lwd=2)
abline(0,0,col='lightgrey', lwd=2)
xlim <- x[lower <= x & x<=upper]
ylim <- y[lower <= x & x<= upper] -0.0001
xlim <- c(xlim[1], xlim, tail(xlim,1))
ylim <- c(0,ylim,0)
polygon(xlim, ylim,col='lightgrey')

# 가설검정
# 가설:hypothesis
# 타당성의 유무를 명백히 밝혀야 하는 모수에 대한 주장
# 가설검정: hypothesis test
# 표본집단의 통계량을 이용하여 모수에 대한 주장의 진위를 검정하는 과정
# 가설검정의 방법
# 연구가설에 대한 귀무가설과 대립가설을 설정하고
# 표본으로부터 얻은 검정통계량이 귀무가설이 옳다는 전제하에서는
# 확률적으로 나타나기 어려운 극단적이고 예외적인 값이라는 것을 입증


