library(car)
data(Prestige)
df <- Prestige
str(df)

table(df$type)
barplot(table(df$type), col = 'orange')

hist(df$incom, col = 'tomato', breaks= 20)
shapiro.test(df$income) # 정규분포와는 무관한 분포다

hist(df$education, col = 'tomato', breaks = 20)
hist(df$women, col = 'tomato', breaks = 20)
hist(df$prestige, col = 'tomato', breaks = 20)

shapiro.test(df$prestige) # 0.05를 기준으로 정규성을 따른다고 할 수 없지만 0.01을 기준으로 정규성을 따른다

plot(df[, -(5:6)], pch = 19, col = 'steelblue')

lm(income ~ education, data = df) # 종속변수 ~ 독립변수

cor(df[, -(5:6)])

model <- lm(income ~ education, data = df)
summary(model) # residuals: 잔차, intercept: 절편, 기각해야하고 상관이 있다?

plot(income ~ education, data = df,
     col = 'skyblue', pch = 19)
abline(model, col = 'tomato', lwd = 2)

model <- lm(income ~ education + women + prestige,
            data = df)
summary(model)


model <- lm(income ~ education + women,
            data = df)
summary(model)

model <- lm(income ~ education + prestige,
            data = df)
summary(model)

model <- lm(income ~ women + prestige,
            data = df)
summary(model)

library(stargazer)
stargazer(model) # 레이텍 표시방법???

stargazer(model, type = 'text')

par(mfrow = c(2, 2))
plot(model)
par(mfrow = c(1, 1))

model <- lm(income ~ education, data = df)
plot(income ~ education, data = df,
     col = 'skyblue', pch = 19)

model <- lm(income ~ education,data = df)

summary(model)
abline(modle)

library(dplyr)
model <- lm(income ~ education + I(education^2),
            data = df)
plot(income ~ education, data = df,
     col = 'skyblue', pch = 19)
with(df, 
     lines(arrange(data.frame(education,
                              fitted(model)),
                   education),
           lty = 1, lwd = 3, col = 'tomato'))
summary(model)


df <- mtcars
str(df)
df <- mtcars[, 1:6]
str(df)

plot(df, col = 'green', pch = 19)

cor(df)

library(corrgram)
corrgram(df)

lm(mpg ~ ., data = df)
model <- lm(mpg ~ ., data = df)
summary(model)

model <- lm(mpg ~ hp + wt, data = df)
summary(model)

model <- lm(mpg ~ disp + drat + hp + wt,
            data = df)
mod.selected <- step(model, direction = 'backward')
summary(mod.selected)


# 연습문제:
# kaggle House Price 데이터셋에서
# 다중 선형 회귀의 변수 선택을 통해
# 최적의 독립 변수 조합을 찾아보시오.
# 1. 전진선택법으로 찾은 조합은? R2, Adjusted R2 값은?
# 2. 후진선택법으로 찾은 조합은? R2, Adjusted R2 값은?

getwd()
SalesPrice ~ 1  # 상수 항??

df <- read.csv('./houseprice/train.csv')
str(df)
dim(df)
is.num <- c()
for (i in 1:80) {
  is.num[i] <- is.numeric(df[, i])
}
is.num
df <- df[, is.num]  # 수치형이 아닌 컬럼 제외
df <- df[, -1]  # Id 컬럼을 제외
dim(df)
df <- df[complete.cases(df), ]  # 결측치 행 제거
dim(df)
str(df)
model <- lm(SalePrice ~ ., data = df)
summary(model)

mod.selected <- step(model, direction = 'backward')
summary(mod.selected)

model <- lm(SalePrice ~ 1, data = df)
mod.selected <- step(model, 
                     direction = 'forward',
                     scope = list(lower = ~ 1,
                                  upper = ~ MSSubClass + LotFrontage +
                                            OverallQual + OverallCond +
                                            X1stFlrSF + X2ndFlrSF + BsmtFullBath +
                                            KitchenAbvGr + TotRmsAbvGrd +
                                    ScreenPorch + PoolArea))
summary(mod.selected)

df <- InsectSprays
str(df)
lm(count ~ spray, data = df)
model <- lm(count ~ spray, data = df)
summary(model)

contrasts(df$spray)

df <- mtcars[, 1:6]
str(df)

df$cyl <- factor(df$cyl)
head(df)
table(df$cyl)

lm(mpg ~ ., data = df)  # cyl4 는 기준변수?
model <- lm(mpg ~ ., data = df)
summary(model)

df <- split(iris, f = iris$Species)
df <- rbind(df$setosa, df$versicolor)
plot(df[, c(3, 5)])  # 종속변수가 Species, 선형 분석할 수 없다?

library(robust)
data(breslow.dat)

df <- breslow.dat
str(df)

df <- df[, c('Base', 'Age', 'Trt', 'sumY')]
str(df)
dim(df)

model <- glm(sumY ~ ., data = df, family = poisson)
summary(model)

exp(coef(model))
          

df <- split(iris, f = iris$Species)
df <- rbind(df$setosa, df$versicolor)
plot(df[, c(3, 5)])   

model <- glm(Species ~ Petal.Length, data = df,
             family = binomial(link = 'logit'))
summary(model)
