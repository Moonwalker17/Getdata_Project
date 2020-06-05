The run_analysis.R script performs these steps in order to get clean, tidy data. 
1. Reads and assigns each data to variables.
  - features <- features.txt 
  - activities <- activity_labels.txt 
  - subject_test <- test/subject_test.txt 
  - x_test <- test/X_test.txt 
  - y_test <- test/y_test.txt 
  - subject_train <- test/subject_train.txt 
  - x_train <- test/X_train.txt 
  - y_train <- test/y_train.txt 
2. Merges the training and the test sets to create one data set.
  - X is created by merging x_train and x_test using rbind() function
  - Y is created by merging y_train and y_test using rbind() function
  - Subject is created by merging subject_train and subject_test using rbind() function
  - MergedData is created by merging Subject, Y and X using cbind() function
3. Extracts only the measurements on the mean and standard deviation for each measurement.
  - Extract is created by subsetting MergedData selecting only subject, code columns and the measurements on the mean and std for each         measurement
4. Uses descriptive activity names to name the activities in the data set
  - Entire numbers in code column of the Extract replaced with corresponding activity taken from second column of the activities variable
5. Appropriately labels the data set with descriptive variable names.
  - code column in Extract renamed into activities
  - All Acc in column’s name replaced by Accelerometer
  - All Gyro in column’s name replaced by Gyroscope
  - All BodyBody in column’s name replaced by Body
  - All Mag in column’s name replaced by Magnitude
  - All start with character f in column’s name replaced by Frequency
  - All start with character t in column’s name replaced by Time
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  - FinalData (180 rows, 88 columns) is created by sumarizing Extract taking the means of each variable for each activity and each           subject, after groupped by subject and activity.
  - Export FinalData into FinalData.txt file.
