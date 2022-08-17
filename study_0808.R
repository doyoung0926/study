# 내장 데이터셋

# 데이터셋: dataset
# 통계분석에 필요한 데이터를 2차원 형태(data frame)로 만들어 놓은 데이터
# R의 내장 데이터셋
# R에서 별도로 불러오지 않아도 기본적으로 사용할 수 있는 데이터셋
# 외부 데이터셋: 데이터셋을 사용하기 위해 외부 패키지에서 불러와야함
# 두 개의 내장 데이터셋
# iris: 붓꽃의 품종에 관한 데이터 셋
# mtcars: 자동차 로드 테스트에 관한 데이터 셋

# 변수 or 변량: variable or variate
# 관찰, 조사, 분석, 연구의 대상이 가지는 특성
# 관측값: observation
# 분석 대상의 특성을 관찰하여 측정한 값
?iris
str(iris)
head(iris)
tail(iris)

# 변수의 특성에 따른 분류
# 수치형 자료: numerical data
# 관측값이 크기를 나타내는 수치형으로 나타남
# 예) 키, 몸무게
# 대소비교와 산술연산이 가능하고, 평균, 펴ㅛ준편차 등의 특성을 가짐
# 양적 자료, 연속형 자료라고도 함
# 범부형 자료: categorical data
# 관측값이 그룹으로 구분할 수 있는 범주형으로 나타남
# 예) 성별, 혈액형
# 대소비교와 산술연산이 불가능하고, 빈도가 중요함
# 질적 자료, 명목형 자료라고도 함
 
class(iris$Species)
levels(iris$Species)
table(iris$Species)
barplot(table(iris$Species))

class(iris$Petal.Length)
mean(iris$Petal.Length)
var(iris$Petal.Length)
sd(iris$Petal.Length)
hist(iris$Petal.Length)

hist(iris$Petal.Length, col = 'steelblue')
hist(iris$Petal.Length, col =' steelblue',
     main='히스토그램',
     xlab='꽃잎의 길이',
     ylab='빈도수')

?mtcars
str(mtcars)
mtcars$mpg
mtcars$wt
summary(mtcars)
hist(mtcars$mpg, col ='steelblue')
hist(mtcars$wt, col='orange')
hist(mtcars$wt, col='orange',
     xlim=c(1,6),
     ylim=c(0,10))
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
# <-: 할당 연산자(assignment operator)
# R에서는 <- 외에도 -> 와 = 를 할당연산자로 사용할 수 있음
# R에서는 할당문에 <- 를 사용할 것을 권장함
# 변수 이름의 규칙
# 첫 글자는 반드시 문자나 마침표로 시작해야 함
# 첫 글자 이후에는 문자, 마침표, 숫자, 밑줄을 사용할 수 있음
# 주의: 알파벳 대문자와 소문자를 구분함
1.val <- 200
var.1 <- 100
Var.1

# 원시 자료형: primitive data types
# 구분    / 자료형      /리터럴
# 논리형 / logical /  TRUE FALSE  T F
# 숫자형 / numeric /  1 2 3 4 5 ...  3.14  1.14 ...
# 문자형 / character / 'A' "A"
# 특수형 /   / NA NULL NaN Inf -Inf

class(TRUE)
class(3)
class('Hello')

# 연산자: operators
# 구분     /   연산자      / 구분
# 산술 연산자   / + - * /     /  덧셈 뺄셈 곱셈 나눗셈 연산
# %%   %/%    / 나머지, 몫 연산
# ^ 또는 **   /  거듭제곱 연산
# 논리연산자 / < > <= >=     /  대소 비교 연산자
# ==   !=    / 같은가, 다른가
# ! & |   / not and or (벡터를 리턴)
# && ||   / and or (단일값을 리턴)


x <-2
y<- 2 *((x+2)-(x+4)) / 2+3
y
7%/%3
7%%3
10^2
2 **10

3<4
5>7
x<-5
y<-x
x==y
x!=y
!TRUE & TRUE | FALSE
x<-3
(x>3) && (x<4)

# 조건문: conditional statement
# 어떤 조건에 따라 코드 블록의 실행 여부를 결정하는 구문
# 주의: else는 반드시 }가 있는 줄에 함께 있어야 함

# 반복문: loop statement(iteration)
# 특정한 코드 블록이 여러 번 반복적으로 수행하도록 하는 구문

# 반복문을 이용하여 1에서 10까지 자연수의 합 구하기
s<-0
i<-1
while (i<=10){
  s<-s+i
  i<-i+1
}
s

s<-0
for (i in 1:10) {
  s <- s+i
}
s

# 임의의 자연수 n에 대하여, n의 약수를 출력하고 약숭의 개수 구하기
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
# break: 현재 수행 중인 반복문을 중단하고 코드 블록을 빠져나감
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
# 임의의 자연수 n이 소수인지 아닌지 판단하기
n <- 17
is.prime = TRUE
for (i in 2:(n-1)) {
  if (n %% i == 0) {
    is.prime <- FALSE
    break
  }
}
is.prime

# 중첩 반복문: nested for-loop
# 조건문이나 반복문은 여러 단계로 중첩될 수 있음
for (i in 1:3) {
  cat(i, ': ')
  for (j in 1:5) {
    cat(j, ' ')
  }
  cat('\n')
}


# 벡터의 이해
# R의 데이터 오브젝트
# 벡터: vector()
# 팩터: factor()
# 리스트: list()
# 행렬: matrix()
# 데이터 프레임: data.frame()

# 벡터: vector
# R에서 가장 기초적인 데이터 구조
# R에서 모든 데이터는 벡터로 구성되어 있다.
# 벡터의 생성 함수: vector(), :, c(), seq(), rep()

v1 <- vector(length=2)
v1

v2<-1:10
v2

v3 <- c(1,2,3,5,7)
v3
v4<-seq(from=1, to=10, by=2)
v4

v5 <- rep(1:3, each=2, times=2)
v5

# c() 함수: combine 함수는 여러 개의 벡터를 결합하여 하나의 벡터를 생성
v1<-c(1,2,3:5)
v1
v2<-c(5:6,seq(7,9,2))
v2
v3 <- c(v1,v2)
v3

# 벡터 원소의 자료형: type of elements
# 벡터의 원소: 논리형, 숫자형, 문자형
# 벡터의 원소는 반드시 동일한 기본 자료형을 가진다.
# 데이터 유형이 다르면 자동 변환: 논리형<숫자형<문자형

v1<-c(T,T,F,F,T)
v1
v2<-c(T,F,3,3.14)
v2
v3<-c(3,3.14,'PI=3.14')
v3
v4<-c(T,F,3,'3.14')
v4

# 벡터의 인덱싱: vector indexing
# 대괄호 []안에 원소 위치를 지정하여 원소를 선택
# 원소의 위치도 벡터로 지정할 수 있음
# 조건문으로 벡터를 필터링할 수 있음