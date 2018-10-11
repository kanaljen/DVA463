analysis <- read.csv("analysis.csv",head=TRUE,sep=";")
attach(analysis)

wilcox.test(NumberOfTests_Manual, NumberOfTests_Auto)

pdf("numberOfTests.pdf",width=3,height=4)
boxplot(NumberOfTests_Manual, NumberOfTests_Auto,
        las = 1,ylab="Number of Tests", 
        names=c("Manual","Automatic"),
        main=" ")
dev.off()