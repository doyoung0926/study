str(sleep)
sleep

library(tidyr)
wide.df <- spread(sleep, key = group, value = extra)  
summary(wide.df) # 1: 사전, 2: 사후

tapply(sleep$extra, 
       INDEX = list(sleep$group),
       FUN = mean)

t.test(extra ~ group, data = sleep, paired = T)
t.test(wide.df$'1', wide.df$'2', paired = T)


v <- rchisq(n = 10000, df = 1)
hist(v, col = 'orange')

x <- seq(0, 15, length = 200)
curve(dchisq(x, df = 1), 0, 15,
      col = 'red', lwd= 2, lty = 1)

curve(dchisq(x, df = 5), 0, 15, add = T,
      col = 'tomato', lwd= 2, lty = 1)

curve(dchisq(x, df = 10), 0, 15, add = T,
      col = 'steelblue', lwd= 2, lty = 1)

qchisq(p = 0.95, df = 1)
pchisq(q = 2.5, df = 1)
pchisq(q = 3.841459, df = 1)
pchisq(q = 5, df = 1, lower.tail = F)


mt <- matrix(c(1443, 151, 47, 1781, 312, 135), nrow = 3)
mt

df <- data.frame(mt)
str(df)
df

colnames(df) <- c('With', 'Without')
df
rownames(df) <- c('경상','중상','사망')
df

oij <- c(1443, 1781, 151, 312, 47, 135) # 관측값
eij <- c(1367, 1855.9, 196.9, 267.4, 77.1, 104.7) # 예측값
cs.value <- sum((oij - eij) ^ 2 / eij)
cs.value

Titanic
class(Titanic)

tb <- margin.table(Titanic, margin = c(4, 3))
class(tb)
tb

chisq.test(tb)


v <- rf(n = 10000, df1 = 1, df2 = 30)
hist(v, col = 'steelblue')

x <- seq(0, 15, length = 200)
curve(df(x, df1 = 1, df2 = 30), 0, 15,
      col= 'tomato', lwd = 2, lty = 1)

curve(df(x, df1 = 5, df2 = 50), 0, 15, add = T,
      col= 'blue', lwd = 2, lty = 1)

curve(df(x, df1 = 10, df2 = 80), 0, 15, add = T,
      col= 'magenta', lwd = 2, lty = 2)

qf(p = 0.95, df1 = 1, df2 = 30)
pf(q = 4.170877, df1 = 1, df2 = 30)
pf(q = 4.170877, df1 = 1, df2 = 30, lower.tail = F)

df <- InsectSprays
str(df)
table(df$spray)

round(tapply(df$count, 
       INDEX = list(df$spray), 
       FUN = mean), 3)

boxplot(count ~ spray, data = df,
        col = 2:7)

aov.result <- aov(count ~ spray, data = df)
summary(aov.result)

TukeyHSD(aov.result)

library(gplots)
plotmeans(count ~ spray, data = df,
          col = 'tomato', lwd = 3,
          barcol = 'orange', barwidth = 3)

model.tables(aov.result, type = 'mean')
model.tables(aov.result, type = 'effect')

plot(TukeyHSD(aov.result),
     las = 1, col = 'tomato')

library(car)
qqPlot(df$count, pch = 19, col = 'orange')
shapiro.test(df$count)

leveneTest(count ~ spray, data = df)
bartlett.test(count ~ spray, data = df)

oneway.test(count ~ spray, data = df)


df <- ToothGrowth
str(df)
unique(df$dose)
df$dose <- factor(df$dose,
                  levels = c(0.5, 1.0, 2.0),
                  labels = c('L', 'M', 'H'))
str(df)

tapply(df$len,
       INDEX = list(SUPP=df$supp, DOSE=df$dose),
       FUN = mean)

with(df, tapply(len, list(SUPP=supp, DOSE=dose), mean))

boxplot(len ~ supp * dose, data = df,
        col = c('orange', 'tomato'))

boxplot(len ~ supp + dose + supp:dose, data = df,
        col = c('orange', 'tomato'))     # 위와 동일


aov.result <- aov(len ~ supp * dose, data = df)
summary(aov.result)

TukeyHSD(aov.result)
plot(TukeyHSD(aov.result), las = 1)
