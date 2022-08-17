# 집단별로 비율 확인
library(palmerpenguins)
df <- na.omit(penguins)
table(df$species)
prop.table(table(df$species))  # 비율

table(df$island)
prop.table(table(df$island))

table(df$sex)
prop.table(table(df$sex))

table(df$island, df$species)

# tapply(df$species,
#        INDEX = list(df$species),
#        FUN = length)

# gmodels 패키지의 CrossTable() 함수를 이용하여 교차표를 만들어보자.
library(gmodels)
CrossTable(df$island, df$species,
           prop.t = F, prop.chisq = F)

?CrossTable

# psych 패키지의 describe() 함수를 통해서 기술통계량을 산출해보자.
library(psych)
describe(df)[, c(2:4,8:9)]

??ggplot2
library(ggplot2)


# aggregate() 함수를 이용하여 범주별 기술통계량을 산출할 수 있다.
aggregate(df[, 3:6],  # 한 번에 보고 싶으면
          by=list(species = df$species),
          FUN = mean)

tapply(df$bill_length_mm,  # 하나만 보고 싶으면
       INDEX = list(species = df$species),
       FUN = mean)

tapply(df$bill_depth_mm,
       INDEX = list(species = df$species),
       FUN = mean)

# 펭귄의 종별로 박스플롯을 그려보자.
boxplot(flipper_length_mm ~ species,
        data = df, col = 2:4)



df <- data.frame(df)
adelie <- split(df, df$species)$Adelie
adelie
outlier <- boxplot.stats(adelie$flipper_length_mm)$out
outlier
df[df$flipper_length_mm %in% outlier, ]
dim(df[df$flipper_length_mm %in% outlier, ])



library(palmerpenguins)
df <- na.omit(penguins)
df <- data.frame(df)

# 날개 길이 기준으로 오름차순, 체질량 내림차순으로 정렬

ord <- order(df$flipper_length_mm, -df$body_mass_g)
ord
df[ord, ]
head(df[ord, 5:6], n = 10)

getwd()
