# 연습문제 3.1
# 1번 
area <- function (v) v ^ 2
x <- c(5, 10, 15)
y <- area(x)

area <- function (v) v ^ 2
sapply(x, area)
# 2번
round <- function (r) 2*pi*r
area <- function (r) pi*(r^2)
r <- c(5, 10, 15)
sapply(r, round)
sapply(r, area)


# 연습문제 3.2
# 방법1
v <- 1:15
order <- ifelse(v %% 15 == 0, 'PizzaChicken',
                ifelse(v %% 3 == 0, 'Pizza',
                       ifelse(v %% 5 == 0, 'Chicken', 'Diet')))

order
# 방법 2
order <- function (v) ifelse(v %% 15 == 0, 'PizzaChicken',
                             ifelse(v %% 3 == 0, 'Pizza',
                                    ifelse(v %% 5 == 0, 'Chicken', 'Diet')))
v <- 1:15
w <- order(v)
w


# 연습문제 3.3
# 방법 1
sum((1:10) ^ 3)

cumsum <- function (x) sum((1:x) ^ 3)
n <- c(10, 15, 20, 100000000000)
S <- sapply(n, cumsum)
S
# 방법 2
cumsum.1 <- function (x) ((x*(x+1)/2)^2)
sapply(n, cumsum.1)


# 약수 구하기
# 방법1
div <- function (n) (1:n)[n %% (1:n) == 0]
div(48)
# 방법2
div.2 <- function (n) {
  for (i in 1:sqrt(n)) {
    if (n %% i == 0)
      cat(i, n / i, '\n')
  }
}
div.2(36)

# 데이터 프레임
df <- iris
str(df)
class(df)
dim(df)  # 관측값 150 변수 5
nrow(df)
ncol(df)
head(df)

rownames(df)
colnames(df)

v <- c(85, 77, 96)
v

names(v)
names(v) <- c('Kor','Eng','Math')
names(v)
v

v['Kor']
v[c('Eng', 'Math')]  # 이름은 '-'가 안됨, 숫자만 됨

df$Sepal.Length
df$Sepal.Width

df$Sepal.Sum <- df$Sepal.Length + df$Sepal.Width
str(df)

head(df[,5:6])

df$Sepal.Sep <- ifelse(df$Sepal.Sum > mean(df$Sepal.Sum),
                       'Big','Small')
df$Sepal.Sep <- factor(df$Sepal.Sep)
str(df)
levels(df$Sepal.Sep)
table(df$Sepal.Sep)
barplot(table(df$Sepal.Sep), col = 'tomato')

?state.x77
class(state.x77)  # 행렬, 배열
is.data.frame(state.x77)
st <- as.data.frame(state.x77)
class(st)
str(st)
dim(st) # 50개의 주, 8개의 변수
View(st)

nrow(st)[st$Murder==max(st$Murder)]
nrow(st)[st$Population==max(st$Population)]
max(st$Population)

df <- iris
df$Sepal.Sum <- df$Sepal.Length + df$Sepal.Width
write.csv(df, 'my.iris.csv', row.names=F)
getwd()

df <- read.csv('my.iris.csv', header=T)
str(df)

# install.packages('readxl')
library(readxl)
df <- read_excel('성적표.xlsx', sheet = 1)
str(df)
class(df)

df <- data.frame(df)
str(df)
df$평균 <- round(apply(df[, 3:5], MARGIN = 1, mean),2)  # MARGIN =1 행, MARGIN =2 열
head(df)
whirte.cwv(df, 'score.csv', row.names = F)
View(df)



# 데이터 전처리(1)
aq <- airquality
str(aq)
mean(aq$Ozone, na.rm = T)
is.na(aq$Ozone)   # na인 것은 TRUE
aq$Ozone[is.na(aq$Ozone)]
sum(is.na(aq$Ozone))

ozone <- aq$Ozone
ozone[is.na(ozone)] <- mean(ozone, na.rm = T)
ozone

mean(aq$Ozone, na.rm = T)
mean(ozone)

sd(aq$Ozone, na.rm = T)
sd(ozone)

dim(aq)

ozone <- aq$Ozone
ozone[is.na(ozone)] <- sample(na.omit(aq$Ozone), 37)   # 랜덤으로 줌???
ozone

mean(aq$Ozone, na.rm = T)
mean(ozone)

sd(aq$Ozone, na.rm = T)
sd(ozone)

aq <- airquality
complete.cases(aq)  # 값이 있는 행 TRUE ???
aq[!complete.cases(aq), ]
aq <- aq[complete.cases(aq), ]  # 결측치 제거 방법
aq

library(VIM)
?aggr
aggr(airquality)

st <- data.frame(state.x77)
boxplot(st$Income,
        col = 'tomato',
        pch = 19,
        border = 'red')

class(boxplot.stats(st$Income))

boxplot.stats(st$Income)$out  # out 벡터만 리턴해줌?

st[st$Income == boxplot.stats(st$Income)$out, ]

df <- iris
boxplot(df$Petal.Length, col = 'skyblue')

boxplot(Petal.Length ~ Species, data = iris,
        col = 'steelblue')

boxplot(Petal.Width ~ Species, data = iris,
        col = 'steelblue')

# iris[iris$Species == 'setosa', ]
outlier <- boxplot.stats(iris[iris$Species == 'setosa', 4])$out

iris[iris$Petal.Width %in% outlier, ]


# 데이터 전처리(2)
st <- data.frame(state.x77)
st[st$Population == max(st$Population), ]
st[st$Population == max(st$Population), c(3, 6)]  # 문맹률, 고등학교 졸업율

subset(st,
       subset = st$Population == max(st$Population),
       select = c(3, 6))

iris[ ,-5]
subset(iris, select = 1:4)

set <- iris[iris$Species == 'setosa', ]
ver <- iris[iris$Species == 'versicolor', ]
vir <- iris[iris$Species == 'virginica', ]

sp <- split(iris, f = iris$Species)
length(sp)
names(sp)
class(sp)

sp$setosa
sp$versicolor
sp$virginica

dim(sp$setosa)
dim(sp$versicolor)

df.2 <- rbind(sp$setosa, sp$versicolor)
dim(df.2)

iris[, 1:2]
iris[, 3:4]
df.3 <- cbind(iris[, 1:2], iris[, 3:4])
dim(df.3)
str(df.3)

getwd()

library(readxl)
df.1 <- read_excel('성적표.xlsx', sheet = 1)
df.2 <- read_excel('성적표.xlsx', sheet = 2)
df.1
df.2

cbind(df.1, df.2)
merge(df.1, df.2)  # 번호 이름이 primary key 역할해줌, 이너조인
merge(df.1, df.2, all = T)  # outer join

merge(df.1, df.2, all = T,
      by.x = '번호',
      by.y = 'No')

df <- merge(df.1, df.2, all = T,
      by.x = c('번호', '이름'),
      by.y = c('No', 'Name'))
str(df)

df$`Deep Learning`

colnames(df) <- c('no',
                 'name',
                 'python',
                 'r',
                 'ml',
                 'dl',
                 'cloud')

str(df)

colnames(df)[6] <- '딥러닝'
colnames(df)
str(df)


df <- iris
aggregate(df[,-5], 
          by = list(df$Species),
          FUN = mean)

aggregate(df[,-5], 
          by = list(품종 = df$Species),
          FUN = mean)

aggregate(df[,-5], 
          by = list(품종=df$Species),
          FUN = sd)


library(MASS)
data('survey')
df <- survey
str(df)

df <- na.omit(df)
df <- df[complete.cases(df), ]
dim(df)

hist(df$Height, breaks = 20)

hist(df[df$Sex == 'Male', ]$Height,
     breaks = 20)

hist(df[df$Sex == 'Female', ]$Height,
     breaks = 20)

mean(df[df$Sex == 'Male', ]$Height)
mean(df[df$Sex == 'Female', ]$Height)

aggregate(df[,c(10, 12)], 
          by = list(Gender = df$Sex),
          FUN = mean)


table(df$Sex)
t.test(Height ~ Sex, data = df)


boxplot(Height ~ Sex, data = df, 
        col = c('orange', 'tomato'))

v <- c(30, 50, 20, 40, 10)
v

sort(v)
sort(v, decreasing = T)

df <- data.frame(state.x77)
str(df)

sort(df$Illiteracy, decreasing = T)
sort(df, decreasing = T)

ord <- order(df$Illiteracy, df$Income, decreasing = T)
df[ord[1:10], c(3, 2)]


s <- 0
for (i in 1:10000000) {
  x <- sample(1:10, size = 5)  # sample 함수는 랜덤? , 비복원 추출
  s <- s + sum(x == 7)
}
s

set.seed(2022)  # 랜덤이지만 재연가능하게 함함
sample(1:10, size = 5, replace = T)  # 복원 추출, 같은 수가 뽑힐 수 있음

idx <- sample(1:nrow(iris), size = 50)
iris[idx, ]

library(palmerpenguins)
data(package = 'palmerpenguins')
data('penguins')

pg <- data.frame(penguins)
str(pg)

library(VIM)
aggr(pg, numbers= T, prop = F)
pg <- na.omit(pg)
dim(pg)


str(pg)
table(pg$species)
barplot(table(pg$species))

table(pg$island)
barplot(table(pg$island))

table(pg$sex)
barplot(table(pg$sex))

str(pg[, 3:6])
summary(pg[, 3:6])

par(mfrow = c(2, 2))
# hist(pg$bill_length_mm, col = 1:5)
hist(pg$bill_length_mm, col = c('orange', 'violet', 'pink'))
hist(pg$bill_depth_mm)
hist(pg$flipper_length_mm)
hist(pg$body_mass_g)
par(mfrow = c(1, 1))

my.color <- ifelse(pg$species == 'Gentoo', 'tomato',
                   ifelse(pg$species == 'Adelie', 'steelblue', 'orange'))
plot(pg$bill_length_mm, pg$bill_depth_mm,
     pch = 19, col = my.color)

cor(pg$bill_length_mm, pg$bill_depth_mm)

cor(pg[pg$species == 'Adelie', ]$bill_length_mm,
    pg[pg$species == 'Adelie', ]$bill_depth_mm)
