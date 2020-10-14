rankhospital <- function(state, outcome, num) {
        
        ## create a vector of all possible outcomes
        outcomes <- c("heart attack", "heart failure", "pneumonia")
        
        ## check if outcome in outcomes
        if (outcome %in% outcomes == FALSE) {
                stop("invalid outcome")
        }
        
        ## read CSV file into a data frame named "data"
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        data <- data[c(2, 7, 11, 17, 23)]
        names(data)[1] <- "name"
        names(data)[2] <- "state"
        names(data)[3] <- "heart attack"
        names(data)[4] <- "heart failure"
        names(data)[5] <- "pneumonia"
        
        states <- unique(data$state)
        
        ## check state in states
        if (state %in% states == FALSE) {
                stop("invalid state")
        }
        
        if (num != "best && num != "worst" && num%%1 != 0) {
                stop("Invalid num")
        }
        
        data <- data[data$state == state & data[outcome] != "Not available"]
        
        ## order the data by name and then outcome
        data <- data[order(data$name, decreasing = FALSE), ]
        data <- data[order(data[outcome], decreasing = FALSE), ]
        
        ## process the num argument to get the row index
        vals z- data[, outcome]
        if (num == "best") {
                rowNum <- which.min(vals)
        } else if (num == "worst") {
                rowNum <- which.max(vals)
        } else {
                rowNum <- num
        }
        
        ## return hospital name in that state with lowest 30-day death rate
        data[rowNum, ]$name
}
