# Getting and Cleaning Data - Course Project

This repository hosts the R code and documentation files for the course project of the Coursera Data Science's track course "Getting and Cleaning data".

## Data

The dataset being used is [Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The code is considering that the data is saved and uncompressed in the same folder than **run_analysis.R**.

## Files of the project

The files associated to this project are:

- **README.md**: this file
- **CodeBook.md**: describes the variables, the data, and the transformations that was performed to clean up the data
- **run_analysis.R**: contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio by just importing the file.
- **averages_data.txt**: is the output of the 5th step, i.e. the tidy data set

## Reading the **averages_data.tx** 

The code you need to read the tidy data set into R is:

```
address <- "https://s3.amazonaws.com/coursera-uploads/user-b1295782a5456d738e2cdeab/973499/asst-3/0cad0c90d00c11e4af8893aae960f4af.txt"
address <- sub("^https", "http", address)
averages_data <- read.table(url(address), header = TRUE)
View(averages_data)
```
