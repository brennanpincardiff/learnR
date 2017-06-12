delegates <- data.frame(read.csv("//Users//Mark//Documents//Cardiff//Teaching//R//learnR//Handbook//Datasets//Delegates.csv"))

delegates$Type <- sample(c(1,2,3),dim(delegates)[1],replace=T)
delegates$Category <- sample(c("A","B"),dim(delegates)[1],replace=T)
delegates$number <- rnorm(dim(delegates)[1],0,1)

write.csv(delegates,file="//Users//Mark//Documents//Cardiff//Teaching//R//learnR//Handbook//Datasets//Delegates.csv",row.names=F)


starsign <- sample(c("Capricorn","Sagittarius","Cancer","Leo","Virgo","Pisces","Gemini","Aquarius","Taurus"),1000,replace=T) 
tuition <- sample(c(0:10),1000,replace=T)
testscore <- round(rnorm(1000,60,5) + tuition*runif(1000,0,.5) ,0)
hist(testscore)

examdata <- data.frame(testscore=testscore,tuition=tuition,starsign=starsign)
write.csv(examdata,file="//Users//Mark//Documents//Cardiff//Teaching//R//learnR//Handbook//Datasets//examdat.csv",row.names=F)




