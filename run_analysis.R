#1. Merges the training and the test sets to create one data set.
x_train <-        read.table("train/X_train.txt")
y_train <-        read.table("train/y_train.txt")
subject_train <-  read.table("train/subject_train.txt")
x_test <-         read.table("test/X_test.txt")
y_test <-         read.table("test/y_test.txt")
subject_test <-   read.table("test/subject_test.txt")

train <-  cbind(subject_train, y_train, x_train)
test <-   cbind(subject_test, y_test, x_test)

mega <-   rbind(train, test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("features.txt")
meanstdfeatures <- grep("-(mean|std)\\(\\)", features[, 2])
megaMS <- mega[, c(1, 2, meanstdfeatures+2)]

#3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt")
megaMS[,2] <- activity_labels[megaMS[,2], 2]

#4. Appropriately labels the data set with descriptive variable names. 
namesf <- as.vector(features[meanstdfeatures, 2])
names(megaMS) <- c("subject", "activity", namesf)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- aggregate(megaMS[-(1:2)], list(subject = megaMS$subject, activity = megaMS$activity), mean)

write.table(tidy_data, file="tidy_data.txt",row.name=F)


