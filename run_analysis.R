

# Loading "plyr" with tools for splitting, applying and combining data

library(plyr)

## 1) Merge the training and test sets to create one data set

# Reading training set
x_train <- read.table("train/X_train.txt")

# Reading training labels
y_train <- read.table("train/y_train.txt")

# Reading subject training, where each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
subject_train <- read.table("train/subject_train.txt")

# Reading test set
x_test <- read.table("test/X_test.txt")

# Reading test labels
y_test <- read.table("test/y_test.txt")

# Reading subject test, where each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
subject_test <- read.table("test/subject_test.txt")

# Create 'x' data set
x_data <- rbind(x_train, x_test)

# Create 'y' data set
y_data <- rbind(y_train, y_test)

# Create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

## 2) Extract only the measurements on the mean and standard deviation for each measurement

# Reading the list of all features
features <- read.table("features.txt")

# Getting only the colums with the mean() and std()
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# Subset the desired columns
x_data <- x_data[, mean_and_std_features]

# Correct columns name
names(x_data) <- features[mean_and_std_features, 2]

## 3) Uses descriptive activity names to name the activities in the data set

# Reading the class labels with their activity name
activities <- read.table("activity_labels.txt")

# Update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# Correct column name
names(y_data) <- "activity"

## 4) Appropriately labels the data set with descriptive variable names

# Correct column name for 'subject'
names(subject_data) <- "subject"

# Bind all the data in a single data set
merged_data <- cbind(x_data, y_data, subject_data)

# Change the labels of the data set with descriptive variable names
names(merged_data)<-gsub("^t", "time", names(merged_data))
names(merged_data)<-gsub("^f", "frequency", names(merged_data))
names(merged_data)<-gsub("Acc", "Accelerometer", names(merged_data))
names(merged_data)<-gsub("Gyro", "Gyroscope", names(merged_data))
names(merged_data)<-gsub("Mag", "Magnitude", names(merged_data))
names(merged_data)<-gsub("BodyBody", "Body", names(merged_data)) 

## 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

# Create the tidy data set, deleting also the last 2 colums
averages_data <- ddply(merged_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

# Saves the data set in averages_data.txt
write.table(averages_data, "averages_data.txt", row.name=FALSE)