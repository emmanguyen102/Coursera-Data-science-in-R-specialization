### Question 1: Find the mean of "Sepal.Length" for the species "virginica"
## optional: install.packages(data.table)
library(datasets)
library(data.table)
data(iris)

## find some informatin about the dataset
?iris

iris_dt <- as.data.table(iris)
 
## round the result to the nearest whole number
iris_dt[Species == "virginica", round(mean(Sepal.Length))]

### Question 2: Return a vector of the means of the variables:
## "Sepal.Length", "Sepal.Width", "Petal.Width"
apply(iris[, 1:4], 2, mean)

### Question 3: Calculate the average miles per gallon (mpg) by number of cylinders
### in the car (cyl)

## load the "mtcars" dataset R with the following code
library(datasets)
data(mtcars)

## find some information about the dataset
?mtcars

## answer the question (using 1 from below 3 approaches)
with(mtcars, tapply(mpg, cyl, mean))
tapply(mtcars$mpg, mtcars$cyl, mean)
sapply( split(mtcars$mpg, mtcars$cyl) , mean)

### Question 4: What is the absolute difference between the average horsepower
### of 4-cylinder cars and the average horsepower of 8-cylinder cars

mtcars_dt <- as.data.table(mtcars)
mtcars_dt <- mtcars_dt[, .(mean_cols = mean(hp), by=cyl]
round(abs(mtcars_dt[cyl==4, mean_cols] - mtcars[cyl==8, mean_cols]))
