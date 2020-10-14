rankall <- function(outcome, num) {

        ## create a vector of all possible outcomes
        outcomes <- c("heart attack", "heart failure", "pneumonia")
        
        ## validate outcome value
        if (outcome %in% outcomes == FALSE) {
                stop("invalid outcome")
        }
        
        ## read CSV file into a data frame
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        data <- data[c(2, 7, 11, 17, 23)]
        names(data)[1] <- "name"
        names(data)[2] <- "state"
        names(data)[3] <- "heart attack"
        names(data)[4] <- "heart failure"
        names(data)[5] <- "pneumonia"
        
        states <- unique(data$state)
        
        ## validate num value
        if (num != "best" && num != "worst" && num%%1 != 0) {
                stop("invalid input")
        }
        
        ## subset the data frame with only rows with outcome in outcomes
        data <- data[data[outcome] != "Not available", ]
        
        ## order the new data frame
        data[outcome] <- as.data.frame(sapply(data[outcome], as.numeric))
        data <- data[order(data$name, decreasing =FALSE), ]
        data <- data[order(data[outcome], decreasing = FALSE), ]
        
        getHospitalByRank <- function(df, s, n) {
                df <- df[df$state==s, ]
                vals <- df[, outcome]
                if( n == "best" ) {
                        rowNum <- which.min(vals)
                } else if( n == "worst" ) {
                        rowNum <- which.max(vals)
                } else {
                        rowNum <- n
                }
                df[rowNum, ]$name
        }
  
        newData <- data.frame("hospital" = character(), "state" = character())
        
        ## for each state in states, find the hospital of given rank
        for (st in states) {
                hos <- getHospitalByRank(data, st, num)
                newData <- rbind(newData, data.frame(hospital =hos, state = st))
        }
        
        newData <- newData[order(newData$state, decreasing = FALSE), ]
        
        # return a new data frame
        newData
        
}
