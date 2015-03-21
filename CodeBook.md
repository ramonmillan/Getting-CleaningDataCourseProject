# Introduction

The R script run_analysis.R does the following: 

1º The data of similar nature is readed from the different files (x_train.txt, y_train.txt, subject_train.txt, x_test.txt and y_text.txt) and merged using the rbind() function
2º The colums with the mean and standard desvitation measures are identified with grep() and extracted, finally the correct colum name is taken from the file features.txt
3º The activity colum has values 1-6, so the descriptive activity names are extracted from activity_labels.txt and updated in the data set
4º The data set is appropiately labelled with descriptive variable names using names() and all the clean data is merged with cbind()
5º From the data set in step 4, it is generated a new tidy big data set with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows) using ddply() from the plyr package. The output file is called averages_data.txt, and uploaded to this repository.

