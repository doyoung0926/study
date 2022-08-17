library(palmerpenguins)
pg <- penguins
str(pg)
pg <- pg[complete.cases(pg), -8]  # 결측치 제거, 연도 행 제거
str(pg)
dim(pg)

pg$is.adelie <- factor(
  ifelse(pg$species == 'Chinstrap',
                              'Yes', 'No'))
barplot(table(pg$is.adelie))  # 분포 확인 해보기

str(pg)
pg <- pg[, -1]
str(pg)
levels(pg$island)
model <- glm(is.adelie ~ ., data = pg,
             family = binomial(link = 'logit'))

summary(model)

model$fitted.values  # 0이 될 확률, 1이 될 확률 ???
pg$pred <- factor(ifelse(model$fitted.values > 0.5,
                        'Yes', 'No'))
table(pg$is.adelie, pg$pred)  # 위치가 바뀐 혼동행렬 ?


df <- iris
df$Species <- factor(ifelse(df$Species == 'virginica',
                            'Yes','No'))  # 실제값?
model <- glm(Species ~ ., data = df,
             family = binomial(link = 'logit'))
summary(model)

df$pred <- factor(ifelse(model$fitted.values > 0.5,
                         'Yes', 'No'))   # P 값이 예측값?

tab <- table(df$Species, df$pred)

TP <- tab[2, 2]
TN <- tab[1, 1]
FP <- tab[2, 1]
FN <- tab[1, 2]

accuracy <- (TP + TN) / (TP + TN + FP +FN)
precision <- TP / (TP + FP)
recall <- TP / (TP + FN)
F1.score <- (2 * precision * recall) / (precision + recall)
  
library(pROC)
roc(Species ~ model$fitted.values, data = df,
    plot = TRUE, main = 'ROC CURVE', col = 'tomato')  # AUC 아주 좋은 'virginica' 분류이다.  0.5에서 1이 나오는데 보통 0.8이상이면 괜찮은 지표?

library(faraway)
df <- sexab
?sexab

getwd()
