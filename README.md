# Getdata_Project
This repository is dedicated for assignment for Getting and Cleaning Data course. The Dataset is taken from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones . 
## Files
- CodeBook.md describes all the actions taken on the dataset to clean it up.
- run_analysis.R is a R script where is written all the actions taken on the dataset. It took five steps to perform it:
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and          each subject.
- FinalData.txt is the tidy data which is the result of the steps above.
