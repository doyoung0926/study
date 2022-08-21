# 데이터 전처리1

library(readxl)

# 파일 로딩 (기대수명)
df <- read_excel('project_data.xlsx', sheet = '기대수명')
summary(df)

# 합계
# 열 추출
v <- c()
for (i in c(1, seq(2, 130, 3))) v <- c(v, df[, i])

# 프레임화
df_sum <- data.frame(v)
df_sum <- df_sum[-1, ]
head(df_sum, 10)

# 컬럼명 처리
library(stringr)

v <- c()
for (i in colnames(df_sum)) {
  j <- str_replace(i, '\\...', ' ')  # ... 제거 
  v <- c(v, strsplit(j, ' ')[[1]][1])  # 숫자 제거
}

colnames(df_sum) <- v
colnames(df_sum)


# 대륙 처리
rem <- c('아시아', '북아메리카', '남아메리카', '유럽', '오세아니아')

u <- c()
for (i in colnames(df_sum)) {
  for (j in rem) {
    if (i==j) u <- c(u, which(colnames(df_sum) == i))  # 대륙 인덱스 찾기
  }
}

df_sum <- df_sum[, -u]

# 인덱스를 정리, 형 변환
rownames(df_sum) <- 1:dim(df_sum)[1]

df_sum$시점 <- factor(df_sum$시점)
for (i in colnames(df_sum)[2:dim(df_sum)[2]]) {
  df_sum[[i]] <- as.numeric(df_sum[[i]])
}

# 확인
df_sum


# 데이터 전처리 2

# 데이터 로딩 (부양비_노령화지수)
library(readxl)
df <- read_excel('project_data.xlsx', sheet = '부양비_노령화지수')

# 총부양비

# 열 추출
v <- c()
for (i in c(1, seq(6, 345, 8))) v <- c(v, df[, i])

# 프레임화
df_buyang <- data.frame(v)
df_buyang <- df_buyang[-1, ]
df_buyang

# 컬럼명 처리
library(stringr)

v <- c()
for (i in colnames(df_buyang)) {
  j <- str_replace(i, '\\...', ' ')  # ... 제거 
  v <- c(v, strsplit(j, ' ')[[1]][1])  # 숫자 제거
}

colnames(df_buyang) <- v
colnames(df_buyang)

# 대륙 처리
rem <- c('아시아', '북아메리카', '남아메리카', '유럽', '오세아니아')

u <- c()
for (i in colnames(df_buyang)) {
  for (j in rem) {
    if (i==j) u <- c(u, which(colnames(df_buyang) == i))  # 대륙 인덱스 찾기
  }
}

df_buyang <- df_buyang[, -u]

# 인덱스를 정리, 형 변환
rownames(df_buyang) <- 1:dim(df_buyang)[1]

df_buyang$시점 <- factor(df_buyang$시점)
for (i in colnames(df_buyang)[2:dim(df_buyang)[2]]) {
  df_buyang[[i]] <- as.numeric(df_buyang[[i]])
}

# 확인
df_buyang