## read CSV file into data frame named hw1
hw1 <- read.csv("hw1_data.csv")

## find the names of all columns in this data frame
names(hw1)

## print the first 2 lines of this data frame
hw1[1:2, ]

## print the last 2 lines of the data frame
tail(hw1, 2)

## find the numbers of rows of this data frame
nrow(hw1)

## print the line 47th 
hw1[47, ]

## total NA values in column "Ozone"
sum(is.na(hw1$Ozone)

## copy the new data frame without NA values from the hw1 data frame
hw1_withoutNa <- na.omit(hw1)

## find the mean of column "Ozone" in the new data frame without any NA value
mean(hw1_withoutNa$Ozone)

## import library dplyr to user function filter
library(dplyr)

## filter the hw1_withoutNa with all values in Ozone column larger than 31
## and all values in Temp column larger than 90 and copy to new data frame
hw1_q1 <- hw1_withoutna %>% filter(Ozone > 31, Temp > 90)

## find the mean of values of Solar.R column in data frame hw1_q1
mean(hw1_q1$Solar.R)

## copy the hw1_withoutNa into a new data frame
## when Month column values are equal to 6 
hw1_q2 <- hw1_withoutna %>% filter(Month == 6)

## find mean of Temp columns when Month is equal to 6
mean(hw1_q2$Temp)

hw1_q3 <- hw1_withoutna %>% filter(Month == 5)

## find the maximum Ozone value in month of May
max(hw1_q3$Ozone)
