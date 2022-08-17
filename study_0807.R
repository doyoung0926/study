# 데이터 프레임
# 데이터 프레임: data.frame
# R에서 2차원 테이블 형태로 데이터셋을 저장하는 가장 기본적신 자료 구조
# 변수는 열(column)로, 관측값은 행(row)으로 저장

# 데이터 프레임은 벡터의 리스트처럼 생각할 수 있음
v1 <- 1:7
v2 <- c('홍길동', '전우치', '주니온', '아사달', '아사녀', '연오랑', '세오녀')
v3 <- factor(c('M', 'M', 'M', 'M', 'F', 'M', 'F'))
df <- data.frame(no=v1, name=v2,sex=v3)
str(df)
head(df)

# 데이터 프레임은 행렬처럼 2차원으로 인덱싱을 할 수 있음
iris[1:5,]
iris[1:5,1:4]
iris[1:5,-5]  

# 데이터 프레임은 리스트처럼 $ 기호로 열 벡터를 가져올 수 있음
iris$Sepal.Length
iris[,1]
iris[,'Sepal.Length']
iris$Species
iris[,5]
iris[,'Species']

# 하나의 열은 벡터로 다루지만, 하나의 행은 데이터 프레임(인덱싱의 경우에도 마찬가지)
iris[1,]
class(iris[1,])
class(iris[,1])
class(iris[,5])

# 데이터 프레임에서도 조건식을 이용하여 필터링할 수 있음
summary(iris$Sepal.Length)
iris[iris$Sepal.Length < 5.1,]
iris[iris$Sepal.Length < 5.1 & iris$Species == 'versicolor', ]
with(iris,iris[Sepal.Length < 5.1 & Species == 'versicolor', ])

# 데이터 프레임에 새로운 변수(열 벡터)를 추가할 수도 있음
df <- iris
head(df, n=3)
df$Sepal.Sum <- df$Sepal.Length + df$Sepal.Width
head(df, n=3)

# 데이터 객체의 자료형 확인과 변환
# is.xxx()함수: 데이터 구조의 자료형 확인
# as.xxx()함수: 데이터 구조의 자료형 변환
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
# 데이터 처리를완료한 연구 데이터를 엑셀 파일로 저장하기
# csv파일: comma separated Value
# R에서 csv파일을 읽고 쓰는 함수가 기본적으로 제공됨
# write.csv(), read.csv()
# 엑셀 파일 직접 읽어오기: readxl 패키지 활용

# iris 데이터셋을 csv 파일로 저장하고 다시 불러오기
getwd()
write.csv(iris, file='iris.csv')
write.csv(iris, file='iris2.csv', row.names=F)
iris
df1 <- read.csv(file='iris.csv')
str(df1)
df2 <- read.csv(file='iris2.csv', stringsAsFactors =T)
str(df2)

# 엑셀 파일로 저장한 데이터를 엑셀에서 직접 읽어오기
# install.packages('readxl')
library(readxl)
df <- read_excel(path ='성적표.xlsx', sheet=1)
str(df)
head(df)



# 데이터 전처리: 결측치와 이상치
# 데이터 전처리: Data Preprocessing
# 본격적인 통계분석을 시작힉 전에 필요한 데이터 정제 작업
# 결측치와 이상치: missing values and outliers
# 데이터의 변환: integration, filtering, sampling, and so on.
# 데이터의 표준화: standardization

# 결측치: missing values
# 설문 결과, 실험 결과 등의 연구 데이터에서 누락된 관측값이 존재할 경우
# 결측치가 포함된 관측값을 연구 데이터에서 제거하거나
# 결측치를 적절한 다른 값으로 대체해야 함
# NA: R에서 결측치를 나타내는 값

# 결측치가 포함된 벡터의 통계값 구하기
x <- c(45,NA,87,63,55,NA,72,61,59,68)
mean(x)
mean(x,na.rm=T)
var(x, na.rm=T)
sd(x,na.rm=T)

# 벡터에 포함된 결측치를 다른 값으로 대체하기
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
df[complete.cases(df),]
df[!complete.cases(df),]

# 결측치에 관련된 정보 확인: 결측치의 개수와 비율
sum(is.na(df$Ozone))
sum(is.na(df$Solar.R))
sum(is.na(df$Solar.R) & is.na(df$Ozone))
sum(!complete.cases(df))
mean(!complete.cases(df))

# VIM 패키지의 aggr() 함수: 변수별로 결측치의 분포와 발생 패턴을 시각화
library(VIM)
?aggr
aggr(airquality, prop=F, numbers=T, sortVar=T)

# na.omit() 함수: 데이터 프레임에서 결측치를 제거
airquality[complete.cases(airquality),]
nrow(airquality[complete.cases(airquality),])
df <- na.omit(airquality)
str(df)

# mice 패키지의 mice()함수: 결측치를 여러 가지 통계적 방법으로 대체(imputation)
library(mice)
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
boxplot(df$Income, pch=19, col='orange', border='brown')

# boxplot.stats() 함수를 이용한 이상치에 대한 상세 확인
boxplot.stats(df$Income)
outlier <- boxplot.stats(df$Income)
df[df$Income==outlier$out,]

# 이상치가 통계량을 왜곡할 때는 결측치로 변환하여 통계분석 대상에서 제외
df <- data.frame(state.x77)
nrow(df)
df[df$Income==boxplot.stats(df$Income)$out,] <- NA
df[!complete.cases(df$Income),]
df.no.outlier <- na.omit(df)
nrow(df.no.outlier)

# 범주로 구분할 수 있는 데이터는 범주별로 이상치를 확인할 수 있음
boxplot(Petal.Width ~ Species, data=iris,
    pch=19, col='orange', border='brown')

# 이상치가 여러 개인 경우에는 %in% 연산자를 활용하여 결측치를 제거
df <- with(iris, iris[Species == 'setosa',])
boxplot.stats(df$Petal.Width)
outlier <- boxplot.stats(df$Petal.Width)$out
df[df$Petal.Width %in% outlier, ] <- NA
df.no.outlier <- na.omit(df)
nrow(df.no.outlier)


# 데이터 전처리: 선택, 집계, 분리, 결합, 정렬
# 데이터 다루기: Wrangling Data
# 데이터의 형태를 통계분석에 적합한 형태로 변환하기 위한 R 함수들
# 선택: subset()
# 집계: aggregate()
# 분리: split()
# 결합: rbind(), cbind(), merge()
# 정렬: sort(), order()

# subset() 함수: 인덱싱이나 필터링보다 간편하게 필요한 데이터를 추출
subset(iris, subset=Species == 'setosa')
subset(iris, select=c(1,2,5))
subset(iris,subset=Sepal.Length > 7.5)
subset(iris,subset=Sepal.Length > 7.5 & Sepal.Width > 3.0)
subset(iris,
       subset = Sepal.Length > 7.5 & Sepal.Width > 3.0,
       select = c(1,2,5))

# split() 함수: 데이터 프레임을 범주형 변수를 기준으로 여러개로 분할
split(iris, f=iris$Species)
df <- split(iris, f=iris$Species)
names(df)
summary(df)
df$setosa
df$versicolor

# aggregate() 함수: 범주별로 통계량을 확인하고 싶을 때 주로 활용
df <- subset(iris, select=c(1,2))
aggregate(df, by = list(Species=iris$Species), FUN=length)
aggregate(df, by=list(Species=iris$Species), FUN=mean)
aggregate(df, by=list(Species=iris$Species), FUN=sd)

# aggregate() 함수: 여러 개의 범주를 사용해서 분할할 수도 있음
str(mtcars)
df <- subset(mtcars, select=c('mpg','hp','wt'))
aggregate(df,
          by=list(cyl=mtcars$cyl, gear=mtcars$gear),
          FUN=mean)


# rbind() 함수: 행(row)을 기준으로 여러 개의 데이터 프레임을 결합
df.split <- split(iris, f=iris$Species)
df.rbind <- rbind(df.split$setosa, df.split$versicolor)
str(df.rbind)

# cbind() 함수: 열(column)을 기준으로 여러 개의 데이터 프레임을 결합
df.sepal <- subset(iris, select=c(1,2))
str(df.sepal)
df.petal <- subset(iris, select=c(3,4))
df.cbind <- cbind(df.sepal, df.petal)
str(df.cbind)

# merge() 함수: 특정 변수의 값이 같은 행을 기준으로 여러 개의 데이터 프레임을 병합
x <- data.frame(name = c('A', 'B', 'C'), kor = c(60, 70, 80))
y <- data.frame(name = c('A', 'B', 'D'), eng = c(65, 75, 85))
cbind(x,y)
merge(x,y)
merge(x,y,all=T)
merge(x,y,all.x=T)
merge(x,y,all.y=T)

# merge()함수: 해당 컬럼이 모두 존재하지 않는 경우에는 NA값으로 병합
x <- data.frame(name = c('A', 'B', 'C'), kor = c(60, 70, 80))
y <- data.frame(NAME = c('A', 'B', 'D'), eng = c(65, 75, 85))
merge(x,y)
merge(x,y,by.x='name',by.y='NAME')
merge(x,y,by.x='name',by.y='NAME', all=T)

# sort()와 order() 함수: 벡터의 값을 오름차순/내림차순으로 정렬하거나 정렬 위치를 반환
sort(mtcars$mpg)
sort(mtcars$mpg, decreasing = T)
order(mtcars$mpg)
order(mtcars$mpg, decreasing=T)

# order() 함수: 정렬 후의 위치를 알려주므로, 데이터 프레임을 변수의 순서대로 정렬할 때 유용
ord <- order(mtcars$mpg, decreasing=T)
mtcars[ord, 1:6]
mtcars[ord[1:10],1:6]
n <- length(ord)

mtcars[ord[(n-10):n], 1:6]

# order() 함수: 여러 개의 변수로 정렬할 때에도 유용하게 사용할 수 있음
ord <- order(iris$Petal.Length, iris$Sepal.Length)
head(iris[ord, c(3,1)])
ord <- order(iris$Petal.Length, -iris$Sepal.Length)
head(iris[ord, c(3,1)])
