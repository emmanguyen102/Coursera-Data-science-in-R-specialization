pollutantmean <- function(directory, pollutant, id=1:332) {
  
  ## create an empty vector
  pollutants <- c()
  
  ## get a list of file names
  filenames <- list.files(directory)
  
  ## loop through 332 CSV files in sepcdata folder
  for (i in id) {
    filepath = paste(directory, "/", filenames[i], sep="")
    data = read.csv(filepath, header=TRUE)
    
    ## add values of the chosen pollutant into the pollutants vector
    pollutants <- c(pollutants, data[, pollutant])
  }
  
  ## find the mean, without NA values of pollutants vector
  pollutant_mean <- mean(pollutants, na.rm=TRUE)
  
  ## print the result
  pollutant_mean
}
