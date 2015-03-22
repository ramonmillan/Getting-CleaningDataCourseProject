# Introduction

The R script run_analysis.R does the following: 

1. The data of similar nature is readed from the different files (x_train.txt, y_train.txt, subject_train.txt, x_test.txt and y_text.txt) and merged using the rbind() function
2. The colums with the mean and standard desvitation measures are identified with grep() and extracted, finally the correct colum name is taken from the file features.txt 
3. The activity colum has values 1-6, so the descriptive activity names are extracted from activity_labels.txt and updated in the data set
4. The data set is appropiately labelled with descriptive variable names using names() and all the clean data is merged with cbind()
5. From the data set in step 4, it is generated a new tidy big data set with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows) using ddply() from the plyr package. The output file is called averages_data.txt, and uploaded to this repository.

# Variables

The variables used are:

- **x_train**, **y_train**, **subject_train**, **x_test**, **y_test**, **subject_test** contain the data read from the corresponding downloaded files
- **x_data** merges **x_train** and **x_test** for further analysis
- **y_data** merges **y_train** and **y_test** for further analysis
- **subject_data** merges **y_train** and **y_test** for further analysis
- **features** contains the data read from the **features.txt** file with the list of all features
- **mean_and_std_features** contains the colum names with the mean and standard desviation from **features**
- **x_data** subsets now the desired colums from **mean_and_std_features** 
- **activities** contains the data read from the "activity_labels.txt** file
- **y_data** subsets now the correct activity names
- **merged_data** merges **x_data**, **y_data** and **subject_data**
- **averages_data" has the tidy data set, that will be also stored in "averages_data.txt"

