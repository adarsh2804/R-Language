# FUNCTION
#-------------
# The following function should return a dataframe with one column containing
# the p-values of the chisq-tests between the selected numeric variables and 
# the target variable. The row names must be the names of the variables.
# Note the default setting for the "cols" parameter should be the list of all
# variables
# VALIDATIONS: 
# 1) the "target" variable should be a binary
# 2) the "data" must be a dataframe
# 3) Consider only factor columns for chisq-test from "cols"

ChiTest <- function(data, cols = names(data), target)
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
    if(is.factor(data[, i]))         # check whether the column is factor or not
    {
      if(i != target)                # Since we dont have to do chisq test with the same column
      {
        # perform chisq on the column in loop and the target column
        c = chisq.test(table(data[, i], data[, target]))
        pvalues[i] = c$p.value       # stores the p-value of chisq test into the vector temp
      }
    }  
  }
  # converting into dataframe
  pvalues = as.data.frame(pvalues)   
  return(pvalues)
}

# Test cases for function
attrition = read.csv("datasets/attrition.csv")
attrition$EnvironmentSatisfaction = as.factor(attrition$EnvironmentSatisfaction)
attrition$JobInvolvement = as.factor(attrition$JobInvolvement)
ChiTest(attrition, target = "Attrition")
ChiTest(attrition, c("Age","JobInvolvement","EnvironmentSatisfaction"), target = "Attrition")
