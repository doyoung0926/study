# R과 RStudio
# R 언어
# 데이터의 통계 분석과 시각화를 위해 탄생한 프로그래밍 언어
# 뉴질랜드 오클랜드 대학의 통계학자의 로스 이하카와 로버트 젠틀맨이 개발
# 1993년에 처음 공개된 이후로 오픈소스 소프트웨어로 관리되고 있음
# 누구나 무료로 사용 가능함
# 활발한 사용자 커뮤니티가 최신 분석 기능을 신속하게 제공함
# 데이터 분석과 시각화에 최적화된 매우 강력한 특징들을 가지고 있음

# RStudio
# R 언어를 사용하여 데이터 분석과 시각화를 할 수 있는 통합개발환경
# R과 마찬가지로 오픈소스 소프트웨어로 관리되어 있음
# 데이터 분석과 시각화를 편리하게 할 수 있는 강력한 기능을 탑재하고 있음

# RStudio는 4개의 창(Pane)으로 구분되어 있음

# RStudio에서 소스 코드의 작성과 실행
# alt + enter: 커서가 위치한 곳에 있는 한 문장을 실행
# ctrl + enter: 한 문장 실행 후 커서를 다음 문장으로 이동
# 블록 지정 후 ctrl + enter: 선택된 블록을 한꺼번에 실행
# alt + - : <- 입력
print('Hello, R!')
x <- 10
x
y <- 20
y
z <- x + y
z

getwd()

# RStudio의 여러 가지 화면 구성
# Source Pane: 편집 창
# Console Pane: 콘솔 창
# Plot Pane: 플롯 창
# Help Pane: 도움말 창
# Files Pane: 파일(폴더) 창
# Environment Pane: 환경 창
# Viewer Pane: 뷰어 창
# History Pane: 히스토리 창

data()

View(iris)

plot(iris)

?plot

install.packages('cowsay')
library(cowsay)
say('hello, world!')
say('hello, chicken', by='chicken')

# RStudio의 환경 설정
# 테마 적용하기: Tools > Global Options > Appearance > RStudio theme
# Modern + Consolas + Conbalt
# 폰트 기본 크기 조정: 16 or 18
# 편집 모드에서 ctrl++, ctrl+-키로 임의 확대/축소 가능
# Console on Left (or Right)
# 편집/콘솔 창을 상하 또는 좌우로 변경하기:
# Pane Layout:
# 플롯 창, 도움말 창, 파일 창을 상하 또는 좌우로 변경하기



# 내장 데이터 셋
# 데이터셋: dataset
# 통계분석에 필요한 데이터를 2차원 형태(dataframe)로 만들어 놓은 데이터
# R의 내장 데이터셋:
# R에서 별도로 불러오지 않아도 기본적으로 사용할 수 있는 데이터셋
# 외부 데이터 셋: 데이터셋을 사용하기 위해 외부 패키지에서 불러와야 함
# 두 개의 내장 데이터셋:
# iris: 붓꽃의 품종에 관한 데이터셋
# mtcars: 자동차 로드 테스트에 관한 데이터셋

# iris: Edgar Anderson's Iris Data
# 1935년, 붓꽃의 품종 연구를 위해 수집한 꽃잎과 꽃받침의 길이와 너비 정보
# 5개의 변수에 대한 150개의 관측값을 포함하고 있음
# 변수 or 변량 : variable or variate
# 관찰, 조사, 분석, 연구의 대상이 가지는 특성
# 관측값: observation
# 분석 대상의 특성을 관찰하여 측정한 값

?iris

str(iris)

# Sepal.Length: 꽃받침의 길이
# Sepal.Width: 꽃받침의 너비
# Petal.Length: 꽃잎의 길이
# Petal.Width: 꽃잎의 너비
# Species: 붓꽃의 품종 (setosa, versicolor, virginica)

head(iris)  # 6개

tail(iris)


# 변수의 특성에 따라 분류
# 수치형 자료: numerical data
# 관측값이 크기를 나타내는 수치형으로 나타남
# 예) 키, 몸무게
# 대소비교와 산술연산이 가능하고, 평균, 표준편차 등의 특성을 가짐
# 양적(quantitative)자료, 연속형(continuous) 자료라고도 함
# 범주형 자료: categorical data
# 관측값이 그룹으로 구분할 수 있는 범주형으로 나타남
# 예) 성별, 혈액형
# 대소비교와 산술연산이 불가능하고, 빈도가 중요함
# 질적(qualitative)자료, 명목형(nominal) 자료라고도 함

iris$Species
class(iris$Species)
levels(iris$Species)
table(iris$Species)
barplot(table(iris$Species))

iris$Petal.Length
class(iris$Petal.Length)
mean(iris$Petal.Length)
var(iris$Petal.Length)
sd(iris$Petal.Length)
hist(iris$Petal.Length)

hist(iris$Petal.Length, col = 'steelblue')

hist(iris$Petal.Length, col = 'steelblue',
     main = '꽃잎의 길이에 대한 히스토그램',
     xlab = '꽃잎으 길이',
     ylab = '빈도수수')

# mtcars: Motor Trend Car Road Tests
# 1974년에 실시한 32개 자동차 모델의 연비에 대한 조사 결과
# 11개의 변수에 대한 32개의 관측값을 포함하고 있음

?mtcars

str(mtcars)

# mpg 연비, cyl 실린더 개수, disp 배기량, hp 마력, drat 후방 차축 비율, wt 중량, qsec 1/4마일 가는데 걸리는 시간,
# vs 엔진 모양, am 변속기, gear 전진기어 개수, carb 기화기 개수

mtcars$mpg

mtcars$wt

summary(mtcars)

hist(mtcars$mpg, col = 'steelblue')

hist(mtcars$wt, col = 'orange')

hist(mtcars$wt, col = 'orange',
     xlim = c(1, 6),
     ylim = c(0, 10))

plot(mtcars$mpg, mtcars$wt)

plot(mtcars$mpg, mtcars$wt, col = 'tomato', pch = 19)



# R의 기본문법

# R 언어의 기본문법
# 변수: variables
# 할당문: assignment
# 연산자: operators
# 조건문: conditionals
# 반복문: iterations
# 함수: functions

# 변수: variable
# 프로그래밍에서 변수는 어떤 데이터를 저장하는 저장소
# <- : 할당 연산자(assignment operator)
# R에서는 <- 외에도 -> 와 =를 할당 연산자로 사용할 수 있음

x <- 10
x

20 -> y
y

z = x + y
z
# R에서는 할당문에 <- 를 사용할 것을 권장함

# 변수 이름의 규칙
# 첫 글자는 반드시 문자나 마침표로 시작해야 함
# 첫 글자 이후에는 문자, 마침표, 숫자, 밑줄을 사용할 수 있음
# 주의: 알파벳 대문자와 소문자를 구분함

val <-  200

var.1 <- 100
Var.1

# 원시 자료형: primitive data types
# 구분   / 자료형     /   리터럴
# 논리형 / logical / TRUE FALSE T F
# 숫자형 / numeric / 1 2 3 4 5 ...  3.14  1.414 ...
# 문자형 / character / "A" , "B" , "C" ... "Hello"   'A' 'B' 'C'  ... 'Hello'
# 특수형 /        / NA  NULL  NaN  Inf - Inf

class(TRUE)
class(3)
class('Hello')
var <- TRUE
class(var)
var <- 3
class(var)
var <- 'hello'
class(var)

# 연산자: operators
# 구분   /    연산자      /   구분
# 산술 연산자 / + - * /   / 덧셈 뺄셈 곱셈 나눗셈 연산
# 산술 연산자 / %% %/%    / 나머지 , 몫 연산
# 산술 연산자 /  ^ 또는 **   / 거듭제곱 연산
# 논리 연산자   /  < >  <=  >=  /  대소 비교 연산
# 논리 연산자  / ==    !=    / 같은가, 다른가
# 논리 연산자  /   !     &     |   / NOT AND OR (벡터를 리턴)
# 논리 연산자   / &&   ||       /  AND OR (단일값을 리턴)

x <- 2
y <- 2 * ((x+2)-(x+4))/2 +3
y

7 %/% 3
7%%3

10 ^ 2
2 ** 10

3 < 4
5 > 7

x <- 5
y <- x
x ==y
x != y

!TRUE & TRUE | FALSE

x <- 3
(x > 3) && (x < 4)


# 조건문: conditional statement
# 어떤 조건에 따라 코드 블록의 실행여부를 결정하는 구문
if (conditon) {
  condition.true.statements
}

if (condition){
  condition.true.statements
} else {
  condition.false.statements
}

if (condition1) {
  condition1.true.statements
} else if (condition2) {
  condition2.false.statements
} else {
  other.statements
}

# 학생의 점수 score 에 따라 학점 grade 부여하기
score <- 91

if (score >= 90) {
  grade <- 'A'
} else if (score >= 80) {
  grade <- 'B'
} else{
  grade <- 'F'
}

grade

# 주의: else는 반드시 } 가 있는 줄에 함께 있어야 함

# 반복문: loop stataement (iteration)
# 특정한 코드 블록이 여러 번 반복적으로 수행하도록 하는 구문
while (condition) {
  condition.true.statement
}


for (variable in start:end) {
  loop.statements
}


# 반복문을 이용하여 1에서 10까지 자연수의 합 구하기
s <- 0
i <- 1
while (i <= 10) {
  s <- s + i
  i <- i + 1
}
s

s <-0
for (i in 1:10) {
  s <- s + i
}
s

# 임의의 자연수 n에 대하여, n의 약수를 출력하고 약수의 개수 구하기
n <- 32
count <- 0
for (i in 1:n) {
  if (n%%i==0) {
    cat(i, ' ')
    count <- count + 1
  }
}

count

# break와 next: 반복문의 중단과 계속
# break: 현재 수행 중인 반복문을 중단하고 코드 블록으로 빠져나감
# next: 현재 수행 중인 반복문의 코드 블록에서 다음 반복으로 되돌아감
for (i in 1:10) {
  cat(i)
  if (i < 5) {
    next
  } else {
    break
  }
}

# 소수(prime): 1과 자기 자신(n)으로만 나누어 떨어지는 1이 아닌 자연수
# 임의의 자연수n이 소수인지 아닌지 판단하기
n <- 16
is.prime = TRUE
for (i in 2:(n-1)) {
  if (n%%i==0) {
    is.prime <- FALSE
    break
  }
}
is.prime

# 중첩 반복문: nested for-loop
# 조건문이나 반복문은 여러 단계로 중첩될 수 있음
for (i in 1:3) {
  cat(i, ':')
  for (j in 1:5) {
    cat(j, " ")
  }
  cat('\n')
}



# 벡터의 이해

# R의 데이터 오브젝트:
# 벡터: vector()
# 팩터: factor()
# 리스트: list()
# 행렬: matrix()
# 데이터 프레임: data.frame()

# 벡터: vector
# R에서 가장 기초적인 데이터 구조
# R에서 모든 데이터는 벡터로 구성되어 있다.
# 벡터의 생성 함수: vector(),:,c(),seq(),rep()

v1 <- vector(length=2)
v1

v2 <- 1:10
v2

v3 <- c(1, 2, 3, 5, 7)
v3

v4 <- seq(from=1, to=10, by=2)
v4

v5 <- rep(1:3, each=2, times=2)
v5

# c() 함수: combine 함수는 여러 개의 벡터를 결합하여 하나의 벡터를 생성
v1 <- c(1, 2, 3:5)
v1

v2 <- c(5:6, seq(7, 9, 2))
v2

v3 <- c(v1, v2)
v3

# 벡터 원소의 자료형: type of elements
# 벡터의 원소: 논리형, 숫자형, 문자형
# 벡터의 원소는 반드시 동일한 기본 자료형을 가진다.
# 데이터 유형이 다르면 자동 변환: 논리형 < 숫자형 < 문자형

v1 <- c(T, T, F, F, T)
v1

v2 <- c(T, F, 3, 3.14)
v2

v3 <- c(3, 3.14, 'pi=3.14')
v3

v4 <- c(T, F, 3, '3.14')
v4

# 벡터의 인덱싱: vector indexing
# 대괄호 [] 안에 원소 위치를 지정하여 원소를 선택
# 원소의 위치도 벡터로 지정할 수 있음
# 조건문으로 벡터를 필터링할 수 있음

v <- c(10,20,30,40,50,60,70)
v[1]
v[7]

v[1:3]
v[c(1,3,5,7)]
v[c(T,T,F,F,F,F,T)]

v < 30
v[v<30]
v<30|v>50
v[v<30|v>50]

v%%3==0 & v%%4==0
v[v%%3==0 & v%%4==0]

# 인덱스에 음수 벡터를 지정하여 제외(filtering)할 수도 있음
v
v[-1]
v[-(1:3)]
v[-c(1,3,5,7)]
v[!c(v%%20==0)]

# 인덱스로 추출한 벡터의 원소값에 다른 값을 할당할 수 있음
v
v[1] <- 11
v
v[2:3] <- c(22,33)
v
v[v>=50] <- v[v<30]
v
v[8] <- 80
v

# 피자나라치킨공주 벡터의 생성
v <- c()
for (i in 1:15) {
  if (i %%3 ==0 && i%%5==0) {
    v<-c(v,'PZ')
  } else if (i%%3==0) {
    v<-c(v,'P')
  } else if (i%%5==0) {
    v<-c(v,'C')
  } else {
    v<-c(v,'D')
  }
}
v
which(v=='P')
which(v=='C')
which(v=='PC')


# 벡터의 연산: vectorized arithmetic
# 벡터와 벡터간의 연산은 원소 단위로 처리
# 재사용 규칙: recycling rule
# 벡터의 길이가 다르면 짧은 벡터를 반복(rep())하여 길이를 맞춤

v1 <- c(1,2,3,4,5)
v2<- c(1,2)

v3 <-v1+v2
v3
v4<-2*v1
v4
v5<-v1*v2
v5

# 논리값은 숫자로 취급할 수 있음: TRUE는 1, FALSE는 0
v1 <- c(T,T,F,F,T)
sum(v1)
v2<-v1+2
v2
v3<-1:5+c(T,F)
v3
sum(1:5 > c(2,4))


# 팩터: factor
# R에서 범주형 데이터를 처리하기 위한 데이터 오브젝트
# 레벨(level): 범주형 변수가 가질 수 있는 범주값
# 팩터는 레벨로 지정된 범주값만 가질 수 있는 벡터

sex<-c('M','F','M','F','F')
sex

f.sex<-factor(sex)
f.sex
str(f.sex)
levels(f.sex)
table(f.sex)

blood<-c(1,2,3,1,4,3,2,4)
blood
f.blood<-factor(blood,
                levels=c(1,2,3,4),
                labels=c('A','B','AB','O'))
f.blood
levels(f.blood)
table(f.blood)


# 리스트: list
# 벡터의 벡터: 서로 다른 유형의 원소를 가질 수 있는 벡터
# 리스트의 인덱싱:
# $기호를 이용해서 원소의 이름으로 인덱스 지정
# 또는, 두 개의 대괄호 [[]]내에 인덱스 지정

v1 <- 1:7
v2 <- c('홍길동','전우치','주니온','아사달','아사녀','연오랑','세오녀')
v3 <-factor(c('M','M','M','M','F','M','F'))
lst <- list(no=v1, name=v2, sex=v3)
str(lst)
lst

names(lst)
lst$no
sum(lst$no)

lst$name
lst$name[1:3]

lst$sex
table(lst$sex)


# 행렬: matrix
# 행(row)과 열(col)의 2차원을 가진 벡터
# 2차원 벡터이기 때문에 모든 원소는 동일한 원시 자료형을 가져야 함
# 행렬의 인덱싱:
# 대괄호 []안에 콤마로 구분하여 행과 열의 위치 지정: [row, col]

m <- matrix(1:12, nrow=3, ncol=4)
m
m <- t(m)
m

dim(m)
nrow(m)
ncol(m)

m[2,3]
m[3,2]
m[2:3, 1:2]
m[1:2, ]
m[,1:2]

# rbind(), cbind() 함수로 행렬을 합칠 수 있음
rbind(m[1,], m[4,])

cbind(m[,1], m[,3])




# 함수의 이해

# 수학에서의 함수: function in mathematics
# 두 집합 X, Y에 대해서 X의 각 원소에 Y의 원소가 일대일 대응 관계일 때
# 함수 f:X -> Y
# y=f(x): X의 원소 x와 Y의 원소 y의 대응 관계
# x는 함수의 입력값(input), y는 함수의 출력값(output)

# 프로그래임 언어에서의 함수: function in programming language
# 어떤 입력값에 대해서 계산된 출력값을 되돌려 주는 일련의 실행 절차
# 다른 용어: procedure, subroutine
# sum input
# output

# 내장 함수: built-in functions
# 외부 패키지를 불러오지 않고도 쓸 수 있도록 기본적으로 제공되는 함수들
# 구분       /     함수 정의         /  출력값
# 수학 관련 / abs(x) / 절대값
# sqrt(x) / 제곱근
# log(x), log10(x) / 자연로그, 밑이 10인 로그
# exp(x) / 자연 상수 e의 거듭제곱
# sin(x), cos(x), tan(x) / 삼각 함수
# ceiling(x), floor(x) / 천장값, 바닥값
# round(x, digits = n)  / 반올림 수
# 통계 관련 / sum(x) / 합계
# mean(x) / 평균
# var(x) / 분산
# sd(x) / 표준편차
# median(x) / 중앙값
# quantile(x, probs) / 분위값
# min(x), max(x) / 최솟값, 최댓값
# range(x) / 범위값

# 사용자가 정의 함수: user-defined functions
# 사용자가 직접 함수를 정의하여 사용할 수 있음
# function.name <- function (parameters) {
# function.bodies
# return (return_value)
# }

add <- function (x, y) {
  z <- x + y
  return (z)
}

add
add(3,4)

# 매개변수: parameters, arguments
# 함수의 입력값을 전달받는 변수
# 다른 용어: 형식인자, 인자, 인수
# 매개변수를 전달할 때 매개변수명과 매개변수값을 지정할 수 있음
# 매개변수명을 전달하지 않으면 매개변수 순서에 따라 전달됨

func1 <- function (x, y, z) {
  return (x + 2 * y + 3 * z)
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

func2 <- function (x, y=1, z=0) {
  return (x+2*y+3*z)
}
func2(1,2,3)
func2(1)
func2(1,2)
func2(y=2,z=3)
func2(2,3,x=1)
func2(z=1,x=2)

# 여러 매개변수가 있는 내장 함수를 호출할 때 기본값이 있으면 생략 가능
pi <- 3.141592
round(x=pi, digits=4)
round(pi,2)
round(digits=4,x=pi)
round(digits=3)

head(iris)
head(x=iris, n=3)
head(n=3,iris)
head(3,iris)

# return 문장을 생략하면 마지막 계산값이 리턴됨
# 블록에 들어갈 문장이 하나뿐이라면 {}는 생략 가능
sadd1 <- function(x,y) {
  return (x+y)
}
sadd1(3,4)

sadd2 <- function(x,y) {
  x+y
}
sadd2(3,4)

sadd3 <- function(x,y) x+y
sadd3(3,4)

# 매개변수는 벡터 등의 다른 R 데이터 오브젝트로 지정 가능
square <- function(x) x ^ 2
square(1:10)

vadd <- function(x,y) x+y
vadd(1:3, 3:1)

vmult <- function(x,y=0) x*y
vmult(1:3)

vmult(1:3,3:1)

# 함수형 프로그래밍: functional programming
# 모든 코드를 함수를 위주로 구현하고자 하는 프로그래밍 패러다임
# 조건문과 반복문을 매우 싫어함
# R 코드는 함수형 프로그래밍으로 많이 작성함
# 조건문을 대체할 함수: ifelse()
# 반복문을 대체할 함수: apply() 계열 함수 등

# ifelse() 함수
# R에서 대부분의 조건문은 ifelse() 함수로 대체 가능
# ifelse(condition, true.value, false.value)

x <- 10
y <- 20
ifelse(x<y,x,y)
ifelse(x>y,x,y)

score <- 88
grade <- ifelse(score >= 90,
                'A',
                ifelse(score>=80,
                       'B',
                       'C'))
grade

# sapply() 함수
# 벡터의 각 원소에 어떤 함수를 적용한 결과를 벡터로 리턴
# sapply(x, FUN, ...)

is.odd <- function(n) n%%2==1
is.odd(7)

odd.cnt.1 <- function(n,m) {
  count<-0
  for (i in n:m) {
    if (is.odd(i)) 
      count <- count+1
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


# 데이터 프레임
# 데이터 프레임: data.frame
# R에서 2차원 테이블 형태로 데이터셋을 저장하는 가장 기본적인 자료구조
# 변수는 열(column)로, 관측값은 행(row)으로 저장

# 데이터 프레임은 벡터의 리스트처럼 생각할 수 있음
v1 <- 1:7
v2 <- c('홍길동','전우치','주니온','아사달','아사녀','연오랑','세오녀')
v3 <- factor(c('M','M','M','M','F','M','F'))
df <- data.frame(no = v1, name = v2, sex = v3)
str(df)
head(df)

# 데이터 프레임은 행렬처럼 2차원으로 인덱싱을 할 수 있음
iris[1:5,]
iris[1:5, 1:4]
iris[1:5, -5] # 위와 동일

# 데이터 프레임은 리스트처럼 $ 기호로 열 벡터를 가져올 수 있음
iris$Sepal.Length
iris[,1] # 위와 동일
iris[,'Sepal.Length'] # 위와 동일
iris$Species
iris[,5] # 위와 동일
iris[,'Species'] # 위와 동일일

# 하나의 열은 벡터로 다루지만, 하나의 행은 데이터 프레임(인덱싱의 경우에도 마찬가지)
iris[1,]
class(iris[1,])
class(iris[,1])
class(iris[,5])

# 데이터 프레임에서도 조건식을 이용하여 필터링할 수 있음
summary(iris$Sepal.Length)
iris[iris$Sepal.Length < 5.1,]
iris[iris$Sepal.Length < 5.1 & iris$Species == 'versicolor',]
with(iris, iris[Sepal.Length < 5.1 & Species == 'versicolor',]) # 위와 동일

# 데이터 프레임에 새로운 변수(열 벡터)를 추가할 수도 있음
df <- iris
head(df, n=3)
df$Sepal.Sum <- df$Sepal.Length + df$Sepal.Width
head(df, n=3)

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
# CSV파일: Comma Separated Value
# R에서는 CSV 파일을 읽고 쓰는 함수가 기본적으로 제공됨
# write.csv(), read.csv()
# 엑셀 파일 직접 읽어오기: readxl 패키지 활용

# iris 데이터셋을 csv 파일로 저장하고 다시 불러오기
getwd()
write.csv(iris, file = 'iris.csv')
write.csv(iris, file = 'iris2.csv', row.names = F)

df1 <- read.csv(file = 'iris.csv')
str(df1)

df2 <- read.csv(file = 'iris2.csv', stringsAsFactors = T)
str(df2)

# 엑셀 파일로 저장한 데이터를 엑셀에서 직접 읽어오기
# install.packages('readxl')
library(readxl)
df <- read_excel(path = '성적표.xlsx', sheet = 1)
str(df)
head(df)

# 데이터 전처리 (1)
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
x <- c