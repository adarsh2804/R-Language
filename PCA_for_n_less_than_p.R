install.packages("ISLR")
library(ISLR)
data("NCI60")

X = NCI60$data
y = NCI60$labs

View(X)
dim(X)


class(NCI60)
class(NCI60$data)

NCI.pc = prcomp(X)
View(NCI.pc$X)
round(NCI.pc$sdev^2/sum(apply(X,2,var))*100,4)
round(cumsum(NCI.pc$sdev^2)/sum(apply(X,2,var))*100,4)

c = cov(X)
dim(c)
e = eigen(c)
round(e$values,4)
dim(c)

require(Matrix)
r = rankMatrix(c)
r[1]

