###===================================================================================================###
###                                     Introduction to R                                          ###
###                                         MODULE 1                                          ###
###                                    [DATA AND VECTORS]                                             ###                
###===================================================================================================###
#1. READING THE CARS.CSV DATA IN R
#=======================================================================================================

getwd()                                 #get the working directory
setwd("working directory path")  #set the working directory
cars = read.csv("cars.csv")             #read the data


#========================================================================================================
#2. SOME INITIAL STEPS WITH DATA
#========================================================================================================
#A. Checking the dimension of the data
dim(cars)

#B. Number of rows of the data
nrow(cars)

#C. Number of columns of the data
ncol(cars)

#D. Studying the Structure of the data
str(cars)

#E. Printing first and last few lines of a data
head(cars, 4)
tail(cars)
#F. Viewing the entire data
View(cars)


#========================================================================================================
#3. INTRODUCTION TO VECTORS
#========================================================================================================

v <- 5 #assignment symbol
v+1


#A. Defining a vector

x <- c(12,34,24,45,7,18) # c stands for combine
x

#B. Generating regular sequences - The colon [:] operator
1:20
20:1

#C. Generating regular sequences - The seq() function
seq(0,20,5)
seq(0,5,length.out = 100)
?seq()
seq(0,1, length.out=1000)
#D. Renerating simple random sample
set.seed(0)
sample(1:30, 10)
?sample
sample(x=1:30, size=10, replace=T)     # with replacement
sample(0:1, 20, replace=T, prob=c(0.2,0.8))

#========================================================================================================
#4. SOME USEFUL FUNCTIONS
#========================================================================================================

#A. sum()
sum(x)

#B. mean(), median(), sd(), var()
mean(x)
median(x)
sd(x)
var(x)
#C. max(), min()
max(x)
min(x)
#D. quantile()
quantile(x, 0.70)

#E. length()
length(x)

#F. summary
summary(x)



#========================================================================================================
#5. VECTOR SUBSETTING
#========================================================================================================
x

# getting 3rd element
x[3]

# getting the first 3 elements
x[1:3]

# getting 1st, 3rd and 4th elements
x[c(1,3,4)]



#The conditional operators

# > is greater than
# < is less than
# == is equal to
# <= is less than or equal to
# >= is greater than or equal to

v > 20

x
x > 20
x == 24


#and - &
#or - |

(x>30 | x<10)
(x<30 & x >10)


#PROBLEM:
#Consider the following two vectors

x <- c(33,45,23,67,54,48)
y <- c(108,151,164,119,135,122)

x
y


#Write a R code to find the folowing solutions
# a. Vaues of x that are less than 35
x[x < 35]



# b. The number of observations in y that are more than 150
y[y>150]
length(y[y>150])
sum(y>150)

# c. The number of observations in y that are between 120 and 165
y[(y>=120 & y<=165)]
length(y[(y>=120 & y<=165)])
sum(y>120 & y<165)

# d. The vaues in x that are less than 30 or greater than 50
x[(x<30 | x>50)]


# e. The values in x for which the values in y is less than or equal to 120
x[y<=120]



# f. The values in y for which the values in x is equal to 45
y[x==45]



#========================================================================================================
#6. VECTORS IN DATA
#========================================================================================================

#Note that in a data set each rows or columns is nothing but a vector
#A variable in data can be extracted as follows:

cars$MPG

cars$Weight

cars$Car[5]

cars$MPG[cars$Car == 'Dodge Rampage']






#PROBLEM (Reference: cars.csv)

# a. Which car has the highest mpg?
cars$Car[max(cars$MPG)]
cars$Car[cars$MPG == max(cars$MPG)]
max(cars$MPG)
cars$Car[46]
# b. Which car is the heaviest?
cars$Car[cars$Weight == max(cars$Weight)]


# c. Which car is the lightest?
cars$Car[cars$Weight == min(cars$Weight)]


# d. Which car has the highest value of the horsepower?
cars$Car[cars$Horsepower == max(cars$Horsepower)]


# e. What is the lowest value of the horsepower?
min(cars$Horsepower)


# f. What is the highest values of the mpg?
max(cars$MPG)


# g. List the top 10 percentile values of mpg.
cars$MPG[cars$MPG >= quantile(cars$MPG, 0.90)]
quantile(cars$MPG, seq(0.9, 0.99, 0.01))


# h. List the name of cars which has mileage between 25 and 35 mpg.
cars$Car[(cars$MPG>25 & cars$MPG<35)]


# i. What is the average weight of the cars which has 8 cylinders?
mean(cars$Weight[cars$Cylinders==8])


# j. What is the average weight of the cars that are originated in Japan?
mean(cars$Weight[cars$Origin=="Japan"])


# k. Randomly select 20 cars from the given list of cars.
sample(cars$Car, 20)












