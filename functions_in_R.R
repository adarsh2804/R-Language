#==========================================================================================
# EFFICIENT WAYs TO PROGRAM IN R:
# Introducing Loops, Functions and Conditions.
#==========================================================================================
#==========================================================================================
# INTRODUCTION
#==========================================================================================

#Do you imagine how lengthy the process of exploration might become especially when you
#are dealing with data sets that contains a large number of variables! I hope you have already 
#started experiencing the tidious process. In this session, I will take you through some ideas
#that will help you designing some frameworks that will help you reduce your everyday work 
#to a considerable extent and save hours and hours of your time. You will learn to create 
#what is called user-defined functions that will help you automate a large and tidious process.


#==========================================================================================
# OBJECTIVE
#==========================================================================================

#Think how you start your data exploration process everytime you get your data. You are 
#required to generate histigrams and boxplots for all the numerical variables, bar charts
#and maybe pie charts for all the categorical variables...This is what the first step in
#data exploration is - Explore one variables at a time. In this session our objective
#is to develop a framawork that can automate this enormous process.


#==========================================================================================
# INTRODUCING LOOPS          
#==========================================================================================


#SUPPOSE that you need to print Happy Birthday 5 times.
#Option 1
print("Happy Birthday")
print("Happy Birthday")
print("Happy Birthday")
print("Happy Birthday")
print("Happy Birthday")


#NOTE that you have just repeated a single step 5 times!!
#instead can you let the machine do it for you? Yes, you can....
#And here comes the introduction to LOOPs! [Here we are going to investigate only for loops]
#Alternate Option - Option 2:

for(i in 1:5)   #Note i is an element in the vector c(1,2,3,4,5)
{
  print("Happy Birthday")
}




#HOW DOES THE ABOVE CODE WORK? Well, The loop runs exactly the number of times which is equal to the
#length of the vector, i.e. 5 times..and for each time the loop runs it performs the task
#that is formulated inside the loop..Precisely speaking, the above loop runs 5 times 
#[Note: length(1:5) is 5] and every time it runs it prints "Happy Birthday"...as a result
#"Happy Birthday" is printed 5 times.


#TEST YOUR UNDERSTANDING 1:
#What do you think the following code will Output?

x <- c(3,5,2,7,8)
for(i in 1:length(x))
{
  print(x[i])
}  


#NOW THINK how this code works?
#Well, what do you think the following code will output?

for(i in x)
{
  print(i)
}


#What do you think is the difference between the above two codes?
#In the former code we are using i as an index of vector x at each loop. In the later 
#code we are using i as an element of vector x.


#=====================================================================================
# THE paste() FUNCTION
#=====================================================================================

#Paste function enables us to concatenate two strings
#FOR EXAMPLE: consider the following two strings:
#"Happy Birthday" and "Joe"
#Paste function will enable us to concatenate these two strings into a single string

paste("Happy Birthday", "Joe")


#Instead of the string itself it can also take objects in it. For example, let

a <- "apple"
p <- "pie"

paste(a,p)

#The paste() function has an additional argument "sep" which enables you to specify
#the separator (delimiter). For example,

paste(a,p, sep="") #will give no space between the string
paste(a,p, sep="-") #Will separate the strings by a hyphen

#By default the delimiter is space (" ").


#TEST YOUR UNDERSTANDING 2:
#What do you think the following code will output?

for(i in c("Joe", "Phoebe", "Dominic"))
{
  print(paste("Happy Birthday", i))
}



#=====================================================================================
# SOME BASIC REVISION 
#=====================================================================================

install.packages("MASS")
library(MASS)

data("Boston")
View(Boston)
?Boston

nrow(Boston)
ncol(Boston)
names(Boston)

Boston[,1]       #First column
mean(Boston[,1]) #mean of the first columns


#TEST YOUR UNDERSTANDING 3A:
#What do you think the following code will output?

for(i in 1:ncol(Boston))
{
  print(mean(Boston[,i]))
}


for(i in 1:ncol(Boston))
{
  print(paste(names(Boston)[i],":", mean(Boston[,i])))
}




for(i in 1:ncol(Boston))
{
  print(paste(names(Boston)[i], ":", round(mean(Boston[,i]),3)))
}



#TEST YOUR UNDERSTANDING 3B:
#What do you think the following code will output?

for(i in names(Boston))
{
  print(paste(i, ":", round(mean(Boston[,i]),3)))
}


#BASED ON YOUR UNDERSTANDING, figure out the difference between the two codes.



#NOW let us improve our output a little bit!
#The output does not have any names to it. It is not quick enough to figure out 
#that the value 6.28 is the mean of the variable 'chas'
#Let us store our result in a vector and give it names

avg <- numeric() #This creates a blank numeric vector
avg <- c()

for(i in 1:ncol(Boston))
{
  avg[i] <- mean(Boston[,i])
}

avg

avg[11]

names(avg) <- names(Boston)
avg[1]
avg["crim"]


x <- c(3,5,7)
names(x) <- c("A", "B", "C")

names(avg) <- names(Boston)
avg


#TEST YOUR UNDERSTANDING 4:
#What do you think the following code will output?
as.matrix(avg)
View(as.matrix(avg))
class(avg)

avg <- as.matrix(avg)
colnames(avg) <- "Mean"
View(avg)
dim(avg)
rownames(avg)

avg["age",] #The comma is compulsory

#=====================================================================================
# PLOTS
#=====================================================================================

#Histogram
hist(Boston$nox)
hist(Boston$nox, main = "Histogram of NOX", 
     xlab = "NOX", col = "skyblue2")


#TEST YOUR UNDERSTANDING 5:
#Can you plot the histogram of the 9th variable in the data set?
hist(Boston[,9])


hist(Boston[,9], main = paste("Histogram of", names(Boston)[9]), 
     xlab = names(Boston)[9], 
     col = "skyblue2")



#TEST YOUR UNDERSTANDING 6:
#What will the following code output?

for(i in 1:ncol(Boston))
{
  hist(Boston[,i])
}


#TEST YOUR UNDERSTANDING 7:
#What will the following code output?

for(i in 1:ncol(Boston))
{
  hist(Boston[,i], main = paste("Histogram of", names(Boston)[i]), 
       xlab = names(Boston)[i], ylab = "No. of Houses", col="Orange")
}



par(mfrow=c(1,2))
hist(Boston$crim)
boxplot(Boston$crim)





par(mfrow=c(2,1))
boxplot(Boston$crim, horizontal = T)
hist(Boston$crim)





#TEST YOUR UNDERSTANDING 8:
#What will the following code output?

for(i in 1:ncol(Boston))
{
  hist(Boston[,i], main = paste("Histogram of", names(Boston)[i]), 
       xlab = names(Boston)[i], ylab = "No. of Houses", col = "lightgreen", border=F)
}



par(mfrow=c(2,1))
boxplot(Boston$crim, horizontal = T)
hist(Boston$crim)

#TEST YOUR UNDERSTANDING 9:
#What will the following code output?

par(mfrow=c(2,1))
for(i in 1:ncol(Boston))
{
  
  boxplot(Boston[,i], main = paste("Boxplot of", 
          names(Boston)[i]), 
          col = "maroon", border = "grey5",
          horizontal = T)
  
  hist(Boston[,i], main = paste("Histogram of",
       names(Boston)[i]), 
       xlab = names(Boston)[i], ylab = "No. of Houses", col = "lightgreen", border=F)
  
}




#=====================================================================================
# EXPORTING THE PLOT
#=====================================================================================

par(mfrow=c(1,1))

#The histogram which I would like to save
hist(Boston$nox, main = "Histogram of NOX", xlab = "NOX", 
     col = "skyblue2")


setwd("C:\\Users\\Gourab\\Desktop\\R")
getwd()


png("Histogram - NOX.png")
hist(Boston$nox, main = "Histogram of NOX", xlab = "NOX", col = "skyblue2")
dev.off()



#TEST YOUR UNDERSTANDING 10:
#What would you expect the following code to output?

for(i in 1:ncol(Boston))
{
  png(paste(names(Boston)[i], ".png", sep="")) #NOTE this step
  
  par(mfrow=c(2,1))
  boxplot(Boston[,i], main = paste("Boxplot of", names(Boston)[i]), 
          ylab = names(Boston)[i], col = "maroon", border = "grey5", horizontal = T)
  
  hist(Boston[,i], main = paste("Histogram of", names(Boston)[i]), 
       xlab = names(Boston)[i], ylab = "No. of Houses", col = "orange", border=F)
  
  dev.off()  #NOTE this step
  
}



paste(names(Boston)[2], ".png", sep="")
#====================================================================================
# INTRODUCING USER-DEFINED FUNCTION
#====================================================================================

#Suppose that you are require to prepare final bill by taking the bill value and
#adding 20% tax to it. Suppose that your bill value is 1220. How will you calculate the
#final bill? This way right...?

1220 + 1220*0.2


#Of course this is a way. But imagine that you have so many bills to prepare! And this
#has kind of become your regular work! Can you take a smart approach to make your work 
#easier and simpler? Here's where the knowledge of self defined function cones handy...


#Lets automate the process and make the task simpler.
#So what we are going to do is build a function that will take the bill value/s as argument
#and return you the final bill value after adding task.


#Python code
#def Bill(bill):
#  total = bill + bill*0.2
#  return(total)

#def function_name(argument(s)):
#  body of the function
#  return()


Bill <- function(bill)
{
  total <- bill + bill*0.2  #Body
  return(total)             #Return Statement
}


Bill(100)
Bill(1224)
Bill(c(100,1000))

c(100,1000)+c(100,1000)*0.2

#LET's unserstand what we did...

#1. Bill is the name of the function that we just defined
#2. function() defines that the object "Bill" is a function
#3. 'bill' inside function() is the defined argument that the function Bill accept. It
#   can be a numeric value or a vector.
#4. The body is where do our calculations. In the body we are calculating the total bill
#   value.
#5. return() statement specifies what we would like the function to return. In this case
#   we would like the function to return the total bill value.


Bill <- function(bill, tax=10)
{
  total <- bill + bill*tax/100  #Body
  return(total)             #Return Statement
}

Bill(100,20)
Bill(100)
Bill(100,30)


#TEST YOUR UNDERSTANDING 11:
#How do you think the following user defined function will function?

add <- function(a,b)
{
  x <- a + b
  return(x)
}

add(2,6)



#FUNCTION WITHOUT ANY ARGUMENT AND RETURN

hello <- function()
{
  print("Hello World")
}

hello()




#TEST YOUR UNDERSTANDING 12:
#How do you think the following code will work?

hello_frnd <- function(friend)
{
  print(paste("Hello", friend))
}

hello_frnd("Joe")


#TEST YOUR UNDERSTANDING 13:
#How do you think the following code will function?

par(mfrow=c(1,1))

graphs <- function(data)
{
  for(i in 1:ncol(data))
  {
    hist(data[,i], main=paste("Histogram of", names(data)[i]), xlab=names(data)[i])
  }
}



graphs(Boston)
graphs(mtcars)


#===========================================================================================
# CREATING A FUNCTION TO GENERATE GRAPHICS
#===========================================================================================

Graphs <- function(data)
{
  
  for(i in 1:ncol(data))
  {
    
    png(paste(names(data)[i], ".png", sep="")) #NOTE this step
    
    par(mfrow=c(2,1))
    
    boxplot(data[,i], main = paste("Boxplot of", names(data)[i]), 
            ylab = names(data)[i], col = "maroon", border = "grey5",
            horizontal = T)
    
    hist(data[,i], main = paste("Histogram of", names(data)[i]), 
         xlab = names(data)[i], ylab = "No. of Houses", col = "lightgreen", border=F)
    
    
    dev.off()  #NOTE this step
    
  }
}

Graphs(Boston)
Graphs(mtcars)

d = mtcars
View(mtcars)

d$am = as.factor(d$am)
d$vs = as.factor(d$vs)
str(d)
Graphs(d)


#==========================================================================================
#Introducing Conditioning Statements
#==========================================================================================

#Let x takes the value -5
x <- 5

#Let us create a condition such that if x is greater than 0 then pront "success"
if(x > 0)
{
  print("success")
}


#Creating the else condition
#i.e. creating another condition that if x !>0 then print "failure"

if (x < 0)
  print('success')
else
  print('failure')


{if(x > 0)
  {
    print("success")
  }
else
  {
    print("failure")
  }
}




#==========================================================================================
#FINE-TUNING THE Bill function
#==========================================================================================

#What do you tink will happen if we put a string inside the Bill function. For example,

Bill(100)
Bill("hunderd")

#It returns error...
#Let us use validation technique and return an error message

Bill <- function(bill, tax=10)
{
  if(!is.numeric(bill))
  {
    stop("The value entered must be numeric")
  }
  total <- bill + bill*tax/100
  return(total)
}

Bill("hundred")
Bill(100)


x
is.numeric(x)
!is.numeric(x)
is.factor(x)
is.character(x)

#===========================================================================================
#FINE-TUNING OUR GRAPH FUNCTION
#===========================================================================================

car <- mtcars
car$am <- as.factor(car$am)
car$vs <- as.factor(car$vs)
str(car)
Graphs(car)

Graphs(x)



Graphs <- function(data)
{
  if(!is.data.frame(data))
    stop("The given object is not a data frame")
  
  for(i in 1:ncol(data))
  {
    if(is.numeric(data[,i]))
    {
      
      png(paste(names(data)[i], ".png", sep="")) #NOTE this step
      
      par(mfrow=c(2,1))
      boxplot(data[,i], main = paste("Boxplot of", names(data)[i]), 
              ylab = names(data)[i], col = "maroon", border = "grey5",
              horizontal = T)
      
      hist(data[,i], main = paste("Histogram of", names(data)[i]), 
           xlab = names(data)[i], ylab = "No. of Houses", col = "lightgreen", border=F)
      

      
      dev.off()  #NOTE this step
      
    }
      
  }
}

Graphs(car)

x=c(1,2,3)
Graphs(x)


#...And our Graph function is kind of ready to use!
#Now you can put any data inside theis Graph() function and you will get the histogram
#and boxplot for every numeric variables present in that data on the same page in different
#png files.

Graphs(mtcars)




#==========================================================================================
# TRY SOME IMPROVISATIONs
#==========================================================================================

#SUGGESTION 1:
#Often we are not required the graphs for all the numeric variables. Try to improve the code
#by adding an additional parameter "variable" that can take a vector of variable index and 
#return the graphs for only those variables.
#
#Example: Graphs(Boston, var=c(1,3,4))
#Will generate the graphics for only the numerical variables among the variables 1,3 & 4
#in the data Boston

Graphs_1 <- function(data, variables)
{
  if(!is.data.frame(data))
    stop("The given object is not a data frame")
  
  for(i in variables)
  {
    if(is.numeric(data[,i]))
    {
      
      png(paste(names(data)[i], ".png", sep="")) #NOTE this step
      
      par(mfrow=c(2,1))
      boxplot(data[,i], main = paste("Boxplot of", names(data)[i]), 
              ylab = names(data)[i], col = "maroon", border = "grey5",
              horizontal = T)
      
      hist(data[,i], main = paste("Histogram of", names(data)[i]), 
           xlab = names(data)[i], ylab = "No. of Houses", col = "lightgreen", border=F)
      
      
      
      dev.off()  #NOTE this step
      
    }
    
  }
}

Graphs_1(mtcars, c(1,4,7))

#SUGGESTION 2:
#Improve the code in suggestion 1 such that if the argument variable is ignored then it will
#return the graphs of all the numeric variables in the data by default.

Graphs_2 <- function(data, variables=c(seq(1,ncol(data))))
{
  if(!is.data.frame(data))
    stop("The given object is not a data frame")
  
  for(i in variables)
  {
    if(is.numeric(data[,i]))
    {
      
      png(paste(names(data)[i], ".png", sep="")) #NOTE this step
      
      par(mfrow=c(2,1))
      boxplot(data[,i], main = paste("Boxplot of", names(data)[i]), 
              ylab = names(data)[i], col = "maroon", border = "grey5",
              horizontal = T)
      
      hist(data[,i], main = paste("Histogram of", names(data)[i]), 
           xlab = names(data)[i], ylab = "No. of Houses", col = "lightgreen", border=F)
      
      
      
      dev.off()  #NOTE this step
      
    }
    
  }
}
a = c(seq(1,5))
a
b = c(1,2,3,4,5)
b
Graphs_2(mtcars)

#SUGGESTION 3:
#We ignored the cateorical variables in our discussion. Make some improvement in your codes
#in suggestion 2 such that the function will take the argument "data" and "variable" and will
#return boxplots & histograms for the numerical variables and barplots and pie charts for
#the categorical variables.
#
#Example:
#Graphs(mtcars)
#will get the necessary graphics for all numeric variables and categorical variables in the
#data




#SUGGESTION 4:
#Probably you need not want to mess up your working directory with so many image files...
#Create an additional argument for the function "dir" (directory), such that the function
#exports all the files to your specified folder (which need not necessaryly be your working
#directory).
#
#Example:
#Graphs(Boston, Variable = c(1,3,4), dir = ".../Praxis/LearntSometingNew/Graphs")
#will generate the necessary graphics for the variables 1, 3 and 4 in the specified location
#in your system i.e. ".../Praxis/LearntSometingNew/Graphs"


Graphs_4 = function(data, variables = c(seq(1,ncol(data))), directory = getwd())
{
  if(!is.data.frame(data))
    stop("The given object is not a data frame")
  setwd(directory)
  for(i in variables)
  {
    if(is.numeric(data[,i]))
    {
      
      png(paste(names(data)[i], ".png", sep="")) #NOTE this step
      
      par(mfrow=c(2,1))
      boxplot(data[,i], main = paste("Boxplot of", names(data)[i]), 
              ylab = names(data)[i], col = "maroon", border = "grey5",
              horizontal = T)
      
      hist(data[,i], main = paste("Histogram of", names(data)[i]), 
           xlab = names(data)[i], ylab = "No. of Houses", col = "lightgreen", border=F)
      
      
      
      dev.off()  #NOTE this step
      
    }
    
  }
}
Graphs_4(mtcars)

#===========================================================================================
# NOW COMES BUT!!!
#===========================================================================================
#BUT DO WE HAVE TO RUN THIS FUNCTION AGAIN AND AGAIN WHENEVER WE TURN ON RSTUDIO?????




  
  
  
  
  
  