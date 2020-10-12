source("complete.R")
corr <- function(directory, threshold) {
  ## return a dataframe with id and nobs from function complete in script file complete.R
  completes = complete(directory, 1:332)
  
  ## subset the data frame with nobs larger than the chosen threshold
  completes_above_threshold = subset(completes, nobs > threshold)
  
  filenames = list.files(directory)
  
  ## create an empty vector 
  correlations <- c()
  
  for (i in completes_above_threshold$id) {
    filepath = paste(directory, "/", filenames[i], sep="")
    data=read.csv(filepath, header=TRUE)
    completeCases = data[complete.cases(data), ]
    count = nrow(completeCases)
    if (count >= threshold) {
      correlations <- c(correlations, corr(completeCases$nitrate, completeCases$sulfate))
    }
  }
  correlations
}
