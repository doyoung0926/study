# 5 함수의 이해

# 수학에서의 함수: function in mathematics
# 두 집합 X, Y에 대해서 X의 각 원소에 Y의 원소가 일대일 대응 관계일 때
# 함수 f: X -> Y
# y=f(x): X의 원소 x와 Y의 원소 y의 대응 관계
# x는 함수의 입력값(input), y는 함수의 출력값(output)

# 프로그래밍 언어에서의 함수: function in programming language
# 어떤 입력값에 대해서 계산된 출력값을 되돌려 주는 일련의 실행 절차
# 다른 용어: procedure, subroutine
# sum (input)
# output

# 내장 함수: built-in functions
# 외부 패키지를 불러오지 않고도 쓸 수 있도록 기본적으로 제공되는 함수들
# 구분    / 함수 정의     / 출력값
# 수학 관련 / abs(x)  / 절대값
# sqrt(x)   / 제곱근
# log(x), log10(x)   / 자연로그, 밑이 10인 로그
# exp(x)  / 자연 상수 e의 거듭제곱
# sin(x), cos(x), tan(x) / 삼각 함수
# ceioing(x), floor(x) / 천장값, 바닥값
# round(x, digits = n)  / 반올림수

# 통계 관련 / sum(x)  / 합계
# mean(x)  / 평균
# var(x)  / 분산
# sd(x)  / 표준편차
# median(x) / 중앙값
# quantile(x, probs) / 분위값
# min(x), max(x) / 최솟값, 최댓값
# range(x) / 범위값

# 사용자 정의 함수: user-defined functions
# 사용자가 직접 함수를 정의하여 사용할 수 있음
# function.name <- function (parameters) {
#  function.bodies
#  return (return_value)
# }

add <- function (x, y) {
  z <- x + y
  return (z)
}
add
add(3, 4) 

# 매개변수: parameters, arguments
# 함수의 입력값을 전달받는 변수
# 다른 용어: 형식인자, 인자, 인수
# 매개변수를 전달할 때 매개변수명과 매개변수값을 지정할 수 있음
# 매개변수명을 전달하지 않으면 매개변수 순서에 따라 전달됨

func1 <- function (x,y,z) {
  return (x+2*y+3*z)
}
func1(1,2,3)
func1(x=1,y=2,z=3)
func1(3,2,1)
func1(z=3,x=2,y=1)
func1(1,z=2,y=3)

# 매개변수의 기본값: default value
# 함수를 정의할 때 매개변수에 기본값을 지정할 수 있음
# 기본값이 지정되어 있는 매개변수는 함수를 호출할 때 생략 가능함
# 기본값이 지정되어 있지 않은 매개변수는 생략하면 안됨

func2 <- function(x,y=1,z=0) {
  return (x+2*y+3*z)
}
func2(1,2,3)
func2(1)
func2(1,2)
func2(y=2,z=3)
func2(2,3,x=1)
func2(z=1,x=2)

# 여러 매개변수가 있는 내장 함수를 호출할 때 기본값이 있으면 생략 가능
pi
round(x=pi, digits=4)
round(pi,2)
round(digit=4,x=pi)
round(digits=3)

head(iris)
head(x=iris,n=3)
head(n=3,iris)
head(3,iris)

# return 문자을 생략하면 마지막 계산값이 리턴됨
# 블록에 들어갈 문장이 하나뿐이라면 {}는 생략 가능
sadd1 <- function(x,y) {
  return(x+y)
}
sadd1(3,4)
sadd2 <- function(x,y) {
  x+y
}
sadd2(3,4)
sadd3 <- function(x,y) x+y
sadd3(3,4)

# 매개변수는 벡터 등의 다른 R 데이터 오브젝트로 지정 가능
square <- function(x) x^2
square(1:10)

vadd <- function(x,y) x+y
vadd(1:3, 3:1)

vmult <- function(x, y=0) x*y
vmult(1:3)
vmult(1:3,3:1)

# 함수형 프로그래밍:functional programmming
# 모든 코드를 함수를 위주로 구현하고자 하는 프로그래밍 패러다임
# 조건문과 반복문을 매우 싫어함
# R 코드는 함수형 프로그래밍으로 많이 작성함
# 조건문을 대체할 함수: ifelse()
# 반복문을 대체할 함수: apply() 계열 함수 등

# ifelse() 함수
# R에서 대부분의 조건문은 ifelse() 함수로 대체 가능
# ifelse(condition, treu.value, false.value)

x<-10
y<-20
ifelse(x<y,x,y)
ifelse(x>y,x,y)

score<-88
grade<-ifelse(score>=90,'A',ifelse(score>=80,'B','C'))
grade

# sapply(함수)
# 벡터의 각 원소에 어떤 함수를 적용한 결과를 벡터로 리턴
# sapply(x, FUN, ...)

is.odd <- function(n) n%%2==1
is.odd(7)

odd.cnt.1<-function(n,m) {
  count<-0
  for (i in n:m) {
    if (is.odd(i))
      count <- count + 1
  }
  count
}
odd.cnt.1(10,20)

is.odd <- function(n) n%%2==1
is.odd(7)

odd.cnt.2 <- function(n,m) {
  sum(sapply(n:m,is.odd))
}
odd.cnt.2(10,20)



# 6 데이터 프레임
# 데이터 프레임: data.frame
# R에서 2차원 테이블 형태로 데이터셋을 저장하는 가장 기본적인 자료구조
# 변수는 열(column)로, 관측값은 행(row)으로 저장

# 데이터 프레임은 벡터의 리스트처럼 생각할 수 있음
v1<-1:7
v2<-c('홍길동','전우치','주니온','아사달','아사녀','연오랑','세오녀')
v3 <- factor(c('M','M','M','M','F','M','F'))
df <- data.frame(no = v1, name = v2, sex = v3)
str(df)
head(df)
iris[1:5,]
iris[1:5, 1:4]
iris[1:5,-5] # 위와 동일

# 데이터 프레임은 리스트처럼 $ 기호로 열 벡터를 가져올 수 있음
iris$Sepal.Length
iris[,1] # 위와 동일
iris[,'Sepal.Length'] # 위와 동일
iris$Species 
iris[,5] # 위와 동일
iris[,'Species'] # 위와 동일

# 하나의 열은 벡터로 다루지만, 하나의 행은 데이터 프레임(인덱싱의 경우에도 마찬가지)
iris[1,]
class(iris[1,])
class(iris[,1])
class(iris[,5])

# 데이터 프레임에서도 조건식을 이용하여 필터링할 수 있음
summary(iris$Sepal.Length)
iris[iris$Sepal.Length<5.1,]
iris[iris$Sepal.Length<5.1 & iris$Species=='versicolor',]
with(iris,iris[Sepal.Length <5.1 & Species =='versicolor',])  # 위와 동일

# 데이터 프레임에 새로운 변수(열 벡터)를 추가할 수도 있음
df <- iris
head(df, n=3)
df$Sepal.Sum<-df$Sepal.Length+df$Sepal.Width
head(df,n=3)

# 데이터 객체의 자료형 확인과 변환
# is.xxx() 함수: 데이터 구조의 자료형 확인
# as.xxx() 함수: 데이터 구조의 자료형 변환
# 행렬은 데이터 프레임으로 자료형 변환이 가능함

# state.x77: 행렬 형태로 제공되는 R의 내장 데이터셋
?state.x77
str(state.x77)
class(state.x77)
is.matrix(state.x77)
is.data.frame(state.x77)

# state.x77 데이터셋을 행렬에서 데이터 프레임으로 변환
df.x77 <- as.data.frame(state.x77)
is.data.frame(df.x77)
str(df.x77)

# 데이터 프레임의 저장과 불러오기
# 연구 데이터의 관리
# 엑셀 파일로 저장한 연구 데이터를 데이터 프레임으로 불러오기
# 데이터 처리를 완료한 연구 데이터를 엑셀 파일로 저장하기
# csv 파일: comma separated value
# R에서는 csv 파일을 일고 쓰는 함수가 기본적으로 제공됨
# write.csv(), read.csv()
# 엑셀 파일 직접 읽어오기: readxl 패키지 활용

# iris 데이터셋을 csv 파일로 저장하고 다시 불러오기
getwd()
write.csv(iris, file='iris.csv')
write.csv(iris, file='iris2.csv', row.names = F)

df1 <- read.csv(file ='iris.csv')
str(df1)

df2 <- read.csv(file='iris2.csv', stringsAsFactors = T)
str(df2)

# 엑셀 파일로 저장한 데이터를 엑셀에서 직접 읽어오기
install.packages('readxl')
library(readxl)
df <- read_excel(path='성적표.xlsx', sheet=1)
str(df)
head(df)



# 7 데이터 전처리 (1)
# 결측치와 이상치

# 데이터 전처리: Data Preprocessing
# 본격적인 통계분석을 시작하기 전에 필요한 데이터 정제 작업
# 결측치와 이상치: missing values and outliers
# 데이터의 변환: integration, filtering, sampling, and so on.
# 데이터의 표준화: standardization

# 결측치: missing values
# 설문 결과, 실험 결과 등의 연구 데이터에서 누락된 관측값이 존재할 경우
# 결측치가 포함된 관측값을 연구 데이터에서 제거하거나
# 결측치를 적절한 다른 값으로 대체해야 함
# NA: R에서 결측치를 나타내는 값

# 결측치가 포함된 벡터의 통계값 구하기
x <- c(45,NA, 87, 63, 55, NA, 72, 61, 59, 68)
x
mean(x)
mean(x, na.rm=T)
var(x, na.rm=T)
sd(x, na.rm=T)

# 벡터에 포함된 결측치를 다른 값으로 대체하기
x <- c(45,NA,87,63,55,NA,72,61,59,68)
is.na(x)
x[is.na(x)]
x[!is.na(x)]
x[is.na(x)] <- mean(x, na.rm=T)
x

?airquality
str(airquality)

# complete.cases() 함수: 데이터 프레임에서 결측치가 포함된 관측값(행) 확인
df <- airquality
complete.cases(df)
df[complete.cases(df), ]
df[!complete.cases(df), ]

# 결측치에 관련된 정보 확인: 결측치의 개수와 비율
sum(is.na(df$Ozone))
sum(is.na(df$Solar.R))
sum(is.na(df$Solar.R) & is.na(df$Ozone))
sum(!complete.cases(df))
mean(!complete.cases(df))
View(df)
# VIM 패키지의 aggr() 함수: 변수별로 결측치의 분포와 발생 패턴을 시각화
library(VIM)
?aggr
aggr(airquality, prop=F, numbers=T, sortVar=T)

# na.omit() 함수: 데이터 프레임에서 결측치를 제거
airquality[complete.cases(airquality), ]
nrow(airquality[complete.cases(airquality), ])

df <- na.omit(airquality)
str(df)

# mice 패키지의 mice() 함수: 결측치를 여러 가지 통계적 방법으로 대체 (imputation)
# library(mice)
result <- mice(airquality, method='mean', m=2, maxit=2)
result$imp$Ozone
result$imp$Solar.R

# 이상치: outliers or anomalies
# 특이값: 정상적인 데이터의 분포 범위 밖에 위치하는 관측값
# 입력 오류에 의해 발생한 이상치
# 키의 데이터에서 단위가 다른 경우 등
# 실제로 특이한 값을 가진 이상치
# 부모의 월 소득 정보에서 재벌 2세가 포함된 경우 등

# boxplot() 함수: 데이터셋에 이상치가 존재하는 지를 시각화
df <- data.frame(state.x77)
boxplot(df$Income, pch=19, col ='orange', border='brown')

# boxplot.stats() 함수를 이용한 이상치에 대한 상세 확인
boxplot.stats(df$Income)

outlier <- boxplot.stats(df$Income)
df[df$Income==outlier$out, ]

# 이상치가 통계량을 왜곡할 때는 결측치로 변환하여 통계분석 대상에서 제외
df <- data.frame(state.x77)
nrow(df)
df[df$Income == outlier$out, ] <- NA
df[!complete.cases(df),]
df.no.outlier <- na.omit(df)
nrow(df.no.outlier)

# 범주로 구분할 수 있는 데이터는 범주별로 이상치를 확인할 수 있음
boxplot(Petal.Width ~ Species, data=iris,
        pch=19, col='orange', border='brown')

# 이상치가 여러 개인 경우에는 %in% 연산자를 활용하여 결측치를 제거
df <- with(iris, iris[Species =='setosa',])
boxplot.stats(df$Petal.Width)
outlier <- boxplot.stats(df$Petal.Width)$out
df[df$Petal.Width %in% outlier, ] <- NA
df.no.outlier <- na.omit(df)
nrow(df.no.outlier)



# 데이터 전처리 (2)
# 선택, 집계, 분리, 결합, 정렬
# 데이터 다루기: Wrangling Data
# 데이터의 형태를 통계분석에 적합한 형태로 변환하기 위한 R 함수들
# 선택: subset()
# 집계: aggregate()
# 분리: split()
# 결합: rbind(), cbind(), merge()
# 정렬: sort(), order()

# subset() 함수: 인덱싱이나 필터링보다 간편하게 필요한 데이터를 추출
subset(iris, subset = Species == 'setosa')
subset(iris, select = c(1,2,5))
subset(iris, subset = Sepal.Length > 7.5)
subset(iris, subset = Sepal.Length > 7.5 & Sepal.Width > 3.0)
subset(iris, 
       subset = Sepal.Length > 7.5 & Sepal.Width > 3.0,
       select = c(1,2,5))

# split() 함수: 데이터 프레임을 범주형 변수를 기준으로 여러 개로 분할
split(iris, f = iris$Species)
df <- split(iris, f = iris$Species)
names(df)
summary(df)
df$setosa
df$versicolor

# aggregate() 함수: 범주별로 통계량을 확인하고 싶을 때 주로 활용
df <- subset(iris, select=c(1,2))
aggregate(df, by=list(Species=iris$Species), FUN=length)
aggregate(df, by=list(Species=iris$Species),FUN=mean)
aggregate(df, by=list(Species=iris$Species), FUN=sd)

# aggregate() 함수: 여러 개의 범주를 사용해서 분할할 수도 있음
str(mtcars)
df <- subset(mtcars, select=c('mpg','hp','wt'))
aggregate(df,
          by=list(cyl=mtcars$cyl, gear=mtcars$gear),
          FUN=mean)

# rbind() 함수: 행(row)을 기준으로 여러 개의 데이터 프레임을 결합
df.split <- split(iris, f=iris$Species)
df.rbind <- rbind(df.split$setosa, df.split$virginica)
str(df.rbind)

# cbind() 함수: 열(column)을 기준으로 여러 개의 데이터 프레임을 결합
df.sepal <- subset(iris, select = c(1,2))
str(df.sepal)
df.petal <- subset(iris, select = c(3,4))
str(df.petal)
df.cbind <- cbind(df.sepal, df.petal)
str(df.cbind)

# merge() 함수: 특정 변수의 값이 같은 행을 기준으로 여러 개의 데이터 프레임을 병합
x <- data.frame(name=c('A','B','C'), kor=c(60,70,80))
y <- data.frame(name=c('A','B','D'), eng=c(65,75,85))
cbind(x,y)
merge(x,y)
merge(x,y,all=T)
merge(x,y,all.x=T)
merge(x,y,all.y=T)

# merge() 함수: 해당 컬럼이 모두 존재하지 않는 경우에는 NA 값으로 병합
x<-data.frame(name=c('A','B','C'),kor=c(60,70,80))
y<-data.frame(NAME=c('A','B','D'),eng=c(65,75,85))
merge(x,y)
merge(x,y,by.x='name',by.y='NAME')
merge(x,y,by.x='name',by.y='NAME',all=T)

# sort()와 order() 함수: 벡터의 값을 오름차순/내림차순으로 정렬하거나 정렬 위치를 반환
sort(mtcars$mpg)
sort(mtcars$mpg, decreasing = T)
order(mtcars$mpg)
order(mtcars$mpg, decreasing = T)

# order() 함수: 정렬 후의 위치를 알려주므로, 데이터 프레임을 변수의 순서대로 정렬할 때 유용
ord <- order(mtcars$mpg, decreasing=T)
mtcars[ord,1:6]

mtcars[ord[1:10], 1:6]
n <- length(ord)
mtcars[ord[(n-10):n],1:6]

# order() 함수: 여러 개의 변수로 정렬할 때에도 유용하게 사용할 수 있음
ord <- order(iris$Petal.Length, iris$Sepal.Length)
head(iris[ord,c(3,1)])
ord <- order(iris$Petal.Length, -iris$Sepal.Length)
head(iris[ord, c(3,1)])




# 9 탐색적 데이터 분석
# 데이터에 대한 두 가지 접근법: CDA vs EDA
# 확증적 데이터 분석: CDA, confirmatory data analysis
# 가설을 수립하고 데이터를 통해 통계적 유의성을 검정하는 전통적 분석 기법
# Ronald Fisher: 가설검정, 신뢰구간, 유의확률(p-value) 유의수준
# 탐색적 데이터 분석: EDA, exploratory data analysis
# 정해진 가설과 모형없이 데이터의 구조와 특성을 통해 통찰을 얻는 분석 기법
# John Tukey: EDA는 우리가 존재한다고 믿는 것들은 물론이고, 존재하지 않는다고 믿는 것들을 발견하려는 태도, 유연성, 그리고 자발성이다.

# 팔머펭귄 데이터셋: palmerpenguins dataset
# 남극의 팔머 군도에 서식하는 3종의 펭귄에 대한 데이터셋
# 데이터 분석과 시각화 교육용으로 적절한 특성을 가지고 있음

# 팔머펭귄의 종류
# 턱끈: chinstrap
# 젠투: gentoo
# 아델리: adelie

# 데이터셋 정보
# 관측값 344개
# 특징변수 8개
# 수치형 변수 5개
# 범주형 변수 3개
# 종속변수 species
# 독립변수 7개

# 수치형 변수: numeric variables
# bill_length_mm : 부리의 길이
# bill_depth_mm: 부리의 깊이
# flipper_length_mm: 팔의 길이
# body_mass_g: 체중
# year:연구년도(2007,2008,2009)

# 범주형 변수: categorical variables
# species: 종
# Adelie, Chinstrap, Gentoo
# island: 섬(서식지)
# Biscoe, Dream, Torgersen
# sex: 성별
# female, male
library(palmerpenguins)

summary(penguins[,c(1,2,7)])

# 3가지 범주형 변수에 대한 막대그래프를 그려보자
# par() 함수로 3개의 파티션을 구분하여 하나의 플롯으로 그린다.
par(mfrow = c(1, 3))
barplot(table(penguins$species), col = 2:4, ylim=c(0,200))
barplot(table(penguins$island), col=5:7, ylim=c(0,200))
barplot(table(penguins$sex), col=c('orange','tomato'), ylim=c(0,200))
par(mfrow = c(1, 1))          

# 3가지 범주형 변수에 대해서 각 범주의 비율을 표로 만들어보자.
table(penguins$species) / sum(!is.na(penguins$species))
table(penguins$island) / sum(!is.na(penguins$island))
table(penguins$sex) / sum(!is.na(penguins$sex))

# 각 종별로 어떤 섬에 서식하고 있는지 교차표를 만들어보자.
# gmodels 패키지의 CroosTable() 함수를 이용하여 교차표를 만들어보자.
library(gmodels)
CrossTable(penguins$species,penguins$island)

# 4가지 수치형 변수에 대한 히스토그램을 그려보자.
# par() 함수로 2*2개의 파티션을 나누어 그려본다.
par(mfrow= c(2,2))
hist(penguins$bill_length_mm, col='skyblue')
hist(penguins$bill_depth_mm, col='steelblue')
hist(penguins$flipper_length_mm, col='orange')
hist(penguins$body_mass_g, col='tomato')

# psych 패키지의 describe() 함수를 통해서 기술통계량을 산출해보자.
library(psych)
describe(penguins)

# aggregate() 함수를 이용하여 범주별 기술통계량을 산출할 수 있다.
# 펭귄의 종별로 부리의 길이와 깊이, 날개의 길이, 체질량의 평균을 확인해보자.
bill_length_mm <- subset(penguins, select = bill_length_mm)
aggregate(bill_length_mm,
          by=list(species=penguins$species),
          FUN = mean, na.rm=T)

bill_depth_mm <- subset(penguins, select = bill_depth_mm)
aggregate(bill_depth_mm,
          by=list(species=penguins$species),
          FUN = mean,
          na.rm=T)

# penguins 데이터셋에는 결측치(NA)가 포함되어 있다.
# is.na() 함수를 이용하여 각 변수별로 결측치가 몇 개인지 확인해보자.
# for (name in names(penguins)) sum(is.na(penguins$name))
sapply(names(penguins),FUN = is.na)
library(VIM)
names(penguins)[1]
names(penguins)[1], sum(is.na(penguins$names(penguins)[1]))
# VIM 패키지의 aggr() 함수를 이용하여 결측값의 패턴을 확인해보자.
# aggr() 함수는 변수별로 결측치의 분포와 변수별 조합에 따른 결측치의 패턴을 그림으로 보여준다.
aggr(penguins,prop=F, numbers=T)

# complete.cases() 함수를 이용하여 결측치가 포함된 행을 확인할 수 있다.
# 결측치를 포함한 데이터를 삭제하여 pg 라는 이름의 데이터프레임으로 저장하자.
sum(!complete.cases(penguins))
penguins[!complete.cases(penguins),]
pg <- penguins[complete.cases(penguins), ]
dim(pg)

# 결측치를 제거한 penguins 데이터셋에서 4가지 수치형 변수에 대해 박스플롯을 그려보자.
par(mfrow = c(1, 4))
boxplot(pg$bill_length_mm, col='orange',border='brown')
boxplot(pg$bill_depth_mm, col='orange', border='brown')
boxplot(pg$flipper_length_mm, col='orange', border='brown')
boxplot(pg$body_mass_g, col='orange',border='brown')

# 펭귄의 종류별로 박스플롯을 그려보자.
par(mfrow=c(2,2))
boxplot(bill_length_mm ~ species, data=pg,
        pch=19,col=c(2,4,5))
boxplot(bill_depth_mm ~ species, data=pg,
        pch=19, col=c(2,4,5))
boxplot(flipper_length_mm ~ species, data=pg,
        pch=19, col=c(2,4,5))
boxplot(body_mass_g ~ species, data=pg,
        pch=19, col=c(2,4,5))

# boxplot.stats() 함수를 이용하여 Adelie 펭귄의 날개 길이에서 나타난 이상치의 값과 Chinstrap 펭귄의 체질량에서 나타난 이상치의 값을 확인해보자.
boxplot.stats(pg[pg$species=='Adelie', ]$flipper_length_mm)
boxplot.stats(pg[pg$species=='Chinstrap',]$body_mass_g)

# order() 함수를 이용하여 penguins 데이터셋을 날개의 길이를 기준으로 오름차순으로 정렬해보자.
penguins[order(penguins$flipper_length_mm),]

# penguins 데이터셋을 날개의 기준으로 오름차순으로 정렬하되,
# 날개의 길이가 같으면 체질량을 기준으로 내림차순으로 정렬해보자.
penguins[order(penguins$flipper_length_mm, -penguins$body_mass_g), ]

# penguins 데이터셋에서 부리의 길이가 가장 긴 10개의 데이터를 출력해보자.
head(penguins[order(penguins$bill_length_mm), ], n=10)

# split() 함수를 이용하여 penguins 데이터셋을 종류별로 구분해보자.
sp <- split(penguins, penguins$species)
class(sp)
summary(sp)

# rbind() 함수를 이용하여 앞에서 분리한 sp리스트에서 Adelie와 Gentoo를 합쳐보자.
# split()으로 분리할 때 species의 범주 정보가 남아 있으므로, rbind()를 한 이후에 factor()생성자로 형 변환을 하면 범주가 두개만 남게 된다.
AG <- rbind(sp$Adelie, sp$Gentoo)
levels(AG$species)
AG$species <- factor(AG$species)
levels(AG$species)


# penguins 데이터셋에서 sample() 함수를 이용하여 20개의 데이터를 임의로 추출해 보자.
# 단, 추출 후에도 원래데이터를 구분할 수 있또록 먼저 id 변수를 추가하다록 한다.
set.seed(2022)
df.origin <- data.frame(id=1:nrow(pg), species = pg$species,
                        bill_length_mm=pg$bill_length_mm,
                        bill_depth_mm=pg$bill_depth_mm)
idx <- sample(1:nrow(df.origin), size=20)
df.sample <- df.origin[idx,]
df.sample

# df.sample 데이터프레임을 부리의 길이와 깊이를 따로 분리한 후에, 두개의 데이터프레임에서 각각 10개의 데이터를 샘플링한다.
# 각각 10개의 데이터를 가진 두 개의 데이터프레임을 merge() 함수를 이용하여 다시 합쳐보자.
# 기준 변수는 원래 데이터셋의 id 변수를 사용한다.
set.seed(2022)
pg.x <- df.sample[sample(1:nrow(df.sample), size=10), c(1,2,3)]
pg.x[order(pg.x$id), ]
pg.y <- df.sample[sample(1:nrow(df.sample), size=10), c(1,2,4)]
pg.y[order(pg.y$id), ]
merge(x=pg.x, y=pg.y, by=c('id', 'species'), all=T)
