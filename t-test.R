# FUNCTION - 1
#-------------
# The following function should return a dataframe with one column containing
# the p-values of the t-tests between the selected numeric variables and the
# target variable. The row names must be the names of the variables.
# Note the default setting for the "cols" parameter should be the list of all
# variables
# VALIDATIONS: 
# 1) the "target" variable should be a binary
# 2) the "data" must be dataframe
# 3) Consider only numeric columns for t-test from "cols"


TTest <- function(data, cols = names(data), target)
{
  # checking whether the data given is a dataframe or not
  if(!is.data.frame(data))
    stop("The given object is not a dataframe")
  
  # checking whether the target variable is binary or not
  if(length(unique(data[, target])) != 2)
    stop("The given target variable is not binary")
  
  pvalues = c()                      # created an empty vector to store the p-values
  
  for (i in cols)                    # loop will go through all the columns of data
  {
    if(is.numeric(data[, i]))        # check whether the column is numeric or not
    {
      if(i != target)                # Since we dont have to do t-test with the same column
      {
        # perform t-test on the column in loop and the target column
        a = t.test(data[, i] ~ data[, target])
        pvalues[i] = a$p.value       # stores the p-value of t-test into the vector temp
      }
    }  
  }
  # converting pvalues into dataframe
  pvalues = as.data.frame(pvalues)
  return(pvalues)
}

# Test cases for function 1
attrition = read.csv("attrition.csv")
TTest(attrition, target = "Attrition")
TTest(attrition, c("Age", "DistanceFromHome"), "Attrition")