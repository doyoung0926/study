3+4
print('Hello, R!')

x = 3
3 = x
x <- 3
3 -> y

x <- 3




x <- 3
y <- 5
z <- x + y
print(z)
z

getwd()
plot(iris)
?iris
View(iris)






library(cowsay)
library(ggplot2)


say('hello, world!')
say('hi', by='chicken')


str(cars)
?cars


plot(cars$speed, cars$dist, 
     col = 'tomato',
     pch = 19)


# 연습문제 2.1
barplot(table(iris$Species),
        col = 'tomato',
        main = '품종의 막대그래프',
        xlab = '품종',
        ylab = '개수')

# 연습문제 2.2-1
mean(iris$Petal.Width)
var(iris$Petal.Width)
sd(iris$Petal.Width)

# 연습문제 2.2-2
hist(iris$Petal.Width,
     col = 'tomato',
     main = '꽃잎의 너비에 대한 히스토그램',
     xlab = '꽃잎의 너비',
     ylab = '빈도수수')

# 연습문제 2.3-1
hist(mtcars$hp,
     col = 'blue',
     xlim = c(0, 400),
     ylim = c(0, 12))

# 연습문제 2.3-2
plot(mtcars$hp, mtcars$mpg, 
     col= 'tomato',
     pch = 3)

# 연습문제 2.4
str(cars)
summary(cars$speed)
summary(cars$dist)
plot(cars$speed, cars$dist, 
     col = 'tomato', 
     pch = 4,
     xlim = c(0, 30),
     ylim = c(0, 150))


mean(iris$Petal.Length)
var(iris$Petal.Length)
sd(iris$Petal.Length)
hist(iris$Petal.Length, col = 'tomato',
     breaks = 10)    #  간격?




v.1 <- 10

7 %% 3 
7 %/% 3
7 / 3

2 ^ 10
2 ** 10

v <- 1:100
class(v)
v

sum(1:100)







score <- 88
if (score >= 90 ) {
  grande <- 'A'
} else if (score >= 80) {
  grade <- 'B'
} else {
  grade <- 'F'
}

grade


print(3.14)  # 벡터다. 파라미터 값을 리턴해줌???
cat(3.14)  #  값을 출력

n <- 15
if ((n %% 3 == 0) && (n %% 5 == 0)) {
  order <- '피자나라치킨공주'
} else if (n %% 3 == 0) {
  order <- '피자'
} else if (n %% 5 == 0) {
  order <- '치킨'
} else {
  order <- '다이어트'
}
order


getorder <- function(n) {
  order <- 'Diet'
  if (n %% 15 ==0) {
    order <- 'PizzaChicken'
  } else if (n %% 3 == 0) {
    order <- 'Pizza'
  } else if (n %% 5 == 0) {
    order <- 'Chicken'
  }
}
order
n <- 15
order <- getorder(n)

v <- c(10, 20, 30, 40, 50, 60, 70)
v

v[1]
v[7]

v[1:3]
v[3:6]

v[c(1, 3, 4, 7)]
v[-1]

v[-c(1, 3, 4, 7)]
v[8]
v[6:8]



v[-1:3]
v[-(1:3)]

v[7] <- 700
v

v[1:3] <- 100
v
v[1:3] <- c(100, 200, 300)
v

seq(100, 300, 100)
v[1:3] <- seq(100, 300, 100)
v

v <- c(10, 20, 30, 40, 50, 60, 70)

v[c(T, T, F, F, F, T, F)]

v + 1

c(10, 20) + 30

v <- c(10, 20, 30, 40, 50, 60, 70)

v > 30
v[v > 30]

1:9 + 1:2

rep(1:3, times = 3)

v
v[c(T, F)]

# 1 에서 100까지의 수 중에서 7의 배수의 합은?
sum(seq(7, 100, 7))

v <- 1:100
sum(v[v %% 7 == 0])


v <- c()
for (i in 1:10) {
  v <- c(v, i)
}
v


v <- c()
for (i in 1:10) {
  v[i] <- i
}
v

v <- c(10, 20, 30)
v

v[7] <- 70
v

iris$Sepal.Length
iris$Species

f <- factor(c(1, 2, 1, 2),
            levels = 1:3,
            labels = c('Male', 'Female', 'TG'))
f

levels(f)

f[f == 'Female']
f[6] <- 'Male'
f

f[7] <- 'TG'
f

v.1 <- c(1, 2, 3)
v.2 <- c('F', 'F', 'M')
c(v.1, v.2)

lst <- list(id = v.1, gender = factor(v.2))
lst

lst$id
lst$gender

v <- c(10, 20, 30, 40, 50)
which(v %% 3 ==0)     # 괄호 안 True 인 값의 인덱스를 돌려줌
which(v > 30)
v[which(v > 30)]

n <- 32
# n의 약수를 모두 출력하시오.
# 반복문은 사용하지 마시오.
v <- c(1:n)
v[n %% v == 0]

n <- 32
# n의 약수를 모두 출력하시오.
# 반복문은 사용하지 마시오.
v <- 1:n
length(v[n %% v == 0])

n %% v
n %% v == 0
v[n %% v == 0]
length(v[n %% v == 0])

iris
str(iris)
View(iris)

iris[ 1 , ]
iris[ 1:5 , ]d

iris[ 1:5 , 1 ]
iris[ 1:5 , 1:2 ]

iris[ 1:5 , 1:4 ]
iris[ 1:5 , -5 ]

iris[,1]
nrow(iris[ iris$Sepal.Length < 5 , -5 ])
iris$Sepal.Length < 5

# Petal.Length 가 평균보다 큰 데이터의
# Petal.Width 평균값은 얼마인가?
mean(iris[iris$Petal.Length>mean(iris$Petal.Length),-5]$Petal.Width)

mean(iris[iris$Petal.Length > mean(iris$Petal.Length), 
          "Petal.Width"])


fun <- function (x) {
  return (x + y + 5)
}
y <- 5
fun(5)

fun

my.fun <- function(x, y, z = 0) {
  cat(x, y, z, '\n')
  return (x + y * 2 + z * 3)
}

my.fun
my.fun(1, 2)

hist(iris$Sepal.Length,
     main = 'histogram',
     xlab = 'x label',
     ylab = 'y label')



seq(from = 2, to = 100, by = 2)
seq(2, 100, 2)

rep(x = 1:3, each = 2)
rep(1:3, each = 2)

head(iris[, -5])
head(iris[, -5], n = 5)


head(x = iris[, -5], n = 10)


# n의 약수 구하기

div.cnt <- function(n) length((1:n)[n %% (1:n) == 0])
div.cnt(n = 32)

for (i in 1:15) {
  cat(i, div.cnt(i), '\n')
}

sapply(1:15, FUN=div.cnt)


# prime.cnt <-
  

f1 <- function (n) n ^ 2
f1(n = 5)

sapply(1:9, FUN = f1)   # simple apply



(1:100)[sapply(1:100, FUN = div.cnt) == 2]

length((1:100)[sapply(1:100, FUN = div.cnt) == 2])
