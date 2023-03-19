#1.
#For loop in R
for (i in 1:5)
{
  print("HBD")
}

for (i in 1:5)
{
  print("HBD")
  print("Hello World")
}
#importance of braces
for (i in 1:5)
  print("HBD")
  print("Hello World")

x = c(3,5,8,9,4)

for (i in 1:length(x))
{
  print(x[i])
}

for(element in x)
{
  print(element)
}

#2
#paste() function
paste("I", "Love", "Statistics")
paste("I", "Love", "Statistics", sep = "")
paste("I", "Love", "Statistics", sep = "-")

friend = "Dost"
paste("HBD", friend)

friends = c("Dost1", "Dost2", "Dost3")
for (friend in friends)
{
  print(paste("HBD", friend))
}


#3 
#Some basic reviews on dataframes
library(MASS)
View(Boston)


#printing the means of all the columns
for (i in 1 : ncol(Boston))
{
  print(mean(Boston[,i]))
}

#printing the names of all the columns
for (i in 1 : ncol(Boston))
{
  print(names(Boston[i]))
}


#printing the names with mean
for (i in 1 : ncol(Boston))
{
  print(paste(names(Boston)[i], "=",round(mean(Boston[,i]),3)))
}

#printing names approach 2
for(name in names(Boston))
{
  print(mean(Boston[,name]))
}

#printing means approach 2
for(name in names(Boston))
{
  print(paste(name,"=",round(mean(Boston[,name]),3)))
}

#Appending vectors and names
avg = c()
avg = c(avg,5)
avg = c(avg,10)
avg
avg = c(avg,15)
avg


#appending the mean
avg = c()
for(i in 1:ncol(Boston))
{
  avg = c(avg, mean(Boston[,i]))
}
avg

avg[7]

x
names(x) = c("a","b","c","d","e")
x

x[1]
x[c(1,3)]
x["a"]
x[c("a","e")]


avg
names(avg) = names(Boston)
avg


avg["age"]
avg[7]


avg = c()
for (i in names(Boston))
{
  avg = c(avg,mean(Boston[,i]))
}
avg

avg = c()
for (i in 1:ncol(Boston))
{
  avg[i] = mean(Boston[,i])
}
avg



#adding value to vector at an index
vec = c(1,2,3)
vec[4]=20
vec
vec[10] = 100
vec

#Getting the mean along with the column names
avg = c()
for (i in names(Boston))
{
  avg[i] = mean(Boston[,i])
}
avg

avg = as.matrix(avg)
avg
View(avg)
rownames(avg)
colnames(avg) = "mean"
avg
View(avg)


#plot

hist(Boston$crim)
hist(Boston[,1])

#all variableas will have same desc
for (i in 1:ncol(Boston))
{
  hist(Boston[,i], main = "Histogram of crim", xlab = "crim")
}

hist(Boston[,1], main = "Histogram of crim", xlab = "crim")
hist(Boston[,1], main = paste("Histogram of",names(Boston)[1]), xlab = names(Boston)[1])

#For all variables along with the desc
for (i in 1:ncol(Boston))
{
  hist(Boston[,i], main = paste("Histogram of",names(Boston)[i]), xlab = names(Boston)[i])
}

for (i in 1:ncol(Boston))
{
  hist(Boston[,i], main = paste("Histogram of",names(Boston)[i]), 
       xlab = names(Boston)[i], col = 'gold', border = F)
}

#boxplot
for (i in 1:ncol(Boston))
{
  boxplot(Boston[,i], main = paste("Boxplot of",names(Boston)[i]), 
       xlab = names(Boston)[i], horizontal = T, col = 'gold')
}

par(mfrow = c(2,1))
hist(Boston$crim)
boxplot(Boston$crim, horizontal = T)


#together
for (i in 1:ncol(Boston))
{
  par(mfrow = c(2,1))
  
  boxplot(Boston[,i], main = paste("Boxplot of",names(Boston)[i]), 
          xlab = names(Boston)[i], horizontal = T, col = 'gold')
  
  hist(Boston[,i], main = paste("Histogram of",names(Boston)[i]), 
       xlab = names(Boston)[i], col = 'gold', border = F)
}



data = mtcars
View(data)
str(data)

data$vs = as.factor(data$vs)
data$am = as.factor(data$am)

#this will give error for categorical variable
#for (i in 1:ncol(data))
#{
#  par(mfrow = c(2,1))
#  
#  boxplot(data[,i], main = paste("Boxplot of",names(data)[i]), 
#          xlab = names(data)[i], horizontal = T, col = 'gold')
#  
#  hist(data[,i], main = paste("Histogram of",names(data)[i]), 
#       xlab = names(data)[i], col = 'gold', border = F)
#}

#removing categorical variable
for (i in 1:ncol(data))
{
  if(is.numeric(data[,i]))
  {
    par(mfrow = c(2,1))
    
    boxplot(data[,i], main = paste("Boxplot of",names(data)[i]), 
            xlab = names(data)[i], horizontal = T, col = 'gold')
    
    hist(data[,i], main = paste("Histogram of",names(data)[i]), 
         xlab = names(data)[i], col = 'gold', border = F)
  }
}



#Complete for all variables
for (i in 1:ncol(data))
{
  if(is.numeric(data[,i]))
  {
    par(mfrow = c(2,1))
    
    boxplot(data[,i], main = paste("Boxplot of",names(data)[i]), 
            xlab = names(data)[i], horizontal = T, col = 'gold')
    
    hist(data[,i], main = paste("Histogram of",names(data)[i]), 
         xlab = names(data)[i], col = 'gold', border = F)
  }
  
  if(is.factor(data[,i]))
  {
    par(mfrow = c(1,1))
    barplot(table(data[,i]),xlab = names(data)[i],
            main = paste("Barplot of",names(data)[i]), 
            col = 'gold', border = F)
  }
}

#method 2
for (i in 1:ncol(data))
{
  if(is.numeric(data[,i]))
  {
    par(mfrow = c(2,1))
    
    boxplot(data[,i], main = paste("Boxplot of",names(data)[i]), 
            xlab = names(data)[i], horizontal = T, col = 'gold')
    
    hist(data[,i], main = paste("Histogram of",names(data)[i]), 
         xlab = names(data)[i], col = 'gold', border = F)
  }
  
  else if(is.factor(data[,i]))
  {
    par(mfrow = c(1,1))
    barplot(table(data[,i]),xlab = names(data)[i],
            main = paste("Barplot of",names(data)[i]), 
            col = 'gold', border = F)
  }
}



###########################################################################
#Functions in R

Bill = function(bill)
{
  final = bill * 1.05
  return(final)
}

Bill(100)


Bill = function(bill, tax)
{
  final = bill * (1 + tax/100)
  return(final)
}

Bill(100,10)


Bill = function(bill, tax = 10)
{
  final = bill * (1 + tax/100)
  return(final)
}

Bill(100)
Bill(100,50)

#-------------------------------------------------------------------
data = mtcars

for (i in 1:ncol(data))
{
  if(is.numeric(data[,i]))
  {
    par(mfrow = c(2,1))
    
    boxplot(data[,i], main = paste("Boxplot of",names(data)[i]), 
            xlab = names(data)[i], horizontal = T, col = 'gold')
    
    hist(data[,i], main = paste("Histogram of",names(data)[i]), 
         xlab = names(data)[i], col = 'gold', border = F)
  }
  
  else if(is.factor(data[,i]))
  {
    par(mfrow = c(1,1))
    barplot(table(data[,i]),xlab = names(data)[i],
            main = paste("Barplot of",names(data)[i]), 
            col = 'gold', border = F)
  }
}
#################################################################

Graph_v1 = function(data)
{
  for (i in 1:ncol(data))
  {
    if(is.numeric(data[,i]))
    {
      par(mfrow = c(2,1))
      
      boxplot(data[,i], main = paste("Boxplot of",names(data)[i]), 
              xlab = names(data)[i], horizontal = T, col = 'gold')
      
      hist(data[,i], main = paste("Histogram of",names(data)[i]), 
           xlab = names(data)[i], col = 'gold', border = F)
    }
    
    else if(is.factor(data[,i]))
    {
      par(mfrow = c(1,1))
      barplot(table(data[,i]),xlab = names(data)[i],
              main = paste("Barplot of",names(data)[i]), 
              col = 'gold', border = F)
    }
  }
  
}

Graph_v1(mtcars)

library(MASS)
View(Boston)

Graph_v1(Boston)

#Exporting the plots
png("Histogram - NOX.png")
hist(Boston$nox, main = "Histogram of NOX",xlab = "NOX", col = "skyblue2")
dev.off()


#################################################################

Graph_v2 = function(data)
{
  for (i in 1:ncol(data))
  {
    if(is.numeric(data[,i]))
    {
      par(mfrow = c(2,1))
      
      png(paste(names(data)[i],".png", sep = ""))
      
      boxplot(data[,i], main = paste("Boxplot of",names(data)[i]), 
              xlab = names(data)[i], horizontal = T, col = 'gold')
      
      hist(data[,i], main = paste("Histogram of",names(data)[i]), 
           xlab = names(data)[i], col = 'gold', border = F)
      
      dev.off()
    }
    
    else if(is.factor(data[,i]))
    {
      par(mfrow = c(1,1))
      
      png(paste(names(data)[i],".png", sep = ""))
      barplot(table(data[,i]),xlab = names(data)[i],
              main = paste("Barplot of",names(data)[i]), 
              col = 'gold', border = F)
      
      dev.off()
    }
  }
  
}

Graph_v2(mtcars)  #w/o categorical
Graph_v2(data)    #with categorical
