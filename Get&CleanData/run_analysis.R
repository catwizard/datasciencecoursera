setwd("./UCI HAR Dataset")

# for the training data
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
s_train <- read.table("./train/subject_train.txt")
train <-cbind(x_train, y_train, s_train)

# for the test data 
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
s_test <- read.table("./test/subject_test.txt")
test <-cbind(x_test, y_test, s_test)

# merges the training and the test sets 
data <- rbind(train, test)


# for descriptive variable names
feature <- read.table("features.txt") #feature names
names(data) <- c(as.vector(feature$V2), "activity", "subject") #variable(column) names from V1~V561 to feature names and activity & subject

#only the measurements on the mean and standard deviation
m_list <- lapply(feature, function(y) grep("mean",feature$V2)) #list for measurement of the mean 
s_list <- lapply(feature, function(y) grep("std",feature$V2)) #list for measurement of the standard deviation
only_list <- c(m_list$V2, s_list$V2, 562, 563) #column no. of needed measurement (don¡¯t forget activity and subject)
mean_and_std <- data[,only_list] #needed subset of data

#for data set with the average of each variable for each activity and each subject
average_data <- NULL
for (i in c(1:79)) 
	{m1 <- tapply(mean_and_std[,i],paste(mean_and_std$activity, mean_and_std$subject), mean);
	 average_data <- cbind(average_data, m1)}
average_data <- as.data.frame(average_data) #from matrix to data frame

## regain descriptive variable names
average_data[80] <- substr(rownames(average_data),1,1) #regain activity from rowname
average_data[81] <- substr(rownames(average_data),3,4) #regain subject from rowname
names(average_data) <- names(mean_and_std) #regain column names

# for descriptive activity names
a <- read.table("activity_labels.txt", stringsAsFactors=FALSE) #column1=1-6, column2=names
for (i in 1:180) {for (j in 1:6) {if (average_data[i,80]==as.character(a[j,1])) average_data[i,80]=a[j,2]}}

write.table(average_data, "average_data.txt", row.name=FALSE)

