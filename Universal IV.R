myData <- read.csv("C:/Users/beaston/Desktop/R/variable-dosing_7119.csv", header = TRUE)
myData <- myData[myData$Reason.for.dropping != "None",]
qty <- aggregate(myData$Qty, by=list(Category=myData$Arm.Group.Title), FUN=sum)
numpeople <- aggregate(myData$X..People, by=list(Category=myData$Arm.Group.Title), FUN=mean)
cat <- aggregate(myData$Universal.IV, by=list(Category=myData$Arm.Group.Title), FUN=mean)
df <- data.frame(qty, numpeople, cat)
boxplot(df$x/df$x.1 ~ df$x.2, data=myData, varwidth=FALSE, horizontal=TRUE, notch=FALSE)

