analysis <- read.csv("integrated.csv",head=TRUE,sep=";")
attach(analysis)

wilcox.test(IDEA_time, IDEB_time, paired = TRUE)

t.test(IDEA_time, IDEB_time, paired = TRUE,alternative=NULL)

d <- with(analysis, IDEA_time - IDEB_time)
shapiro.test(d)

pdf("integrated.pdf",width=5,height=5)

# Boxplot for both IDEs
boxplot(IDEA_time, IDEB_time,
        las = 1,ylab="time (min)", 
        names=c("IDE-A","IDE-B"))

# Histogram for IDE-A
hist(IDEA_time,xlab="time (min)",
     ylab = "No subjects",
     main="")

# Histogram for IDE-B
hist(IDEB_time,xlab="time (min)",
     ylab = "No subjects",
     main="")

# Scatterplot for both IDEs
plot(IDEA_time,type="b", ylab = "time (min)",
     xlab = "programmer",col="green",pch=4)
lines(IDEB_time,col="red",type="b",pch=1)
legend(3, 100, legend=c("IDE-A", "IDE-B"),
       col=c("green", "red"), lty=1, cex=0.8)

# Scatterplot for both IDEs
plot(sort(IDEA_time),type="b", 
     ylab = "time (min)",xlab = "programmer",col="green",pch=4)
lines(sort(IDEB_time),col="red",type="b",pch=1)
legend(1, 170, legend=c("IDE-A", "IDE-B"),
       col=c("green", "red"), lty=1, cex=0.8)

# Histogram
hist(d,xlab="time difference (min)",
     ylab = "No subjects",
     main="")

dev.off()
