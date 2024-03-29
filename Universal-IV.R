#Input data & filter out non-dropouts
myData <- read.csv("variable-dosing_7119.csv", header = TRUE)
myData <- myData[myData$Reason.for.dropping != "None",]

#sum up by arm
qty <- aggregate(myData$Qty, by=list(Category=myData$Arm.Group.Title), FUN=sum)
numpeople <- aggregate(myData$X..People, by=list(Category=myData$Arm.Group.Title), FUN=median)
cat <- aggregate(myData$Universal.IV, by=list(Category=myData$Arm.Group.Title), FUN=mean)

#build boxplot
df <- data.frame(qty, numpeople, cat)
bxp <- boxplot(df$x/df$x.1 ~ as.logical(df$x.2), data=myData,horizontal=TRUE, ylab="Use of IV", xlab="% Patient Dropout")

#add text
text(x=0.1, y=1, labels=toString(round(bxp$stats[3,1] * 100, digits=2)))
text(x=0.2, y=2, labels=toString(round(bxp$stats[3,2] * 100, digits=2)))
title(paste("% Patient Dropout rate by use of Universal IV \n n=", sum(numpeople$x), sep=""))



