# Variables
`x_train`, `y_train`, `subject_train` `x_test` `y_test`, `subject_test` contain data from original files
`train` contains combined data of all the train variables (x, y, subject)
`test` contains combined data of all the test variables (x, y, subject)
`mega` contains combined data of the train and test variables
`features` contains data of the features.txt file
`meanstdfeatures` is a subset of `features` that only contains rows with mean() or std()
`megaMS` is a subset of `mega` that contains only the mean and standard deviation variables
`activity_labels` contains data of the activity_labels.txt file
`namesf` is a vector variable that contains the names of the dataset variables retrieved from the `features` variable
`tidy_data` is the final dataset with the averages of each variable for each activity and each subject




