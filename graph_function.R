# this function will take the dataset and plot a boxplot and histogram for
# continuous variable and barplot for categorical variable

Graph_v1 = function(data)
{
  for (i in 1:ncol(data)) 
  {
    if((is.numeric(data[,i])) & length(unique(data[,i])) > 5)
    {
      par(mfrow = c(2,1))
      
      boxplot(data[,i], main = paste("Boxplot of",names(data)[i]), 
              xlab = names(data)[i], horizontal = T, col = 'gold')
      
      hist(data[,i], main = paste("Histogram of",names(data)[i]), 
           xlab = names(data)[i], col = 'gold', border = F)
    }
    
    else
    {
      par(mfrow = c(1,1))
      barplot(table(data[,i]),xlab = names(data)[i],
              main = paste("Barplot of",names(data)[i]), 
              col = 'gold', border = F)
    }
  }
  
}

attrition = read.csv("datasets/attrition.csv")
Graph_v1(attrition)
