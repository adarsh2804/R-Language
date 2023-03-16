###===================================================================================================###
###                                    INTRODUCTION TO R                                          ###
###                                        MODULE 3                                                  ###
###                                 [DESCRIPTIVE ANALYTICS]                                           ###                
###===================================================================================================###
#1. SUMMARIES AND STATISTICS
#=======================================================================================================

cars <- read.csv("cars.csv")

str(cars)

cars$Car = as.factor(cars$Car)
cars$Origin = as.factor(cars$Origin)
summary(cars)

#A. The summary() function
summary(cars$MPG)
summary(cars$Origin)
summary(cars)
mean(cars$Weight)

#B. The by() / tapply() function
?by
by(cars$Weight, cars$Origin, FUN=mean)
by(cars$Weight, cars$Origin, FUN=median)
by(cars$Weight, cars$Origin, FUN=sd)
by(cars$Weight, cars$Origin, FUN=summary)
by(cars$Weight, cars$Origin, FUN=mean)

by(cars$Weight, cars$Origin, FUN=mean)/by(cars$Weight, cars$Origin, FUN=sd)


tapply(cars$Weight, cars$Origin, FUN=mean)
tapply(cars$Weight, list(cars$Origin, cars$Cylinders), FUN=mean)



#=======================================================================================================
#2. TABLES
#=======================================================================================================
table(cars$Origin)

prop.table(table(cars$Origin))

table(cars$Origin, cars$Cylinders)


#P(Origin & Cylinders)
prop.table(table(cars$Origin, cars$Cylinders))

#P(Cylinders | Origin)
prop.table(table(cars$Origin, cars$Cylinders), 1)


#P(Origin | Cylinders)
prop.table(table(cars$Origin, cars$Cylinders), 2)



#=======================================================================================================
#3. HISTOGRAMS
#=======================================================================================================
hist(cars$MPG)

hist(cars$MPG,
     xlab = "Miler Per Gallon",
     ylab = "Number of Cars",
     main = "Histogram of MPG",
     col = "lightblue",
     border = "black")

hist(cars$Acceleration,
     xlab = "Acceleration",
     ylab = "Number of Cars",
     main = "Histogram of Acceleration",
     col = "lightblue",
     border = "black")

hist(cars$Weight,
     xlab = "Weight",
     ylab = "Number of Cars",
     main = "Histogram of Weight",
     col = "lightblue",
     border = "black")

hist(cars$Cylinders,
     xlab = "Cylinders",
     ylab = "Number of Cars",
     main = "Histogram of Cylinders",
     col = "lightblue",
     border = "black")

hist(cars$Horsepower,
     xlab = "Horsepower",
     ylab = "Number of Cars",
     main = "Histogram of Horsepower",
     col = "lightblue",
     border = "black")

#=======================================================================================================
#4. BOXPLOTS
#=======================================================================================================

boxplot(cars$MPG)

boxplot(cars$MPG, horizontal = T)

boxplot(cars$MPG,
        xlab = "Miler Per Gallon",
        main = "Boxplot of MPG",
        col = "lightblue",
        border = "black")

boxplot(cars$MPG, horizontal = T,
        xlab = "Miler Per Gallon",
        main = "Boxplot of MPG",
        col = "lightblue",
        border = "black")

boxplot(cars$MPG ~ cars$Origin)
boxplot(cars$MPG ~ cars$Origin, horizontal = T)
boxplot(cars$MPG ~ cars$Cylinders, horizontal = F)

#=======================================================================================================
#5. BAR CHARTS
#=======================================================================================================
barplot(table(cars$Origin))
barplot(prop.table(table(cars$Origin)))

barplot(table(cars$Origin),col = "blue")
#=======================================================================================================
#6. SCATTERPLOTS AND PAIRWISE SCATTERPLOTS
#=======================================================================================================
 
plot(cars$Weight,cars$MPG)

#Pairwise scatter plot 
plot (cars[2:7]) #Extract col numbers 2-7 from the data cars.

#Correlation between two variables
cor(cars$Weight,cars$MPG)

#Correlation matrix
round (cor(cars[2:7]),3)

?hist
