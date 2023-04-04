###===================================================================================================###
###                                     INTRODUCTION TO R                                           ###
###                                         MODULE 5                                         ###
###                                      [DATA CLEANING]                                              ###                
###===================================================================================================###
#1. Handling variables with missing values
#=======================================================================================================

data <- c(88, 95,	85,	NA,	76,	69,	78,	NA,	70,	68)
data


#A.Using the data given above calculate,
#a.	The mean of the data.

mean(data)

#b.	The median of the data.

median(data)

#c.	The SD of the data.

sd(data)

#B. The is.na() function
#is.na()--> [Logical] Is the value an NA? -> TRUE or FALSE

is.na(data)

#subset the data that contains only the missing values
data[is.na(data)]

#subset the data that contains the non-missing values
data[!is.na(data)]



#=======================================================================================================
#2. SIMPLE IMPUTATION
#=======================================================================================================

data1 = data

#A.	Impute the missing value by mean.
data1[is.na(data1)] = mean(data1[!is.na(data1)])
data1

#B.	Impute the missing value by median.

data1[is.na(data1)] = median(data1[!is.na(data1)])
data1

#=======================================================================================================
#3. COMPLETE CASE ANALYSIS
#=======================================================================================================

fram <- read.csv("datasets/framingham.csv")
complete.cases(fram)

View(fram)
dim(fram)
str(fram)
summary(fram)

complete_fram = fram[complete.cases(fram), ]
dim(complete_fram)
View(complete_fram)
complete.cases(complete_fram)


is.na(fram[!complete.cases(fram),])
a = (dim(fram)[1]-dim(complete_fram)[1])*16
b = sum(is.na(fram[!complete.cases(fram),]))

total = a-b
total

na = a - total
na

dim(fram)-dim(complete_fram)

sum(!is.na(fram[!complete.cases(fram),]))
(dim(fram) - dim(complete_fram))[1]*16 - sum(is.na(fram))

#=======================================================================================================
#4. IMPUTATION FOR CATEGORICAL VARIABLES
#=======================================================================================================

#A. MODE IMPUTATION
# Mode is the value with the highest frequency
# Mode imputation --> replacing the missing values by mode

#Consider the variable education
mode(fram$currentSmoker)
fram$education[is.na(fram$education)] = 1


#B. KNN IMPUTATION

install.packages("VIM", repos = "http://cran.us.r-project.org")
library(VIM)

?kNN()
fram.impute = kNN(fram, variable = "education", k=10)
View(fram.impute)
kNN2 = kNN(fram, variable = c("education", "totChol"), k=10)
kNN3 = kNN(fram, k=10)
#NOTE: KNN IMPUTATION CAN ALSO IMPUTE NUMERICAL VARIABLES

#=======================================================================================================
#7. OUTLIERS - OUTLIERS IDENTIFICATION
#=======================================================================================================

p <- c(sample(60:100, 20),15,23,150,168)

#A. Through boxplots
boxplot(p)


#B. By specifying benchmarks
#most common benchmarks are (Q1 - 1.5*IQR, Q3 + 1.5*IQR) OR (mean - 2*SD, mean + 2*SD)

LB = quantile(p, 0.25) - 1.5*IQR(p)
UB = quantile(p, 0.75) + 1.5*IQR(p)

#NOTE: anything below LB is outlier & anything above the UB is an outlier
p[p<LB]
p[p>UB]

#=======================================================================================================
#8. OUTLIER TREATMENTS - TRIMMING
#=======================================================================================================

a = p[p>LB & p<UB]
boxplot(a)


#=======================================================================================================
#8. WINSORIZATION
#=======================================================================================================

#Replacing the outliers by some nearby values
#We can replace the outliers by the UB or the LB (whichever is nearer)



#STEP 1 - any values above UB should be replaced by UB
p[p>UB] = UB
p

#STEP 2 - any values bolow LB should be replaced by LB
p[p<LB] = LB
p


#=======================================================================================================
#9. VARIABLE TRANSFORMATION
#=======================================================================================================
#SOMETIME TAKING LOG OR SQRT TRANSFORMATION HELPS

q <- c(sample(60:100, 20),15,23,150,168)
log(q)
sqrt(q)

boxplot(q)
boxplot(log(q))
boxplot(sqrt(q))



#=======================================================================================================
#10. WORKING ON THE FRAMINGHAM DATA
#=======================================================================================================

fram <- read.csv("framingham.csv")


summary(fram$BMI)

knn_bmi = kNN(fram, variable = "BMI", k=10)
View(knn_bmi)
sum(is.na(knn_bmi$BMI))

#STEP 1 - Identify the presence of outliers
boxplot(knn_bmi$BMI)


#STEP 2 - Specify the benchmarks
LB = quantile(knn_bmi$BMI, 0.25) - 1.5*IQR(knn_bmi$BMI)
UB = quantile(knn_bmi$BMI, 0.75) + 1.5*IQR(knn_bmi$BMI)

hard_LB = quantile(knn_bmi$BMI, 0.25) - 2.5*IQR(knn_bmi$BMI)
hard_UB = quantile(knn_bmi$BMI, 0.75) + 2.5*IQR(knn_bmi$BMI)

#STEP 3 - Count the number of outliers
outliers = knn_bmi$BMI[knn_bmi$BMI < LB | knn_bmi$BMI > UB]
length(outliers)

hard_outliers = knn_bmi$BMI[knn_bmi$BMI < hard_LB | knn_bmi$BMI > hard_UB]
length(hard_outliers)

#STEP 4 - Take log/sqrt tranformation & check if the number of outliers is reduced
boxplot(log(knn_bmi$BMI))

log_LB = quantile(log(knn_bmi$BMI), 0.25) - 1.5*IQR(log(knn_bmi$BMI))
log_UB = quantile(log(knn_bmi$BMI), 0.75) + 1.5*IQR(log(knn_bmi$BMI))

log_hard_LB = quantile(log(knn_bmi$BMI), 0.25) - 2.5*IQR(log(knn_bmi$BMI))
log_hard_UB = quantile(log(knn_bmi$BMI), 0.75) + 2.5*IQR(log(knn_bmi$BMI))

log_outliers = log(knn_bmi$BMI)[log(knn_bmi$BMI) < log_LB | log(knn_bmi$BMI) > log_UB]
length(log_outliers)

log_hard_outliers = log(knn_bmi$BMI)[log(knn_bmi$BMI) < log_hard_LB | log(knn_bmi$BMI) > log_hard_UB]
length(log_hard_outliers)

#SQRT
boxplot(sqrt(knn_bmi$BMI))

sqrt_LB = quantile(sqrt(knn_bmi$BMI), 0.25) - 1.5*IQR(sqrt(knn_bmi$BMI))
sqrt_UB = quantile(sqrt(knn_bmi$BMI), 0.75) + 1.5*IQR(sqrt(knn_bmi$BMI))

sqrt_hard_LB = quantile(sqrt(knn_bmi$BMI), 0.25) - 2.5*IQR(sqrt(knn_bmi$BMI))
sqrt_hard_UB = quantile(sqrt(knn_bmi$BMI), 0.75) + 2.5*IQR(sqrt(knn_bmi$BMI))

sqrt_outliers = sqrt(knn_bmi$BMI)[sqrt(knn_bmi$BMI) < sqrt_LB | sqrt(knn_bmi$BMI) > sqrt_UB]
length(sqrt_outliers)

sqrt_hard_outliers = sqrt(knn_bmi$BMI)[sqrt(knn_bmi$BMI) < sqrt_hard_LB | sqrt(knn_bmi$BMI) > sqrt_hard_UB]
length(sqrt_hard_outliers)

#STEP 5 - Apply the winsorizing technique to correct the outliers
#if the log & sqrt transformation is not making any difference then we will use the original
#variable and winsorize the outliers


knn_bmi$BMI[knn_bmi$BMI < LB] = LB
knn_bmi$BMI[knn_bmi$BMI > UB] = UB

boxplot(knn_bmi$BMI)





#######################################################################################


a = IQR(fram$totChol, na.rm = T)
b = quantile(fram$totChol, 0.75, na.rm = T)
total = b + 2.5*a
total

fram$totChol[fram$totChol > total]
