features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#1
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
MergedData <- cbind(Subject, Y, X)

#2
Extract <- select(MergedData, subject, code, contains("mean"), contains("std"))

#3
Extract$code <- activities[Extract$code, 2]

#4
names(Extract)[2] = "activity"
names(Extract)<-gsub("Acc", "Accelerometer", names(Extract))
names(Extract)<-gsub("Gyro", "Gyroscope", names(Extract))
names(Extract)<-gsub("BodyBody", "Body", names(Extract))
names(Extract)<-gsub("Mag", "Magnitude", names(Extract))
names(Extract)<-gsub("^t", "Time", names(Extract))
names(Extract)<-gsub("^f", "Frequency", names(Extract))
names(Extract)<-gsub("tBody", "TimeBody", names(Extract))
names(Extract)<-gsub("-mean()", "Mean", names(Extract), ignore.case = TRUE)
names(Extract)<-gsub("-std()", "STD", names(Extract), ignore.case = TRUE)
names(Extract)<-gsub("-freq()", "Frequency", names(Extract), ignore.case = TRUE)
names(Extract)<-gsub("angle", "Angle", names(Extract))
names(Extract)<-gsub("gravity", "Gravity", names(Extract))

#5
FinalData <- Extract %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)

