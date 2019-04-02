#20190327 실습
?mpg
install.packages('ggplot2')
library('ggplot2')
?mpg
head(mpg)
str(mpg)

#base package를 이용한 mpg그래프 작성
hist(mpg$hwy, breaks=15)
boxplot(mpg$hwy)
boxplot(mpg$hwy~mpg$drv) #x, y값
plot(mpg$displ~mpg$hwy)

##################################
x1 <- c(1,2,5,3,6,-2,4)
x1
x2 <- c("one", "two", "three")
x2
x3 <- c(TRUE, TRUE, FALSE, FALSE )
x3

x8 <- rep(1:3, 2)
x8

y1 <- c(1,2,"one")
y1

y2 <- c(TRUE, FALSE, 2)
y2


mode(x1)
mode(x2)
length(x1)
length(x2)

m4 <- matrix(1:10, nrow=2)
m4
m4[1,4]
m4[2,]
m4[,2]
m4[1, c(3,4)]
m4[1, -c(1,2,3)]
m4[3]

cell <- c(1,26,24,68)
rname <- c("r1", "r2")
cname <- c("c1", "C2")
m2 <- matrix(cell, nrow=2, ncol=2, byrow=TRUE, dimnames = list(rname, cname) )
m2

list1 <- list(1, "a", TRUE, 1+4i)
list1

g <- "My First List"
h <- c(25, 26,18, 39)
j <- matrix(1:10, nrow=5)
k <- list("a list within a list", h)
mylist <- list(title=g, ages=h, j, k)
mylist


mylist[2]
mylist[[2]]
mylist$age

mylist[[4]]
mylist[[4]][[2]]
mylist[[4]][[2]][2]


mylist[[3]]
mylist[[3]][c(2,3)]

####data frame####
patientID <- c(1,2,3,4)
age <- c(25,34,28,52)
diabetes <- c("Type1", "Type2", "Type3", "Type4")
status <- c("Poor","Improved", "Excellent","Poor")
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata

str(patientdata)
summary(patientdata)

patientdata
patientdata[1,2]
patientdata[1:2]
patientdata[1:2,]
patientdata[,1:2]
patientdata[c("diabetes", "status")]

patientdata$age #한가지 속성변수 뽑아낼때
patientdata["age"]
