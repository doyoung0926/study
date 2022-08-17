# 1 데이터 탐색과 통계 분석

# 데이터에 대한 두 가지 접근법 EDA vs CDA
# 탐색적 데이터 분석: EDA, exploratory data analysis
# 정해진 가설과 모형없이 데이터의 구조와 특성을 통해 통찰을 얻는 분석 기법
# John Tukey: EDA는 우리가 존재한다고 믿는 것들은 물론이고, 존재하지 않는다고 믿는 것들을 발견하려는 태도, 유연성, 그리고 자발성이다.
# 확증적 데이터 분석:CDA, confirmatory data analysis
# 가설을 수립하고 데이터를 통해 통계적 유의성을 검정하는 전통적 분석기법
# Ronald Fisher: 가설검정, 신뢰구간, 유의확률, 유의수준(p-value)

# 통계분석: statistical analysis
# 기술적 통계: descriptive statistics
# 수집한 데이터의 특성을 수치로 요약하거나 시각적으로 표현하는 통계분석 방법
# 평균, 표준편차, 교차표, 히스토그램, 막대그래프 등
# 추론적 통계: inferential statistics
# 수집한 표본집단으로부터 모집단의 특성을 추정하기 위한 통계분석 방법
# 가설검정, 평균검정, 분산분석, 카이제곱검정, 회귀분석 등
# 데이터: datum or data
# 데이터: 관찰, 측정, 실험 또는 조사를 통해 얻는 실체적 사실이나 정보
# 변수(변량): variable or variate
# 변수: 관찰, 측정, 실험 또는 조사의 대상이 되는 수량
# 관측값(observations): 변수(변량)에 대한 관측을 통해 얻는 값
# 변수의 종류 
# 연속형(continuous): 수치로 표현할 수 있는 변량 예) 키 , 몸무게
# 범주형(categorical): 범주로 표현할 수 있는 변량. 예) 성별, 혈액형
# 변수의 구분
# 독립변수(independent): 종속변수에 영향을 주는 변수 부모의 키
# 종속변수(dependent): 독립변수로부터 영향을 받는 변수 자녀의 키

# 비슷하고 헷갈리는 용어들
# 수치형 자료 양적 자료 연속형 자료 이산형 자료
# 범주형 자료 질적 자료 명목형 자료 순서형 자료
# 독립변수 특징변수 설명변수 예측변수
# 종속변수 목적변수 반응변수 결과변수

# 데이터의 수집 : data collection
# 연구주제에 관련된 데이터를 관찰하고 정리: 설문응답 or 실험겨로가
# 데이터셋: 주로 2차원 테이블 (데이터프레임) 형태로 정리된 데이터

# MASS 패키지: survey 데이터 셋
library(MASS)
str(survey)
?survey

# 범주형 변수의 데이터 탐색
levels(survey$W.Hnd)
# unique(survey$W.Hnd)
freq.tab <- table(survey$W.Hnd)
freq.tab

freq.prop <- prop.table(freq.tab)
freq.prop

prop.table(table(survey$W.Hnd))

barplot(freq.tab, col ='steelblue',
        xlab='Writing Hand',
        ylab =' Frequency',
        main = 'Frequency table of writing hand')

# 연속형 변수의 데이터 탐색
survey$Height

height <- survey$Height
length(height)
mean(height)
mean(height,na.rm =T)
median(height, na.rm = T)
max(height, na.rm=T)
min(height, na.rm=T)
quantile(height, probs=0.9, na.rm=T)
quantile(height, probs = c(0.25,0.75), na.rm=T)

hist(height, col = 'steelblue', breaks=15,
     xlim = c(140,210), ylim=c(0,50))

# 연속형 변수의 통계량 요약 정보
df <- subset(survey, select = c(2,3,6,10,12))
summary(df)

library(stargazer)
stargazer(survey, type='text', title='summary of survey dataset')

# 집단별 기술통계량: 집단의 특성을 파악하거나 집단 간의 차이르 비교하고자 할 때.
mean(survey$Pulse, na.rm=T)
table(survey$Sex)
table(survey$Exer)

tapply(survey$Pulse, INDEX = survey$Sex, FUN = mean, na.rm=T)
with(survey, tapply(Pulse, INDEX=Sex, mean, na.rm=T))
with(survey, tapply(Pulse, Exer, mean, na.rm =T))
tapply(survey$Pulse, INDEX = list(survey$Sex, survey$Exer), mean, na.rm=T)
with(survey, tapply(Pulse, list(Sex, Exer), mean, na.rm=T))

aggregate(survey$Pulse, by = survey$Exer, FUN=mean, na.rm=T)
aggregate(survey$Pulse, by=list(survey$Exer),FUN=mean, na.rm=T)
with(survey, aggregate(Pulse, list(Exer), mean, na.rm=T))
with(survey, aggregate(Pulse, list(Exercise= Exer), mean, na.rm=T))

# vcd패키지: Arthritis 데이터 셋
library(vcd)
str(Arthritis)

?Arthritis

# 교차표(cross table): 두 변수의 범주별 빈도수를 통해 범주형 변수 간의 관계를 파악
table(Arthritis$Improved, Arthritis$Treatment)
with(Arthritis, table(Improved, Treatment))
xtabs(~ Improved + Treatment, data = Arthritis)

mosaic(Improved ~ Treatment, data = Arthritis, gp = shading_max)

# 교차표의 행과 열을 기준으로 빈도수의 합과 비율을 계산 
cross.tab <- with(Arthritis, table(Improved, Treatment))
cross.tab
margin.table(cross.tab, margin=1)
margin.table(cross.tab, margin=2)

prop.table(cross.tab)
prop.table(cross.tab, marg.in=1)
prop.table(cross.tab, margin=2)

addmargins(cross.tab)
addmargins(cross.tab, margin=1)
addmargins(cross.tab, margin=2)

# gmodels 패키지의 CrossTable() 함수:교차분석을 위한 다양한 정보를 담은 교차표 생성
library(gmodels)
with(Arthritis, CrossTable(Improved, Treatment,
                           prop.r =F, prop.c=F, prop.t=T, prop.chisq=F))

# 다차원 테이블: 세 개의 범주형 변수 간의 관계를 파악
cross.tab <- with(Arthritis, table(Improved, Sex, Treatment))
cross.tab
ftable(cross.tab)
ftable(cross.tab, row.vars=c(2,3))
?ftable
??row.vars
?prop.table()
ftable(prop.table(cross.tab))
ftable(prop.table(cross.tab, margin=c(1,2)))

# 신약 처방을 받은 여성의 59.3%는 현저한 정상의 개선(Marked)이 잇으며, 
# 반면에 남성의 경우에는 그 비율이 35.7%에 그쳤다.


# 2 확률과 통계
# 확률 : probability
# 생각할 수 있는 모든 경우의 수 중에서
# 우리가 관심을 갖는 경우의 수가 차지하는 비율
# 로또복권의 1등 당첨 확률
# 모든 경우의 수 45C6=8145060, 관심있는경우의수1
# 반드시 한 가지 조건을 만족해야 함
# 1에서 45까지의 모든 숫자가 뽑힐 확률이 동일하다.

# 확률 용어
# 시행: trial
# 다양한 결과가 나올 수 있는 어떤 것을 실제로 하는 것. 동전 던지기
# 표본 공간: sample space
# 시행의 결과로 나올 수 있는 가능한 모든 결과의 집합 앞 뒤
# 사건 : event
# 가능한 결과들 중 어떤 요구사항을 만족하는 것 앞면이 나옴
# 배반사건: disjoint event
# 동시에 일어날 수 없는 두 사건 앞면 뒷면이 동시에 나옴
# 여사건: complementary event
# 어떤 사건이 일어나지 않은 것 앞면이 나오지 않음

# 수학적 확률: mathematical probability
# 가능한 모든 경우 중에서 관심 있는 경우의 비율이 얼마냐
# 두개의 주사위를 동시에 던졌을 때 두 값을 곱해서 홀수가 나올 확률은?
# 모든 경우의 수 6*6 36
# 두 값을 곱해서 홀수가 나올 경우의 수 3*3 9
# 두 주사위의 곱이 홀수일 확률 9/36 = 1/4 = 0.25
# 단, 두 주사위의 각 숫가자 나올 가능성이 같아야 한다는 조건을 만족해야 함
# 동일한 가능성의 가정
# 표본공간의 모든 경우가 나올 가능성이 같아야 한다.

# 통계적 확률: statistical probability
# 전체 시행 횟수 중에서 특정 사건이 일어난 횟수의 비율
# 전체 시행 횟루를 n 특정 사건이 일어날 횟수를 r 이라고 하면 
# 그 사건이 일어날 통계적 확률 r/n
# 통계적 확률은 수학적 확률과 정확히 일치하지 않을 수 있음
# 하지만 시행횟수를 늘릴수록 통계적 확률이 수학적 확률에 근접함

# 큰수의 법칙: law of large numbers
# 표집 오차: sampling error 
# 시행 횟수가 적을 때는 통계적 확률이 수학적 확률에서 벗어남
# 기댓값: expected value
# 표본평균이 자료의 크기가 커지에 따라 한없이 가까워지는 특정값
# 시행 횟수가 많아질수록 통계적 확률은 기댓값에 가까워짐
# 동전 던지기를 10회 시행했을 경우
# 앞 뒤 앞앞뒤뒤뒤앞앞앞
# 앞면이 나올 기댓값=0.5
# 앞면이 나올 통계적 확률 = 6/10=0.6
# 표집오차 = |0.6-0.5|=0.1

# 베르누이 시행: Bernoulli trial
# 가능한 결과가 두 개 밖에 없고, 성공의 확률이 정해져 있는 확률 시행
# 동전 던지기
# rbinom(n, size, prob)
# n: number of observations
# size: number of trials
# prob: probability of success on each trial

?rbinom

x <- rbinom(10,1,0.5)
x
sum(x)/10
mean(x)
x <-rbinom(100,1,0.5)
mean(x)
x<-rbinom(10000,1,0.5)
mean(x)

# 몬테가를로 시뮬레이션: Mote Carlo Simulation
# 충분히 큰 횟수의 시행을 통해서 복잡한 확률을 계산하는 방법
# 시행 횟수가 늘어남에 따라 통계적 확률은 수학적 확률에 한없이 가까워진다.

# sample(x, size, replace=FALSE, prob=NULL)
# x: a vector of one or more elements from which to choose
# size: a non-negatibe integer giving the number of items to choose
# replace: should sampling be with replacement?
# prob: a vector of probability weights for obtaining the elements

# 복원 추출과 비복원 추출
# 복원 추출: sampling withe replacement
# 표본공간에서 표본을 추출한 다음 원래대로 돌려놓고 다음 뽀ㅃ기를 하는 바업
# 비복원추출 : sampling without replacement
# 표본을 추출하고 나서 원래대로 돌려놓지 않고 아므 뽑기를 하는 방법
sample(1:10,10,replace=T)
sample(1:10,10,replace=F)

# 난수 생성: random number generation
# 난수 생성기의 조건
# 수의 분포가 확률적으로 균일해야 하고
# 다음에 나올 값을 예측할 수 없어야 한다.
# 컴퓨터를 이용한 난수 생성: 의사 난수(psudo random)
# 완전한 난수는 아니지만 난수의 조건을 충족하는 알고리즘을 적용

# runif(n, min=0,max=1)
# n: number of observations
# min,max: lower and upper limits of the distribution
runif(3, min=0, max=10)

# 몬테카를로 시뮬레이션을 원주율 계산하기
n_sim <- 1000
x <- vector(length=n_sim)
y <- vector(length=n_sim)
res=0
for (i in 1:n_sim) {
  x[i]<-runif(1)
  y[i]<-runif(1)
  if (x[i]^2 + y[i]^2 < 1) {
    res <- res+1
  }
  
}
4 * res/n_sim

circle <- function (x) sqrt(1 - x^2)
plot(x, y,xlab='X',ylab='Y',col='blue')
curve(circle, from=0, to=1, add=T, col='red', lwd=2)

# 조건부 확률: coditional probability
# 어떤 사건이 참일 때 특정 사건의 확률이 얼마인지를 일컫는 개념
# p(b|a): 사건 aㅏㄱ 일어났을 때의 사건 b의 조건부 확률
# p(b|a): 사건a가 일어낫을 때의 사건 b의 조건부 확률
# p(b|a)=p(a교b)/p(a), 단 p(a)>0
# 확률의 곱셈정리
# p(a)>0,p(b)>0일때,
# p(a교b)=p(a)p(b|a)=p(b)p(a|b)

# 조건부 확률 시뮬레이션
# 주사위를 던져서 홀수가 나왔을 경우 (a)에 5가 나올 (b)확률
# p(a)=1/2
# p(b)=1/6
# p(a교b)=1/6
# p(b|a)=p(a교b)/p(a)=1/6/1/2=1/3=0.333
# p(a|b)=p(a교b)/p(b)=1/6/1/6=1

n_sim <- 10000
n_odd <- 0
n_five <- 0

for (i in 1:n_sim) {
  trial = sample(1:6,1)
  if (trial%%2==1) n_odd <- n_odd+1
  if (trial ==5) n_five <-n_five+1
}

n_five / n_odd
p_odd <- n_odd / n_sim
p_odd
p_five <- n_five / n_sim
p_five / p_odd


# 베이즈 정리: Bayes' Theorem
# p(b|a)=p(a|b)p(b)/p(a)

# 베이즈 정리의 확률 해석
# 확률은 사건의 발생에 대한 기대치의 계산과
# 실제로 그것이 발생할 것으로 기대되는 가능성 간의 비율이다
# 즉, 과거의 데이터를 보면 미래를 예측할 수 있다.
# 빈도주의와 베이즈주의: Frequentism vs Bayesianism
# 로널드 피셔 vs 토마스 베이즈
# 동전 던지기를 해서 연속으로 열 번 앞면이 나온 후에 
# 다시 그 동전을 던졌을 때 앞면이 나올 확률은
# 내일 아침에 해가 동쪽에서 뜰까, 서쪽에서 들까

# 혼돈 행렬: confusion matrix
# 예측값이 실제값을 얼마나 정확히 예측했는지를 보여주는 행렬
# 에측값     positive     Negative
# 실제값
# positive    TP            FN
# negative      FP        TN

# 혼동 행렬의 평가 지표: evaluation metrics
# 민감도(재현율): sensitivity(recall)
# recall=TP/TP+FN
# 양성을 옳게 양성으로 진달할 확률(2종 오류를 저지르지 않을 확률)
# 특이도: specificity
# specificity = TN/TN+FP
# 음성을 옳게 음성으로 진단할 확률(1종 오류를 저지르지 않을 확률)
# 정확도 accuracy
# accuracy = TP+TN/TP+TN+FP+FN
# 정밀도 precision
# precision=TP/TP+FP


# 3 확률변수와 확률 분포(1)

# 확률변수: random variable
# 확률적으로 서로 다른 값을 가질 수 있는 어떤 변수
# 어떤 시행에서 표본공간의 각 근원사건에 하나의 실수를 대응시키는 것
# 예) 동전 던지기의 확률변수: 동전을 던졌을 때 나오는 면
# x=h,t
# 이산확률변수:discrete random variable
# 확률변수 X가 취할 수 있는 값이 불연속일 때
# 연속확률변수 : continuous random variable
# 확률변수 X가 취할 수 있는 값이 연속일 때

# 확률분포: probability distribution
# 확류변수 X가 갖는 값과 X가 이 값을 가질 확률 사이의 대응 관계(함수)
# 이산확률 분포: discrete probability distribution
# 이산확률변수에 대한 확률질량함수: PMF, probability mass function
# 연속확률분포:continuous probability distribution
# 연속확률변수에 대한 확률밀도 함수: PDF, probability density function
# 확률 분포의 성질
# 이산확률분포 시그마
# 연속확률분포 적분

# 확률분포의 성절
# 이산확률분포
# 기댓값(=평균): E(X) = m= 시그마
# 분산:(X-m)^2의 평균
# V(X)
# 표준편차: 시그마(X) = V(X)^1/2

# 연속확률분포
# 기댓값(=평균): E(X)  적분
# 분산:V(X)
# 표준편차: 시그마(X) = V(X)^1/2

# 정규분포: normal distribution
# 확률밀도함수를 그래프로 그렸을 때 종형 곡선이 나타나는 확률분포
# 확률밀도함수
# 평균이 m 표준편차가 시그마인 정규분포: N(m, 시그마^2)
# 표준정규분포: standard normal distribution
# N(0,1^2) : 평균이 m=0, 표준편차가 시그마=1 인 정규분포
# 확률밀도함수

x <- seq(-3,3,length=200)
x
dnorm(x,0,1)
plot(x, dnorm(x,mean=0,sd=1),type='l')

# 정규분포의 유용성
# 다양한 사회 현상, 자연 현상에 대한 우리의 직관과 부합하는 특성을 가짐
# 대부분의 데이터는 평균을 중심으로 가까이 모여 잇꺼나
# 평균에서 양이나 음의 방향으로 떨어진 정도가 대기 비슷하거나
# 평균에서 많이 떨어진 값들은 그리 많이 존재하지 않는다.
# 모든 (확률) 모형은 틀렸따. 하지만 그 중 어떤 것은 유용하다
# all models are wrong, but some are useful
# 확률분포는 어디까지나 이론적 단순화에 불과하고
# 현실에서 발견되는 데이터가 특정 화귤ㄹ분포에 완전히 부합하지 않는다.

# 정규분포의 특성
# 기댓값(평균): 데이터의 분포를 숫자 하나로 요약할 수  있음
# 정규분포곡선은 봉우리가 하나 밖에 없고, 대부분의 값이 평균 주변에 있음
# 정규분포곡선은 평균을 중심으로 대칭 구조임
# 표준편차: ㄱ평균에서 자료가 얼마나 떨어져 있는지를 나타내느 ㄱ밧
# 표준편차 안에 들어오는 값의 비율이 항상 일정함
# 1X 표준편차 안에 들어오는 값의 비율: 70%
# 2X 표준편차 안에 들어오는 값의 비율 : 95%
# 표준편차는 정규분포곡선의 모양과 관련이 있음
# 표준편차가 클수록 그래프는 낮고 납작해지며
# 표준편차가 작을수록 그래프는 높고 뾰족해짐

x <- seq(0,100,length = 200)
plot(x, dnorm(x, mean=50, sd=10), type='l')

x<-seq(0,100,length=200)
plot(x, dnorm(x,mean=50,sd=20), type='l')

# X~N(30000, 10000^2)
# pnorm(q, mean=0, sd=1)
# q: vector of quantiles (quantiles: 분위수?)
# mean: vector of means
# sd: vector of standard deviations

pnorm(35000,30000,10000)- pnorm(25000,30000,10000)
pnorm(35000,30000,10000)
pnorm(25000,30000,10000)

x <- seq(10000, 50000, length = 200)
y <- dnorm(x, mean = 30000, sd = 10000)
plot(x, y, type='l')
xlim<-x[25000<=x&x<=35000]
xlim
ylim<-y[25000<=x&x<=35000]
xlim<-c(xlim[1],xlim,tail(xlim,1))
ylim<-c(0,ylim,0)
polygon(xlim,ylim,col='grey')

pnorm(25000,30000,10000)
1-pnorm(35000,30000,10000)

# 표준화(정규화): standardization
# 정규분포를 따르는 확률변수 X를 표준정규분포를 따르는 확률변수 Z로 변환
# X~N(m,시그마^2) -> Z=X-m/시그마, Z~N(0,1^2)
# 표준화ㅡㄹ 하는 이유
# 평균과 표준편차가 다른 정규분포를 따르는 두 변수의 값을 비교하는 경우

1-pnorm(70,60,10)
1-pnorm(80,70,20) 

z1<- (70-60)/10
z2<- (80-70)/20
z1
z2
1-pnorm(z1)
1-pnorm(z2)

curve(dnorm(x), -3, 3)
curve(pnorm(x), -3, 3)


# 이항 분포: binomial distribution
# 어떤 시행에서 사건이 일어날 확률이 p인 독립시행을 n회 반복할 때
# 사건이 일어나는 횟수인 확률변수 X는 이항분포 B(n,p)를 ㄸ라느다.
# X~B(n,p)
# X의 확률질량함수
# P(X=r)=nCrp^r(1-p)^n-r, r=0,1,2,...,n

n_sim <- 10000
y <- rbinom(s_sim, 100, 0.5)
y
hist(y,prob=T, breaks=30)
curve(dnorm(x,50,5), 25,75,lty=2,lwd=2,col='red',add=T)



# 확률변수와 확률분포(2)

# 확률변수와 확률분포
# 확률변수: random variable
# 확률 사건에서 나타날 수 잇는 개개의 결과를 수로 나타낸 것(X)
# 이산 확률변수: discrete random variable
# 연속 확률변수: continuous random variable
# 확률분포: probability distribution
# 확률변수 X가 취하는 값에 대응하는 확률을 나타내는 함수
# 확률 질량함수: probablility mass function, PMF
# 확률 밀도함수: probablility density function, PDF

# 확률분포 관련 R 함수
# d: density, p:probability, q: quantile, r:random
# 구분         균일분포       이항분포        정규분포          t-분포        F-분포          카이제곱- 분포
# 난수생성함수 runif()     rbinom()       rnorm()      rt()            rf()       rchisq()
# 확률밀도함수 dunif()     dbinom()        dnorm()     dt()       df()        dchisq()
# 누적확률함수 punif()      pbinom()        pnorm()      pt()      pf()     pchisq()
# 백분위수함수 qunif()       qbinom()       qnorm()      qt()       qf()       qchisq()

# 균일분포: uniform distribution
# 특정 범위 내에서 균등하게 나타나는 확률을 가지는 확률 분포
# runif(n, min, max)
# n: number of observation   observation 관찰
# min: lower limits of the distribution distribution 분배
# max: upper limits of the distribution

runif(n=100, min=0,max=100)

par(mfrow=c(1,3))
hist(runif(100, 0, 100),col='orange')
hist(runif(1000, 0, 100),col='salmon')
hist(runif(10000, 0, 100),col='tomato')
par(mfrow=c(1,1))

set.seed(2022)
hist(runif(100,0,100), col='steelblue')

# 이항분포: binomial distribution
# 베르누이 시행: Bernoulli trial  trial 시험
# 임의의 시행 결과가 성공 또는 실패 중 하나인 시행
# 이항분포: binomial distribution
# 성공확률이 p인 베르누이 시행을 독립적으로 n번 박복하여 시행했을때
# 시행의 결과가 성공인 시행의 횟수 X에 대한 확률분포
# X~B(n,p): 확률변수 X가 이항분포 B(n,p)를 따름

# X: 공평한 동전 던지기를 size번 실행햇을 때 앞면이 나온 횟수 (성공 = 앞면, 성공확률 p=0.5)
set.seed(2022)
rbinom(n=1, size=1,prob=0.5)
rbinom(n=1, size=10, prob=0.5)
rbinom(n=10,size=10, prob=0.5)
rbinom(n=100, size=10, prob=0.5)

set.seed(2022)
X <- rbinom(n=10000, size=100,prob=0.5)
hist(X, col = 'skyblue', breaks=15)

# 정규분포: normaldistribution
# 자연현상 또는 사회현상에서 자주 관찰되는 종 모양의 확률분포
# 정규분포는 평균과 분산(표준편차)에 따라 분포의 형태가 결정됨
# X~N(m,시그마^2): X는 평균이 뮤이고, 표준편차가 시그마인 정규분포를 따름
# rnorm(n,mean,sd)
# n:number of observations
# mean: vector of means
# sd: vector of standard deviations   standard 일반적인, 기준,  deviations 편차, 일탈

# X~N(172, 10^2): 경북대 대학원 학생들의 키(평균이 172, 표준편차가 10이라고 알려진 경우)
set.seed(2022)
X <- rnorm(n=1000,mean = 172, sd = 10)  # 난수생성함수 정규분포
hist(X, col='skyblue', breaks=30)

hist(X, col ='skyblue',breaks=30, freq=F)  # frequency 빈도 빈발
x <- seq(min(X), max(X), length.out=200)
x
curve(dnorm(x, 172, 10), add=T, col='tomato', lwd=2)  # 확률밀도함수 정규분포

# X~N(172,10^2)일때 어던 대학원 학생의 키가 160보다 크거나 180보다 작을 확률은?
pnorm(q=160, mean=172,sd=10)  # 누적확률함수 정규분포
pnorm(q=160,mean=172,sd=10,lower.tail=F)
pnorm(q=180,mean=172,sd=10)
pnorm(q=180,mean=172, sd=10, lower.tail=F)
1-pnorm(160,172,10)-pnorm(180,172,10,lower.tail=F)
1-pnorm(162,172,10)-pnorm(182,172,10,lower.tail=F)
1-pnorm(152,172,10)-pnorm(192,172,10,lower.tail=F)

# X~N(172,10^2)일 때 상위 5% 또는 하위 5%에 속하는 대학원생의 키는?
qnorm(p=0.05, mean= 172, sd = 10)  # 백분위수 함수  정규분포
qnorm(p=0.95, mean= 172, sd = 10)
qnorm(c(0.05,0.95),172,10)
qnorm(c(0.025, 0.975),172,10) 
qnorm(c(0.005,0.995),172,10)

# 표준 정규분포: Z~N(0,1): 평균이 0이고 표준편차가 1인 정규분포(확률변수를 Z로 표기)
x <- seq(from = -3, to = 3, length.out= 200)
plot(x, dnorm(x), type='l', col='tomato', lwd=2)   # 확률밀도함수 정규분포

# 정규분포를 따르는 확률변수의 값은 뮤 +- 1.96 * 시그마 범위 안에 있을 확률이 약 95%이다.
qnorm(c(0.025, 0.975), 0,1)  # 백분위수함수 정규분포
pnorm(c(-1.96,1.96),0,1)  # 누적확률함수 정규분포
qnorm(c(0.005, 0.995),0,1)  # 백분위수함수 정규분포
pnorm(c(-2.58,2.58),0,1)  # 누적확률함수 정규분포
1-pnorm(-1)-pnorm(1,lower.tail=F)
1-pnorm(-1.96)-pnorm(1.96,lower.tail=F)
1-pnorm(-2.58)-pnorm(2.58,lower.tail=F)


# 모집단과 표본집단 : population and samples
# 모집단: 연구의 대상이 되는 전체 집합
# 모집단 분포: 모집단의 데이터가 가지는 확률분포  # 확률분포: 가능한 모든 확률변수와 이 변수가 일어날 확률
# 표본집단: 모집단으로부터 추출한 부분 집합
# 표본분포: 모집단에서 추출한 표본 데이터가 가지는 확률분포
# 표본추출: sampling
# 복원추출: 추출한 표본을 되돌려놓고 다음 표본을 추출
# 비복원추출: 이미 추출한 표본은 제외하고 다음 표본을 추출

x <- 1:9
sample(x, size =7)
sample(x, size=10)
sample(x, size = 10, replace = T)

# 중심극한정리: central limit theorem
# 표본의 크기가 충분히 클 때 (n>=30)
# 표본분포는 모집단의 분포와 상관없이 정규분포를 따른다
# 평균이 뮤, 표준편차가 시그마인 모집단으로부터 n개의 표본을 추출하면
# 표본평균 X바 의 확률분포는 X바 ~ N(뮤, 시그마^2/n)인 정규분포에 근사한다.
# 표본분포의 평균은 모집단의 평균 뮤와 같다
# 표본분포의 표준편차(=표준오차)는 시그마/n^1/2

X.norm <- rnorm(n=10000, mean=50, sd= 25)
X.norm
hist(X.norm, col = 'orange', freq=F,  ylim=c(0,0.02))   # frequency 빈도, density 밀도
mean(X.norm)
sd(X.norm)

X.bar <- c()
for (i in 1:10000) {
  X.bar <- c(X.bar, mean(sample(X.norm, size = 100)))
}
hist(X.bar, col ='skyblue', freq=F)

X.unif <- runif(n=10000, min=0, max=100)  # 난수생성함수, 균일분포
X.unif
hist(X.unif, col = 'tomato', freq=F, ylim=c(0,0.02))
mean(X.unif)
sd(X.unif)

X.bar <- c()
for (i in 1:10000) {
  X.bar <- c(X.bar, mean(sample(X.unif, size = 100)))
}
hist(X.bar, col ='cyan3', freq=F)


# 5 통계적 추정과 가설 검정

# 통계적 추정과 구간 추정
# 통계적 추정: 수집한 표본집단으로부터 모집단의 특성(모수)을 추정   # 모수: 모집단의 특성을 나타내는 수치, 이에비해 표본의 성격을 나타낸 수치를 통계량
# 점추정: 모수에 대한 추정값을 하나의 값으로 추정
# 구간추정: 모수의 값이 포함되리라고 믿을 수 있는 범위를 추정
# 구간추정의 신뢰수준과 신뢰구간
# 신뢰구간: confidence level
# 모수가 추정한 구간 안에 있을 것이라 믿을 수 있는 정도 (95%, 99%)
# 신뢰구간: confidence interval
# 신뢰도에 따라 모수가 포함될 것이라 믿을 수 있는 구간

# 정규분포와 신뢰구간
# 정규분포 X~N(뮤, 시그마^2)을 따르는 모집단에서
# 크기가 n인 표본을 임의추출하여 얻은 표본평균이 X바 일때
# 모평균 뮤에 대한 구간추정
# 신뢰수준 95% 의 신뢰구간 1.96
# 신뢰수준 99%의 신뢰구간 2.58

height <- survey$Height
height
h.mean <- mean(height, na.rm=T)
h.mean
h.sd <- sd(height, na.rm=T)
h.sd
c(h.mean - 1.96*h.sd, h.mean + 1.96*h.sd)
c(h.mean - 2.58*h.sd, h.mean + 2.58*h.sd)

qnorm(0.025, mean=h.mean, sd= h.sd)  # 백분위수함수, 정규분포
qnorm(0.975, mean=h.mean, sd=h.sd)

pnorm(153.0797, mean=h.mean, sd = h.sd)  # 누적확률함수, 정규분포 
pnorm(191.6817, mean=h.mean, sd=h.sd, lower.tail=F)


x <- seq(h.mean-3*h.sd, h.mean+3*h.sd, length.out=200)
y<-dnorm(x, h.mean, h.sd)   # 확률밀도함수, 정규분포
y
plot(x,y,type='l', col='lightgrey', lwd=2)
abline(0,0,col='lightgrey',lwd=2)
xlim <- x[min(x) <= x & x <= max(x)]
ylim <- y[min(x) <= x & x <= max(x)] - 0.0001
xlim <- c(xlim[1],xlim, tail(xlim,1))
ylim <- c(0,ylim,0)
polygon(xlim, ylim, col='lightgrey')

# 가설검정: hypothesis test
# 가설: hypothesis
# 타당성의 유무를 명백히 밝혀야 하는 모수에 대한 주장
# 가설검정: hypothesis test
# 표본집단의 통계량을 이용하여 모수에 대한 주장의 진위를 검정하는 과정  # 검정: 일반적으로 특정한 시험에 의해서 합격, 불합격을 결정하는 것?
# 가설검정의 방법:
# 연구가설에 대한 귀무가설과 대립가설을 설정하고
# 표본으로부터 얻은 검정통계량이 귀무가설이 옳다는 전제하에서는
# 확률적으로 나타나기 어려운 극단적이고 예외적인 값이라는 것을 입증
# 표본자료에 기초하여 계산된 검정통계량은 귀무가설 h0가 참인 경우 해당 자료가 우리가 기대하는 것으로부터 얼마나 멀리 벗어나는지를 측정한다.
# 검정통계량의 종류   정규분포, t분포 , 카이제곱분포, F분포

# 가설검정
# 가설
# 타당성의 유무를 명백히 밝혀야 하는 모수에 대한 주장
# 가설검정
# 표본집단의 통계량을 이용하여 모수에 대한 주장의 진위를 검정하는 과정
# 가설검정의 방법
# 연구가설에 대한 귀무가설과 대립가설을 설정하고 
# 표본으로부터 얻은 검정통계량이 귀무가설이 옳다는 전제하에서는 
# 확률적으로 나타나기 어려운 극단적이고 예외적인 값이라는 것을 입증

# 귀무가설과 대립가설
# 연구주제: 경북대 대학원생의 평균 키가 한국 성인의 평균 키와 다를까?
# 귀무가설(H0): null hypothesis
# 모수에 대한 기존으 주장: 거짓으로 판단(기각)될 때까지 참으로 인정
# 경북대 대학원생의 평균 키는 한국 성인의 평균 키와 같다 
# 대립가설(H1): alternative hypothesis
# 모수에 대한 새로운 주장: 귀무가설이 거짓이라면 참(채택)이 되는 가설
# 경북대 대학원생의 평균 키는 한국 성인의 평균 키와 다른다.

# 가설검정의 오류
# 제 1종 오류: Type 1 error
# 귀무가설이 참이지만, 검정 결과에 따라 귀무가설을 기각하는 오류 (alpha)
# 제 2종 오류: type II error
# 귀무가설이 거짓이지만, 검정 결과에 따라 귀무가설을 채택하는 오류(Beta)
#                  가설 검정에 따라 판단
#                    H0 채택        H0 기각
# 귀무가설의  H0 참      -            1종 오류 (alpha = 유의수준)
# 실제 상황   H0 거짓   2종 오류(beta)   검정력 (1-beta)

# 통계적 유의성: statistical significance
# 유의수준(alpha): significance level
# 1종 오류를 범할 통계적 확률
# 일반적으로 표본으로부터 관측된 결과가 나타날 가능성이 5% 미만인 경우
# 통계적으로 유의하다: 이러한 관측결과가 나타날 확률이 매우 낮다
# 유의확률(p-value): significance probability
# 표본에서 관측한 통계량보다 더 극단적인 값이 발생할 확률
# p-value가 alpha 보다 크다: 귀무가설을 기각할 수 있는 증거가 부족함
# p-value가 alpha보다 작다: 귀무가설을 기각할 수 있는 증거가 충분함

# 가설검정의 절차
# 연구주제에 대한 귀무가설과 대립가설을 설정한다
# 유의수준 alpha를 결정한다 (alpha=0.05)
# 적절한 검정통계량을 선택한다
# 표본으로부터 검정통계량의 유의확률 p-value를 구한다.
# 귀무가설과 대립가설의 기각/채택 여부를 결정한다.
# p>alpha: 귀무가설을 기각할 수 없음
# p<alpha: 귀무가설을 기각하고 대립가설을 채택할 수 있음

# 이항분포와 가설검정
# 어떤 동전을 100번 던졌더니 앞면이 60번 나왔다 (p=0.6)
# 이 동전은 조작이 없는 공평한 동전이라고 할 수 있을까?
# 귀무가설과 대립가설 설정
# 귀무가설: 이 동전은 공평한 동전이 맞다 (p=0.5)
# 대립가설: 이 동전은 공평한 동전이 아니다. (p=/0.5)
# 유의수준 설정: alpha = 0.05
# 이항분포 B(100,0.5)에서 성공확률이 p=0.6인 결과가 나올 확률이
# 신뢰수준 95% 범위 안에 잇는가, 아니면 범위 밖에 있는가?
# 유의확률 확인: p-value
# p-value < 0.05: 귀무가설을 기각하고 대립가설을 채택할 수 잇음
# p-value > 0.05: 귀무가설을 기가하고 대립가설을 채택할 수 없음

# 100번의 동전을 던져서 앞면이 60번 나왓다면 공평한 동전이라고 할 수 있는가?
# H0: 이 동전은 공평한 동전과 다르지 않다(성공확률 p = 0.5)
# H1: 이 동전은 공평한 동전과 다르다 (성공확률이 p!=0.5)
binom.test(x=60, n=100, p=0.5)
# p-value>0.05: 95%의 신뢰구간 안쪽에 p=0.5가 포함됨
# 따라서 유의수준 alpha = 0.05에서 귀무가설을 기각할 수없다

set.seed(2022)
X <- rbinom(n=10000, size=100, prob=0.5)
X
hist(X, col='lightgray', breaks=15, freq=F)
x <- seq(0,100,1)
x
curve(dnorm(x, mean(X), sd(X)), add=T, col = 'tomato', lwd=2)  # 확률밀도함수, 정규분포

qnorm(p=0.095, mean(X),sd(X), lower.tail=F) # 백분위수함수, 정규분포 ,  값????

pnorm(q=60, mean(X), sd(X), lower.tail=F)  # 누적확률함수, 정규분포 ,   넓이???

# 100번의 동전을 던져서 앞면이 65번 나왔다면, 공평한 동전이라고 할 수 있는가?
# H0: 이 동전은 공평한 동전과 다르지 않다 (성공확률이 p=0.5)
# H1: 이 동전은 공평한 동전과 다르다(성공확률이 p!=0.5)
binom.test(x=65,n=100,p=0.5)
# p-value < 0.05: 95%의 신뢰수준 바깥쪽에 p=0.5가 위치함
# 따라서, 유의수준 alpha=0.05에서 귀무가설을 기각할 수 잇다.

# 100번의 동전을 던져서 앞면이 35번 나왓따면, 공평한 동전이라고 할 수 있는가?
# H0: 이 동전은 공평한 동전과 다르지 않다 (성공확률이 p=0.5
# H1: 이 동전은 공평한 동전과 다르다(성공확률이 p!=0.5)
# 단 유의수준 alpha=0.01로 결정(신뢰수준 99%)
binom.test(35,100,0.5,conf.level=0.99)

# 양측검정과 단측검정
# 양측검정 : two-sided hypothesis test
# 귀무가설 H0: 세타 = 세타0  에 대해 대립가설을 H0: 세타 != 세타0로 설정
# 단측검정: one-sided hypothesis test
# 하단측검정 one-sided lower hypothesis test
# 귀무가설 H0 세타 >= 세타0  에 대해 대립가설을 H1: 세타 < 세타0로 설정
# 상단측 검정 one sided upper hypothesis test
# 귀무가설 H0 세타 <= 세타0 에 대해 대립가설을 H1: 세타 > 세타0 로 설정

# 100번의 동전을 던져서 앞면이 60번 나왔따면, 이 동전은 앞면이 더 많이 나오는 동전ㅇ리까?
# H0 이 동전은 앞면이 더 많이 나오지 않는다 성공확률이 p <= 0.5
# H1 이 동전은 앞면이 더 많이 나온다. 성공확률이 p>0.5
binom.test(60,100,0.5, alternative = 'greater')  # 이항분포와 가설검정
# p-value < 0.05: 95% 신뢰구간 바깥쪽에 p=0.5가 위치함
# 따라서 유의수준 alpha = 0.05에서 귀무가설을 기각할 수 잇다.

# 100번의 동전을 던져서 앞면이 45번 나왔다면, 이 동전은 앞면이 더 적게 나오는 동전일까
# H0 이 동전은 앞면이 더 적게 나오지 않ㄴ느다 (성공확률이 p >= 0.5)
# H1 이 동전은 앞면이 더 적게 나온다(성공확률이 p<0.5)
binom.test(45,100,0.5,alternative = 'less')  # 이항분포와 가설검정
# p-value>0.05: 95%의 신뢰구간 안쪽에 p=0.5가 위치함
# 따라서, 유의수준 alpha = 0.05에서 귀무가설을 기각할 수 없다.

# 정규성 검정: normality test
# 정규성 가정: 통계분석의 여러 검정 방법들이 데이터가 정규분포임을 가정
# 정규성을 가정하는 통계분석 방법을 사용할 때는 정규성을 검정해야 함
# 정규성 검정: normality test
# 귀무가설: 데이터의 분포가 정규분포를 따른다
# 대립가설: 데이터의 분포가 정규분포를 따르지 않는다.
# 샤피로-윌크 검정: shapiro_wilk normality test
# 귀무가설: 표본 데이터가 정규성을 만족한다
# 유의수준 0.05를 적용하면
# p-value가 0.05보다 클 때 정규성을 만족한다고 주장할 수 있음
# shapiro.test(x)
# x: a numeric vector of data values

# survey 데이터셋의 Height와 Age는 각각 정규성을 만족하는 가?
shapiro.test(survey$Height)  # 샤피로윌크 검정, 귀무가설: 표본 데이터가 정규성을 만족한다. 정규성 검정?????

shapiro.test(survey$Age)# 샤피로윌크 검정, 귀무가설: 표본 데이터가 정규성을 만족

set.seed(2022)
x.unif <- runif(100,min = 0, max = 100)  # 난수생성함수, 균일분포
x.unif
x.norm <- rnorm(100,mean(x.unif), sd(x.unif))  # 난수생성함수, 정규분포

shapiro.test(x.unif)  # 귀무가설: 표본 데이터가 정규성을 만족한다
shapiro.test(x.norm)

par(mfrow=c(1,2))
qqnorm(x.unif,col='tomato')
qqline(x.unif)
qqnorm(x.norm,col='steelblue')
qqline(x.norm)
par(mfrow=c(1,1))



# 6 t-분포와 평균 검정

# 스튜던트의 t-분포 : Student's t-distribution
# 정규분포를 따르는 모집단으로 부터 추출한 표본의 확률 분포
# 검정통계량 = t-value: t=X바 - 뮤/ s / n^1/2
# n: 표본크기, X바: 표본평균, 뮤: 모평균, s: 표본표준편차, s/n^1/2: 표준오차
# t-value는 t-분포를 따름
# 종 모양의 형태를 가지면서 표본크기에 따라 종 모양이 달라짐
# 상대적으로 정점이 낮고 양쪽 꼬리 부분이 더 두터우면서 퍼져 있는 모습
# 표본크기가 작은 경우가 큰 경우보다 변동성이 더 큰 분포를 보임
# 표본의 크기가 충분히 커지면 t-분포와 정규분포가 거의 유사함

# 자유도: degree of freedom
# 자유도: 모집단에 대한 정보를 주는 독립적인 자료의 개수
# 크기가 n인 표본에서 관측값의 자유도는 n-1
# t-분포의 자유도: df = n-1
# 표본의 크기 n에 따라 t-분포의 분산(표준편차)이 달라짐
# 모집단의 분산: 시그마 제곱 a 뮤 n
# 표본집단의 분산: s^2  X바   n-1
# 표본의 크기가 충분히 크면 (n >= 30)
# t-분포으 ㅣ분산이 정규분포의 분산과 거의 유사해짐 n = n-1

x <- seq(-3,3,length=200)
x
curve(dt(x, df=30), min(x), max(x), lty=1, lwd=3, col='darkblue',
      main='PDF of t-distribution', xlab='t', ylab = 'density')  # dt 확률밀도함수 ,t-분포
curve(dt(x, df=5), min(x), max(x), lty=2, lwd=3, col='violet', add=T) # 확률밀도함수, t-분포
curve(dt(x, df=1), min(x), max(x), lty=3, lwd=3, col ='tomato', add=T) # 확률밀도함수, t-분포

legend('topright', legend=c('df=30','df=5','df=1'),
       col = c('darkblue','violet','tomato'), lty=c(1,2,3))


# t-분포와 구간추정
# t-분포의 특성을 이용하여 모집단 평균의 가능한 범위 예측
# 신뢰수준: 관측값이 일정 구간 내에 포함될 확률
# 모집단으로부터 n=20인 표본추출을 여러 번 반복하면
# 표본평균의 95% 는 모집단 평균과 약 두 배의 표준오차 범위 내에 있음
# 신뢰구간: 임의의 표본으로부터 산출된 표본평균과 표준오차 정보를 바탕으로 
# 95%의 신뢰도로 모집단 평균이 포함되는 범위를 계산 가능
# 표본평균의 범위:  X바
# 모평균의 범위: 뮤
# t0.05,19: alpha=0.05, df=19에 대응하는 t-value

# t-분포와 t-검정
# 모집단의 평균을 알지만 분산(표준편차)을 모를 때
# 모집단으로 부터 추출한 표본으로부터 추정된 표준오차를 통해
# t-분포에 의존하여 가설을 검정하는 방법

# 귀무가설과 대립가설
# 귀무가설: 표본집단은 모집단과 (평균, 비율이)다르지 않다
# 대립가설: 표본집단은 모집단과 (평균, 비율이) 다르다.
# t-검정의 가정
# 정규성 가정: 모집단은 정규분포를 따른다.
# 등분산성 가정: 두 집단을 비교할 때 두 집단의 분산이 동일한다.

# t-검정의 사례
# 대학원 박사과정 학생들은 스트레스를 많이 받아서 평균 혈압이
# 같은 연령대의 다른 사람들에 비교하면 차이점이 있을 것 같다
# 귀무가설: 대학원 박사과정 학생들의 혈압은 다른 사람들과 다르지 않다
# 대립가설: 대학원 박사과정 학생들의 혈압은 다른 사람들과 다르다.
# 가설검정: 귀무가설이 사살이라는 전제하에 
# 표본으로부터 얻은 t-값이 얼마나 흔하게/드물게 관찰될 수 있느낙
# 표본추출 n=20, X바=135, s=25, 뮤=115
# t=3.58

# 유의수준 0.05 또는 0.01에서의 t-값을 구한 후 관측된 t값과 비교
t <- (135-115)/(25/sqrt(20))
t

pt(3.58, df=19, lower.tail=F)*2  # 누적확률함수, t-분포
qt(0.025, df=19, lower.tail=F)
qt(0.005,df=19,lower.tail=F)
# 유의수준 0.05에서 귀무가설을 기각: 박사과정 학생들의 혈압은 다른 사람들과 같지 않다.

# 신뢰구간: confidence interval
# t-분포의 특성을 이용하여 모집단평균의 가능한 범위 예측
# 정규분포 또는 t-분포: 평균과 표준편차를 알면 신뢰도를 알 수 있음
# 일반적으로 표본의 개수가 작을 때(n<30)는 t-분포를 활용
# 신뢰도: 관측값이 일정 구간 내에 포함될 확률
# 모집단으로부터 n=20인 표본추출을 반복하면 표본평균의 95%는
# 모집단 평균과 약 두 배의 표준오차 범위 내에 잇음(자유도 df =19)

x<-seq(-4,4,length=300)
y<-dt(x,df=19)  # 확률밀도함수, t-분포
plot(x, y, type='l')

xlim <- x[-4<=x & x<=-2.09]
ylim <- y[-4<=x & x<=-2.09]
xlim <- c(xlim[1], xlim, tail(xlim,1))
ylim<-c(0,ylim,0)
polygon(xlim,ylim,col='grey')

xlim <- x[2.09<=x & x<=4]
ylim <- y[2.09<=x & x<=4]
xlim <-c(xlim[1],xlim,tail(xlim,1))
ylim<-c(0,ylim,0)
polygon(xlim,ylim,col='grey')


# 구간 추정
# 임의의 표본으로 부터 산출된 표본평균과 표준오차 정보를 바탕으로
# 95%의 신뢰도로 모집단평균이 포함되는 범위를 계산 가능
# 표본평균의 범위 X바
# t0.05,19: alpha=0.05(자유도=19)에 대응하는 t값(=2.09)
# 모평균의 범위: 뮤

# 평균검정: t-test
# 평균을 비교할 때 쓸 수 있는 가설검정 방법
# 단일표본 평균검정
# 표본평균을 가설로 정한 값과 비교
# 독립표본 평균 검정
# 두 집단간으ㅣ평균을 비교해서 집단으 ㅣ차이에 대한 가설검정
# 대응표본 평균검정
# 관측값이 서로 쌍을 이루는 경우(사전-사후)에 대한 가설 검정

# 단일 표본 평균 검정: one-sample t-test
# 하나의 표본 데이터를 이용하여 모집단의 평균이 특정값과 같은지 검정
# 표본집단이 특정 모집단과 일치하는지 혹은 그렇지 않은지 알 고 싶을 때 
# 대학원 박사과정생의 혈압은 동일 연령대의 다른 사람들의 혈압과 동일하낙
# 가구당 소득에 대한 표본을 바탕으로 기존에 알려진 가구당 소득이 맞는가

# MASS 패키지의 cats 데이터셋을 이용한 단일표본 평균검정
str(cats)

# 귀무가설: 고양이의 몸무게는 2.6kg이다
t.test(x=cats$Bwt, mu=2.6)

t.test(cats$Bwt, mu=2.7)

# 단측검정: 고양이의 몸무게가 2.6kg보다 크다
t.test(cats$Bwt, mu=2.6, alternative='greater')

cats.t <- t.test(cats$Bwt, mu=2.6)
str(cats.t)
cats.t
cats.t$p.value
cats.t$conf.int

t.test(cats$Bwt, mu=2.6, conf.level=0.99)


# 7 두 집단의 차이검정

# 평균검정: t-test
# 평균을 비교할 때 쓸 수 있는 가설검정 방법
# 단일표본 평균검정: one sample t-test
# 표본평균을 가설로 정한 값과 비교
# 독립표본 평균검정 two independent samples t-test
# 두 집단간의 평균을 비교해서 집단의 차이에 대한 가설검정
# 대응표본 평균검정 paired samples t-test
# 관측값이 서로 쌍을 이루는 경우(예 사전 - 사후)에 대한 가설검정

# 단일표본 평균검정: one sample t-test
# 하나의 표본 데이터를 이용하여 모집단의 평균을 검정
# 표본집단의 평균이 모집단의 평균과 같은가를 검정하고 싶을 때
# R: t.test(x, mu)
# x: a numeric vector of data values
# mu: a number indicating the true value of the mean

# H0: 호주 대학생 전체의 평균 키는 175cm 이다
# H1: 호주 대학생 전체의 평균 키는 175cm가 아니다.
library(MASS)
t.test(survey$Height, mu=175)

# H0: 호주 대학생 전체의 평균 키는 172cum 이다
# H1: 호주 대학생 전체의 평균 키는 172cm가 아니다.
t.test(survey$Height, mu=172)

# H0: 호주 대학생 전체의 평균 키는 171cm 이다
# H1: 호주 대학생 전체의 평균 키는 171cm가 아니다.
t.test(survey$Height, mu=171, conf.level = 0.99)

# H0: 호주 대학생 전체의 평균 키는 173cm 보다 크지 않다
# H1: 호주 대학생 전체이 평균 키는 173cm보다 크다
t.test(survey$Height, mu=173, alternative='greater')

# H0: 호주 대학생 전체의 평균 키는 174cm 보다 작지 않다
# H1: 호주 대학생 전체의 평균 키는 174cm 보다 작다.
t.test(survey$Height, mu=174, alternative='less')

t.height <- t.test(survey$Height, mu = 172)
str(t.height)

# 독립표본 평균검정: two independent samples t-test
# 두 개의 독립표본 데이터를 이용하여
# 각각 대응되는 두 개의 모집단평균이 서로 동일한지 검정
# 두 집단이 서로 차이가 있는지를 검정하는 것과 같은 의미
# 남녀 간의 영어시험 점수에 차이가 있는가
# 흡연자와 비흡연자 간의 폐질환 발생률은 차이가 있는가
# 고학력자와 저학력자 간의 텔레비전 시청 시간에 차이가 있는가
# R:t.test(formula, data, ...)
# formula: a formula of the form lhs ~ rhs.
# data: a data frame containing the variables in the formula # 공식 식, 방식

# MASS 패키지: cats 데이터 셋
# 고양이의 심장 무게와 몸무게에 대한 데이터
# 변수 3개와 관측값 144개
# Sex: 고양이의 성별(F,M)
# Bwt: 고양이의 몸무게 (kg)
# Hwt: 고양이의 심장무게(g)

library(MASS)
?cats
str(cats)

library(stargazer)
stargazer(cats, type='text')

with(cats, tapply(Bwt, INDEX=list(Sex), FUN = mean))

with(cats, tapply(Hwt, INDEX=list(Sex), FUN = mean))

# H0: 고양이의 몸무게는 성별에 따른 차이가 없다
# H1: 고양이의 몸무게는 성별에 따라 차이가 있다
t.test(formula = Bwt ~ Sex, data=cats)

# H0: 고양이의 심장 무게는 성별에 따라 차이가 없다
# H1: 고양이의 심장 무게는 성별에 따라 차이가 있다
t.test(formula=Hwt~Sex, data=cats)

# 대응표본 평균검정: paired-samples t-test
# 독립표본의 가정: 두 개의 표본이 서로 독립인 모집단으로부터 표본 추출
# 두개의 표본이 서로 독립이 아닌 모집단으로부터 추출
# 대응표본: 두 표본의 값이 쌍(pair)을 이루고 있는 경우
# 예) 아침식사가 IQ 테스트 점수에 미치는 영향
# 독립표본: 무작위로 실험 대상자를 선정하여 두 개의 집단으로 나눔
# 한 집단은 아침식사를 하고, 다른 집단은 아침식사를 거르고 테스트
# 대응표본: 무작위로 실험 대상자를 선정: IQ 테스트를 두 차례 실시
# 한 번은 아침식사를 하고, 다른 한 번은 아침식사를 하지 않고 테스트

# 표준 패키지: sleep 데이터셋
# 약물이 수면 시간에 미치는 영향에 대한 실험 데이터
# 변수 3개와 관측값 20개
# extra: 수면시간의 증가
# group: 처방된 약물
# ID: 환자의 ID

?sleep
str(sleep)
sleep

library(tidyr)
spread(sleep, key=group, value=extra)  # 펼치다 펴다

# H0: 약물 복용 전과 복용 후에 환자의 수면시간에는 차이가 없다(약물이 효과가 없다)
# H1: 약물 복용 전과 복용 후에 환자의 수면시간에는 차이가 있다(약물이 효과가 있다.)
t.test(extra ~ group, data=sleep, paired=TRUE)  # 짝을 짓다?

# H0: 약물 복용 전과 복용 후에 환자의 수면시간에는 차이가 없다(약물이 효과가 없다)
# H1: 약물 복용 전과 복용 후에 환자의 수면시간에는 차이가 있다(약물이 효과가 있다.)
sleep.wide <- spread(sleep, key=group, value=extra)
names(sleep.wide) <- c('ID','group.1','group.2')

t.test(sleep.wide$group.1, sleep.wide$group.2, paired =T)


