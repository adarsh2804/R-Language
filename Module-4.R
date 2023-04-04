###===================================================================================================###
###                                      INTRODUCTION TO R                                           ###
###                                          MODULE 4                                           ###
###                                    [DATA MANIPULATION]                                            ###                
###===================================================================================================###
#1. The class() function
#=======================================================================================================

cars <- read.csv("datasets/cars.csv")

?class
x <- '5'
class(x)

x <- c(1,2,3)
class(x)

is.vector(x)
is.matrix(x)
is.data.frame(x)
is.data.frame(cars)

#=======================================================================================================
#2. Class conversion
#=======================================================================================================

x <- '5.0'
class(x)
as.integer(x)
as.numeric(x)

x <- as.integer(x)
x

#=======================================================================================================
#3. Sort & Order
#=======================================================================================================

#A. Sort the variable Acceleration in ascending order

?sort
sort(cars$Acceleration)
sort(cars$Acceleration, decreasing = T)

#B. Sort the variable Weight in Decsending Order

sort(cars$Weight, decreasing = T)


#C. Sort the data by MPG in increasing order

sort(cars$MPG)


#D. Sort the data by MPG in increasing order and then sort by Oigin

?order
cars$MPG

order(cars$MPG) # Returns index of the vector MPG when the vector is sorted in ascending order

cars_sort_MPG = cars[order(cars$MPG), ] # Rearrangement of row index
View(cars_sort_MPG)

order(-cars$MPG)
order(cars$MPG, decreasing = T)


# Multiple Sorting
#1. Sorting by origin and MPG

cars_sort_1 = cars[order(cars$Origin, cars$MPG), ]
View(cars_sort_1)

#2. Sorting by origin and then decreasing MPG

cars_sort_1 = cars[order(cars$Origin, -cars$MPG), ]
View(cars_sort_1)


#E. Sort the data by Cylinders and then by MPG

cars_sort_2 = cars[order(cars$Cylinders, cars$MPG), ]
View(cars_sort_2)


#F. Sort the data by MPG in ascending order and by cylinder in descending order

cars_sort_2 = cars[order(cars$MPG, -cars$Cylinders), ]
View(cars_sort_2)



#=======================================================================================================
#4. Data Transformation
#=======================================================================================================

# Plot a scatter plot between MPG and weight. Comment of the linearity.

plot(cars$Weight, cars$MPG)


# Re-plot the scatter plot by taking the log transformation of both the variables. Does the linearity 
# Improve?

plot(log(cars$Weight), log(cars$MPG))


# But there is a problem! Check the summary of log(MPG). What do you observe?

summary(log(cars$MPG))


# Can you identify where we got misleaded? Probably the answer lies in the summary of MPG.

summary(cars$MPG)


# How can we correct this?

plot(log(cars$Weight), log(cars$MPG+1))


# Study the association between MPG and Horsepower.

plot(cars$Horsepower, cars$MPG)
plot(log(cars$Horsepower), log(cars$MPG))
summary(log(cars$Horsepower))

plot(log(cars$Horsepower+1), log(cars$MPG+1))

#=======================================================================================================
#5. The ifelse() function
#=======================================================================================================

# PROBLEM 1:
# Create a variable HP which will take only two values:
# IF Horsepower < 100 THEN "Low HP"
# IF Horsepower >= 100 THEN "High HP"

cars$HP = ifelse(cars$Horsepower < 100, "Low HP", "High HP")
View(cars)
class(cars$HP)
cars$HP = as.factor(cars$HP)


#PROBLEM 2:
# Create a Variable MPG_Rate which will take on the values as follows:
# IF MPG < 15 THEN "Normal"
# IF MPG >= 15 AND MPG <=25 THEN "GOOD"
# IF MPG >= 25 AND MPG <=35 THEN "GREAT"
# IF MPG >= 35 THEN "AWESOME"

cars$MPG_Rate = ifelse(cars$MPG < 15, "Normal", ifelse(cars$MPG >= 15 & cars$MPG < 25, "Good", ifelse(cars$MPG >= 25 & cars$MPG <= 35, "Great", "Awesome")))
cars$MPG_Rate
View(cars)
class(cars$MPG_Rate)
cars$MPG_Rate = as.factor(cars$MPG_Rate)


#=======================================================================================================
#6. SQL in R
#=======================================================================================================

install.packages("sqldf", repos = "http://cran.us.r-project.org")
require(sqldf)

sqldf('SELECT * from mtcars')
sqldf('select mpg from mtcars')
sqldf('select mpg, wt from mtcars')
sqldf('select mpg, wt from mtcars order by mpg')
sqldf('select mpg, wt from mtcars order by mpg')
sqldf('select am, avg(mpg) as avg_mpg from mtcars group by am')
sqldf('select am, avg(mpg) as avg_mpg from mtcars group by am')
sqldf('select am, avg(mpg), stdev(mpg) from mtcars group by am')

mtcars

