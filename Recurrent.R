myData <- read.csv("C:/Users/beaston/Desktop/R/variable-dosing_7119.csv", header = TRUE)
myData <- myData[myData$Reason.for.dropping != "None",]
qty <- aggregate(myData$Qty, by=list(Category=myData$Arm.Group.Title), FUN=sum)
numpeople <- aggregate(myData$X..People, by=list(Category=myData$Arm.Group.Title), FUN=median)
cat <- aggregate(myData$Recurrent, by=list(Category=myData$Arm.Group.Title), FUN=mean)
df <- data.frame(qty, numpeople, cat)
bxp <- boxplot(df$x/df$x.1 ~ as.logical(df$x.2), data=myData,horizontal=TRUE, ylab="Recurrent Patient", xlab="% Patient Dropout")
text(x=0.2, y=1, labels=toString(round(bxp$stats[3,1] * 100, digits=2)))
text(x=0.2, y=2, labels=toString(round(bxp$stats[3,2] * 100, digits=2)))
title(paste("% Patient Dropout rate by Recurrence \n n=", sum(numpeople$x), sep=""))



