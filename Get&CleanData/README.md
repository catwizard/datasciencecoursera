1. Merges the training and the test sets to create one data set.
for the training data, combine "X_train.txt", "y_train.txt" and "subject_train.txt"
for the test data, combine "X_test.txt", "y_test.txt" and "subject_test.txt"
then merge the training and the test sets
result dataset named "data"

2. Appropriately labels the data set with descriptive variable names
get descriptive variable names from "features.txt"

3. Extracts only the measurements on the mean and standard deviation for each measurement. 
search variable names with mean or std in "features.txt"
result extracted dataset named "mean_and_std"

4. creates a second, independent tidy data set with the average of each variable for each activity and each subject
calculat mean of each variable grouped by activity and subject
result dataset named "average_data"

5. Uses descriptive activity names to name the activities in the data set
get activity names from "activity_labels.txt"
replace activity id 1 to 6 with activity names

6. write the dataset "average_data" as a file "average_data.txt"
