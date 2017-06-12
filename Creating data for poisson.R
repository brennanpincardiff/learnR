#Preparing poisson regression script
p <- read.csv("https://stats.idre.ucla.edu/stat/data/poisson_sim.csv")
p <- within(p, {
  prog <- factor(prog, levels=1:3, labels=c("General", "Academic", 
                                            "Vocational"))
  id <- factor(id)
})
summary(p)

write.csv(p,file="/Users/Mark/Documents/GitHub/learnR/Day 3/poisson.csv")

