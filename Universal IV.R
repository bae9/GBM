myData <- read.csv("C:/Users/beaston/Desktop/R/variable-dosing_7119.csv", header = TRUE)
myData <- myData[myData$Reason.for.dropping != "None",]
qty <- aggregate(myData$Qty, by=list(Category=myData$Arm.Group.Title), FUN=sum)
numpeople <- aggregate(myData$X..People, by=list(Category=myData$Arm.Group.Title), FUN=mean)
cat <- aggregate(myData$Universal.IV, by=list(Category=myData$Arm.Group.Title), FUN=mean)
df <- data.frame(qty, numpeople, cat)
boxplot(df$x/df$x.1 ~ as.logical(df$x.2), data=myData,horizontal=TRUE, ylab="Use of IV", xlab="% Patient Dropout")
title(paste("% Patient Dropout rate by use of Universal IV \n n=", sum(numpeople$x), sep=""))

