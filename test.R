df <- read.csv('./titanic/train.csv')
df
df$Parch[df$Parch==0,] <- NA
class(df$Sex)=='character'

for (namer in names(df)) {
  if (class(df$namer)!='character') {
    df[[is.na(df[[namer]]),namer]] <- mean(df[[namer]], na.rm=T)
  }
  
sum(is.na(df$Age))  
}
str(df)
  
df[is.na(df['Age']),'Age'] <- 0

mean(df[['Age']], na.rm=T)

names(df)


mean(df['Age'], na.rm=T)




df['Age']
  