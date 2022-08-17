colors()  # 색깔 살펴보기

# 베르누이 시행
windows(width = 7, height = 5)

v <- rbinom(n = 100000, size = 1000, prob = 0.4) # 랜덤 이항분포?, 동전을 동시에 1000개 던져서 앞뒤가 나오는 수??
hist(v, col ='orange', breaks = 30)

set.seed(2022)
v <- runif(n = 100000, min = 0, max = 100)
hist(v, col = 'tomato', breaks = 20)


mean(v)
sd(v) 

v <- rnorm(n =100000, mean= 50, sd = 20)
hist(v, col = 'violet', breaks = 20)


# 몬테카르로 시뮬레이션으로 원주율 계산하기
n_sim <- 1000
x <- vector(length = n_sim)
y <- vector(length = n_sim)
res = 0
for (i in 1:n_sim) {
  x[i] <- runif(1)
  y[i] <- runif(1)
  if (x[i]^2 + y[i]^2 < 1) {
    res <- res + 1
  }
}
4 * res / n_sim

circle <- function (x) sqrt(1 - x^2)
plot(x, y, xlab='X', ylab='Y', col='blue')
curve(circle, from = 0, to = 1, add=T, col='red', lwd=2)


x <- seq(0, 100, length = 100)
y <- dnorm(x, mean = 50, sd = 20)
plot(x, y, type = 'l',
     col = 'tomato', lwd = 3)  # l은 선, lwd 는 선 두께??


x <- seq(0, 100, length = 100)
y <- dunif(x, min = 0, max = 100)
plot(x, y, type = 'l',
     col = 'tomato', lwd = 3)

# 키 데이터?
x <- seq(140, 200, length = 100)
y <- dnorm(x, mean = 170, sd = 10)
plot(x, y, type = 'l',
     col = 'tomato', lwd = 3)


pnorm(35000, mean = 30000, sd = 10000)
pnorm(25000, 30000, 10000)

pnorm(35000, 30000, 10000) - pnorm(25000, 30000, 10000)

# pnorm(1) == pnorm(1, 0, 1)
pnorm(1, 0, 1) - pnorm(-1, 0, 1)

pnorm(2) - pnorm(-2)
pnorm(2.56) - pnorm(-2.56)

pnorm(87, mean = 68, sd = 10)
(1 - pnorm(87, mean = 68, sd = 10)) * 200

pnorm(87, mean = 68, sd = 10, lower.tail = F)  # 위에서 부터???

1 - pnorm(35000, 30000, 10000)
pnorm(35000, 30000, 10000, lower.tail = F)  # 위와 동일


pnorm(70, 60, 10, lower.tail = F)
pnorm(80, 70, 20, lower.tail = F)


x <- rbinom(1000000, size = 100, prob = 0.5)
hist(x, col = 'skyblue', breaks = 20,
     prob = T)
sd(x)
curve(dnorm(x, 50, 5), 30, 70, col = 'tomato',
      add = T, lwd = 3, lty =2)


library(MASS)
height <- na.omit(survey$Height)
length(height)
hist(height, col = 'skyblue', breaks = 20)

mean(height)
sd(height)

X.bar <- c()
for (i in 1:100000) {
  samp <- height[sample(1:209, size = 30)]
  X.bar[i] <- mean(samp)
  X.sd[i] <- sd(samp) 
}
hist(X.bar, col = 'skyblue',
     breaks = 20, prob = T)
x <- seq(160, 180, length = 200)
curve(dnorm(x, mean(height), sd(height)),
      160, 180, col = 'tomato',
      add = T, lwd = 3, lty =2)

curve(dnorm(x, mean(height), sd(X.bar)),
      160, 180, col = 'tomato',
      add = T, lwd = 3, lty =2)

X.bar
X.sd

x.1 <- rnorm(n = 5000, mean = 70, sd = 5)
x.2 <- rnorm(n = 5000, mean = 50, sd = 5)
x <- c(x.1, x.2)
hist(x, col = 'skyblue', breaks = 20)

X.bar <- c()
for (i in 1:100000) {
  samp <- x[sample(x, size = 30)]
  X.bar[i] <- mean(samp)
}
hist(X.bar, col = 'skyblue',
     breaks = 20, prob = T)
x.samp <- seq(30, 90, length = 200)

curve(dnorm(x.samp, mean(x), sd(X.bar)),
      30, 90, col = 'tomato',
      add = T, lwd = 3, lty =2)
 


cor(iris[, -5])

cor.test(iris$Petal.Width, iris$Petal.Length)

binom.test(x = 60, n = 100, p = 0.5) 

qnorm(p = 0.5, mean = 50, sd = 10)

qnorm(p = 0.68, mean = 50, sd = 10)

qnorm(p = 0.975, mean = 50, sd = 10)
qnorm(p = 0.025, mean = 50, sd = 10)

qnorm(p = 0.005, mean = 50, sd = 10)
qnorm(p = 0.995, mean = 50, sd = 10)

pnorm(75.75829, mean = 50, sd = 10)  # qnorm과 역함수 관계?
pnorm(24.24171, mean = 50, sd = 10)
pnorm(69.59964, mean = 50, sd = 10)
pnorm(30.40036, mean = 50, sd = 10)
  
binom.test(x = 65, n = 100, p = 0.5)

binom.test(x = 65, n = 100, p = 0.5, conf.level = 0.99)
  
shapiro.test(survey$Height) 
hist(survey$Height)

shapiro.test(survey$Age)
shapiro.test(iris$Petal.Length)
shapiro.test(mtcars$mpg)
 
qqnorm(survey$Height, col =' skyblue')
qqline(survey$Height, col = 'tomato', lwd = 3)

qqnorm(survey$Age, col =' skyblue')
qqline(survey$Age, col = 'tomato', lwd = 3)


v <- rt(n = 10000, df = 29)  # df = n - 1???
hist(v, col = 'skyblue', prob = T)

x <- seq(-4, 4, length = 200)
curve(dt(x, df = 19), -4, 4, add = T,
      col = 'tomato', lwd = 3, lty = 2)

curve(dnorm(x), -4, 4, add = T,
      col = 'violet', lwd = 5, lty = 4)

pt(q = 2.04523, df = 29)
pt(q = 2.756386, df = 29)

qt(p = 0.975, df = 29)
qt(p = 0.995, df = 29)

library(MASS)
data(cats)
str(cats)

table(cats$Sex)

mean(cats$Bwt, na.rm=T)
tapply(cats$Bwt, INDEX = list(Sex=cats$Sex), mean)

t.test(Bwt ~ Sex, data = cats, conf.level = 0.99)

str(sleep)

t.test(extra ~ group, data = sleep, paired = T)   # 통계적으로 유의하다 ?
