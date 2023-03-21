data = read.csv("cars.csv")


# 2-dimension case
data.2d = data[, c("Horsepower","Weight")]
dim(data.2d)
plot(data.2d, main="The main Data", pch=20, cex=0.8)
cor(data$Horsepower, data$Weight)

# variance of the data
apply(data.2d, 2, var)             # FUN=var(), 2=column, data.2d=dataframe
sum(apply(data.2d, 2, var))
sum(apply(data.2d, 2, sd))


# Normalizing the data (MEAN centered)
for (i in 1:ncol(data.2d))
{
  data.2d[, i] = data.2d[, i] - mean(data.2d[, i])
}

plot(data.2d, main="Normalized data")
abline(v=0,h=0,lty=2,col="Red")

# Variance of the normalized data
apply(data.2d, 2, var)
sum(apply(data.2d, 2, var))


# Standardizing the data
data.2d = scale(data.2d)
plot(data.2d, main="Standardized data")
abline(v=0,h=0,lty=2,col="Red")

# Variance of the standardized data
apply(data.2d, 2, var)
sum(apply(data.2d, 2, var))

#################################################################

# PC's for the 2D data

################################################################

?prcomp
data.2d = data[, c("Horsepower","Weight")]
pc.2d = prcomp(data.2d)
pc.2d

# PC loadings
pc.2d$rotation

# PC scores
pc = pc.2d$x
pc[1:5, ]
data.2d[1:5, ]

# PC var
pc.2d$sdev
pc.2d$sdev^2
cumsum(pc.2d$sdev^2)/sum(apply(data.2d, 2, var))*100
pc.2d$sdev^2/sum(apply(data.2d, 2, var))*100

sum(pc.2d$sdev^2)
sum(apply(data.2d, 2, var))
sum(c(1641.924, 717416.332))

# proportin of variance explained
pc.2d$sdev^2/sum(apply(data.2d, 2, var))

plot(pc,pch=20,cex=0.8)
abline(v=0,h=0,lty=2,col="Red")

# PCA- orthogonal transformation
cor(pc)
plot(pc)


# PCA for p-dimensional data

?princomp
pc = prcomp(data[,-c(1,8,9)])
names(data)
ncol(data)-3

# PC loadings
pc$rotation
pc$x[1:5, ]

# PC var
pc$sdev^2
prop = round(pc$sdev^2/sum(apply(data[, -c(1,8,9)],2,var))*100, 4)
cumprop = cumsum(prop)
plot(1:6, cumprop, type = "b", ylim = c(99.5,100))

sum(pc$sdev^2)
sum(apply(data[, -c(1,8,9)],2,var))


# PC scores
pc = pc$x
pc[1:5,]
pc = as.data.frame(pc)
round(cor(pc),10)
plot(pc,pch=20,cex=0.8)



####################################################################################
# Using eigen vectors and eigen values
#################################################################################
str(cars)
# 406X3
cars2 = data[, c("Horsepower","Weight","Displacement")]
View(cars2)

# variance-covariance matrix (3X3)
covmat = cov(cars2)
covmat
dim(covmat)
#rankMatrix(covmat)[1]

# Result 1
cov.egn = eigen(covmat)
cov.egn
cov.egn$values

pc = prcomp(cars2)
pc$rotation


# Result 2
pc$sdev^2

# Result 3
sum(apply(cars2,2,var))
sum(cov.egn$values)
