best <- function(state, outcome) {
        
        ## create a vector of all possible outcomes
        outcomes <- c("heart attack", "heart failure", "pneumonia")
        
        ## check if outcome in the created vector above
        if (outcome %in% outcomes == FALSE) {
                stop("invalid outcome")
        }
        
        ## read CSV file
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## subset data frame into more relevant data frame with important columns
        data <- data[c(2, 7, 11, 17, 23)]
        
        ## rename these above chosen columns
        names(data)[1] <- "name"
        names(data)[2] <- "state"
        names(data)[3] <- "heart attack"
        names(data)[4] <- "heart failure"
        names(date)[5] <- "pneumonia"
        
        # create a list of 
        states <- unique(data$state)
        
        ## check if state in states 
        if (state %in% states == FALSE) {
                stop("invalid state")
        }
        
        ## subset the data frame again with chosen state and outcome
        data <- data[data$state == state & data[outcome] != "Not available", ]
        
        ## subset data frame to get all hospitals according to outcome
        vals <- data[, outcome]
        
        ## find the index of the min value
        rowNum <- which.min(vals)
        
        ## return hospital name in that state with lowest 30-day death rate
        data[rowNum,]$name
}
