install.packages('glmnet', repos = "http://cran.us.r-project.org")
require(glmnet)
library(ISLR)


banks = read.csv('BANKS-large.csv')
View(banks)
banks = banks[-1]
x = banks[-1]
y = banks$HDFC

View(x)
View(y)
ncol(x)


####################### Ridge Regression ########################################

grid = 10^seq(5, -2, length=100)
ridge = glmnet(x, y, alpha=0, lambda=grid) # alpha=0 => Ridge, alpha=1 => lasso

coeff = coef(ridge)
coeff = as.matrix(coeff)
coeff = t(coeff)
coeff = as.data.frame(coeff)
coeff$lambda = sort(grid, decreasing = T)
head(coeff)


plot(coeff$lambda, coeff[,2], type='l', xlim = c(1, 2000), ylim = c(-3,3), col=2, xlab = 'lambda')

for(i in 2:ncol(x))
{
  Sys.sleep(1.5)
  lines(coeff$lambda, coeff[,i], type='l', col=i)
  print(names(coeff)[i])
}



####################### Lasso Regression ########################################

grid = 10^seq(5, -2, length=100)
lasso = glmnet(x, y, alpha=1, lambda=grid) # alpha=0 => Ridge, alpha=1 => lasso

coeff = coef(lasso)
coeff = as.matrix(coeff)
coeff = t(coeff)
coeff = as.data.frame(coeff)
coeff$lambda = sort(grid, decreasing = T)
head(coeff)


plot(coeff$lambda, coeff[,2], type='l', xlim = c(1, 2000), ylim = c(-3,3), col=2, xlab = 'lambda')

for(i in 2:ncol(x))
{
  Sys.sleep(1.5)
  lines(coeff$lambda, coeff[,i], type='l', col=i)
  print(names(coeff)[i])
}
