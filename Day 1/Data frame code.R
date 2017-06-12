dfexample<-data.frame(gender = c("M","M","F","M","F","F","F","M","M","M"), 
                      ht = c(172,186.5,165,180,162.5,179,171,188,175,190), 
                      wt = c(91,99,74,80,75,73,87,90,78,73))

dfexample

dfexample1<-data.frame(dfexample, age = c(25,18,37,23,27,32,30,32,29,19))

dfexample1

head(dfexample1)

head(dfexample1, n=3)

dfexample1[1]

dfexample1["gender"]

dfexample1[c("gender", "age")]

dfexample1[3,]

dfexample1[c(3, 10),]


dfexample1[c(3,10),c("gender","age")]

str(dfexample1)

names(dfexample1)

nrow(dfexample1)

ncol(dfexample1)

summary(dfexample1)

library(foreign)

spssexample<-read.spss(file=
                         "/Users/Mark/Documents/GitHub/learnR/data/Simulated data for CH4 030616.sav",
                         to.data.frame=TRUE, use.value.labels=TRUE)

str(spssexample)

head(spssexample)

spssexample[c(1,2,3,4,5),c("VAR1","DIFF_V1V2")]

summary(spssexample)
