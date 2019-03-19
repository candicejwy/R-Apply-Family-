#Import data
Chicago <- read.csv("Chicago-F.csv",row.names = 1)
NewYork <- read.csv("NewYork-F.csv",row.names = 1)
Houston <- read.csv("Houston-F.csv",row.names = 1)
SanFrancisco <- read.csv("SanFrancisco-F.csv",row.names = 1)
#Check
NewYork
Houston
SanFrancisco
#these are df:
is.data.frame(Chicago)
#convert to matrices:
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)
#Check
NewYork
Houston
SanFrancisco
#put all of these into a list
Weather <- list(Chicago = Chicago,NewYork = NewYork,Houston = Houston,SanFrancisco = SanFrancisco)
#try it at
Weather[[3]] #matrix
Weather$Houston
Weather[3] #list with 1 component
#What is the apply family
#apply(M,1,mean)
#apply,lapply,sapply,tapply,by,eapply,vapply,rapply,mapply,replicate,..
#Using apply
apply(Chicago,1,mean)
#check
mean(Chicago["DaysWithPrecip",])
apply(Chicago,1,max)
max(Chicago["AvgPrecip_inch",])
apply(Chicago,1,min)
min(Chicago["AvgLow_F",])
#Compare
apply(Chicago,1,mean)
apply(NewYork,1,mean)
apply(Houston,1,mean)
apply(SanFrancisco,1,mean)
#<<<<<<deliv 1: but there is a faster one
#Recrating the apply function using loop:
Chicago
#find the mean of every row
output <- NULL #preparing an empty vector
for(i in 1:5){#run the cycle of the loop
  output[i] <- mean(Chicago[i,])
}
output
names(output) <- rownames(Chicago)
output
#via apply function
apply(Chicago,1,mean)
#Using lapply
t(Chicago)#transpose
mynewlist
Weather
mynewlist <- lapply(Weather,t)
#list(t(Chicago),t(NewYork),t(Houston),t(SanFrancisco))
#e.g.2
rbind(Chicago,NewRow=1:12)
#e.g.3
lapply(Weather,rbind,NewRow=1:12)
?rowMeans
rowMeans(Chicago)
lapply(Weather,rowMeans)
#<<<<<<(nearly) deliv 2: even better, but will improve further
#Combining lapply with[]
Chicago
Weather$Chicago[1,1]
Weather[[1]][1]
lapply(Weather,"[",1,1)
lapply(Weather,"[", ,1)#first column of every matrix#January
lapply(Weather,"[",,3)
#Adding your own function
lapply(Weather,rowMeans)
lapply(Weather,function(x)x[1,])
lapply(Weather,function(x)x[,12])#december
lapply(Weather,function(z)(z[1,]-z[2,])/z[2,])
lapply(Weather,function(z)round((z[1,]-z[2,])/z[2,],2))
#<<<<<<<<<<<<<Deliv 2: temp fluctuations: will improve
#Using sapply:
#avgHight_F for July
lapply(Weather,"[", 1,7)
sapply(Weather,"[", 1,7)
#AvgHight_F for fourth quater
sapply(Weather,"[", 1,10:12)
#another e.g.
lapply(Weather,rowMeans)
round(sapply(Weather,rowMeans),2)
#<<<<<<<Deliv 1 awesome!
#another e.g.:
sapply(Weather,function(z)round((z[1,]-z[2,])/z[2,],2))
#Nesting and apply function
?rowMeans
Chicago
apply(Chicago,1,max)
lapply(Weather,apply,1,max)
lapply(Weather,function(x)apply(x,1,max))
#tidy up
sapply(Weather,function(x)apply(x,1,max))
#Which max()and min()
?which
Chicago[1,]
which.max(Chicago[1,])
names(which.max(Chicago[1,]))
#by the sum of it, we will have:apply- to iterate over rows of the matrix,and we will have lapply/sapply
apply(Chicago,1,function(x)names(which.max(x)))
lapply(Weather,function(y)apply(y,1,function(x)names(which.max(x))))
sapply(Weather,function(y)apply(y,1,function(x)names(which.max(x))))
