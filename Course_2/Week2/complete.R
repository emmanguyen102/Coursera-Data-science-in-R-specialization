complete <- function(directory, id=1:332) {
  ibs <- c()
  nobss <- c()
  filenames = list.files(directory)
  for (i in id) {
    filepath = paste(directory, "/", filenames[i], sep="")
    data = read.csv(filepath, header=TRUE)
    completeCases <- data[complete.case(data), ]
    ids <- c(ids, i)
    nobss <- c(nobss, nrow(completeCases))
  }
  
  ## return a data frame containing a column named id and another column named nobs
  data.frame(id = ids, nobs = nobss)
}
