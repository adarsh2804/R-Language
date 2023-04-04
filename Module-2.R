###===================================================================================================###
###                                     INTRODUCTION TO R                                           ###
###                                         MODULE 2                                         ###
###                                    [DATA AND MATRIX]                                              ###                
###===================================================================================================###
#1. INTRODUCTION TO MATRIX
#=======================================================================================================

#Consider the following two vectors

x <- c(33,45,23,67,54,48)
y <- c(108,151,164,119,135,122)


#A. The cbind() function
cbind(x,y)

#B. The rbind() function
rbind(x,y)


#C. The matrix() function
matrix(c(1,2,3,4,5,6), nrow=3, ncol=2, byrow=T)
matrix(c(1,2,3,4,5,6), nrow=3, ncol=2, byrow=F)

cbind(c(1,2,3), c(4,5,6))
rbind(c(1,4), c(2,5), c(3,6))

  #=======================================================================================================
#2. MATRIX AND DATA FRAME
#=======================================================================================================

#A Limitation of Matrix and Vector is that it can store only one type of data

  #Consider another vector
z <- c("P","T","M","K","H","R")
cbind(x,y)
cbind(x,y,z)


#PROBLEM
#Constructing the following data

### X1	X2	X3	Age	Gender
### 27	40	A	  23	Male
### 39	20	A	  22	Female
### 22	24	B	  50	Female
### 33	32	C	  38	Male
### 30	32	B	  22	Male
### 44	31	B	  43	Male
### 41	22	C	  37	Female
### 35	28	A	  45	Male
### 44	20	C	  20	Female
### 21	46	B	  36	Male


data.frame(x,y,z)


#=======================================================================================================
#3. MATRIX SUBSETTING
#=======================================================================================================

#PROBLEM

#Consider the following matrix: 
### 38	33	47
### 29	48	35
### 21	34	47
### 38	44	21
### 28	26	43


#a)	Generate the above matrix in R and store it in an object.
mat <- matrix(c(38,33,47,
                29,48,35,
                21,34,47,
                38,44,21,
                28,26,43), nrow=5, ncol=3, byrow=T)

mat

#b) Check the dimenison of the matrix
dim(mat)
dim(mat)[1]

#c)	Print the first element of the matrix.
mat[1,1]


#d)	Print the last element of the matrix.
mat[nrow(mat), ncol(mat)]


#e)	Print the values of the first row.
mat[1, ]
mat[1, c(1,3)]

#f)	Print the values of the fourth row.
mat[4, ]


#g)	Print the values first column.
mat[ ,1]


#h)	Calculate the total of the third row.
sum(mat[3, ])


#i)	Calculate the total of the fifth row.
sum(mat[5, ])


#j)	Calculate the total of the second column.
sum(mat[ , 2])


#k)	Calculate the average of the values of the first row.
mean(mat[1, ])


#l)	Replace the first value of the matrix by 50.
mat[1,1] = 50
mat

#m)	Replace the last value of the matrix by 30.
mat[nrow(mat), ncol(mat)] = 30
mat

#n)	Replace the first column of the matrix by the vector (20,30,20,30,20)
mat[,1] = c(20,30,20,30,20)
mat

#o)	Replace the first row of the matrix by its average.
mat[1,] = mean(mat[1,])
mat


#p)	Print all the values corresponding to 4th & 5th rows and 2nd & 3rd column.
mat[c(4,5), c(2,3)]



#q)	Replace the matrix obtained above by the matrix
### 38	31
### 20	20

mat[c(4,5), c(2,3)] = matrix(c(38,31,20,20), nrow=2, ncol = 2, byrow=T)
mat
# mat[c(4,5), c(2,3)] = matrix(c(38,20,31,20), 2, 2)

#=======================================================================================================
#3. DATA SUBSETTING - INFORMATION RETRIEVAL
#=======================================================================================================

##A. Extracting an extract from the data

#PROBLEM (Reference: cars.csv data)

cars <- read.csv("datasets/cars.csv")
View(cars)


# a) Extract the information of the first 5 rows and firt 5 columns of the data
cars[1:5,1:5]


# b) Extract the information of 20th-29th rows
cars[20:29, ]


# c) Extract the information of only the columns MPG, Cylinders and Weight
cars[, c(2,3,6)]
cars[1:5, c("MPG", "Cylinders", "Weight")]

# d) Extract a random sample from the data (SRSWOR)
sample(1:406, 10)
cars[sample(1:406, 10),]


##B. Conditional Subsetting

#PROBLEM (Reference: cars.csv)

# a) Extract all the information of the cars which has MPG more than 40
cars[cars$MPG > 40, ]
cars[cars$MPG > 40, c("MPG", "Weight")]


# b) Extract the information of the car/s which has only 3 cylinders
cars[cars$Cylinders == 3, ]


# c) Extract the information of all the cars originated in Europe and has 
# Acceleration more than 20
cars[cars$Origin == "Europe" & cars$Acceleration > 20, ]


# d) Name the cars which has MPG more than 40 and Acceleration less than 20 or
# the car has three cylinders
cars$Car[cars$MPG>40 & cars$Acceleration<20 | cars$Cylinders==3]
# cars[cars$MPG>40 & cars$Acceleration<20 | cars$Cylinders==3, c("Car")]


#=======================================================================================================
#4. MORE ON INFORMATION RETRIEVAL
#=======================================================================================================

# Using the subet() function
?subset()
#PROBLEM (Reference: cars.csv)

# a) Extract all the information of the cars which has MPG more than 40
#cars[cars$MPG > 40, ]
subset(cars, MPG>40)
  
subset(cars, MPG>40, select = c(Origin, Weight, MPG))

cars[cars$MPG>40, 1:5]
subset(cars, MPG>40, select = 1:5)
subset(cars, MPG>40, select = Car:Horsepower)

# b) Extract the information of the car/s which has only 3 cylinders
#cars[cars$Cylinders==3, ]
subset(cars, Cylinders==3)

# c) Extract the information of all the cars originated in Europe and has Acceleration more than 20
#cars[cars$Acceleration>20 & cars$Origin == "Europe", ]
subset(cars, Acceleration>20 & Origin=="Europe")

# d) Name the cars which has MPG more than 40 and Acceleration less than 20 or the car has three cylinders
#cars$Car[cars$MPG>40 & cars$Acceleration<20 | cars$Cylinders==3]
subset(cars, MPG>40 & Acceleration<20 | Cylinders==3, select=Car, drop=FALSE)

subset(cars, MPG>40 & Acceleration<20 | Cylinders==3, select=-Car, drop=TRUE)
subset(cars, MPG>40 & Acceleration<20 | Cylinders==3, select=-c(Car,Origin))

