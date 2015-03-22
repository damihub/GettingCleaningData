# You should create one R script called run_analysis.R that does the following. 
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 
# 5.From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.

## using tidy and dplyr package, read the raw data
library(tidyr)
library(dplyr)
tsdata <- read.table("X_test.txt")
trdata <- read.table("X_train.txt")

## read feature label
feature <- read.table("features.txt") 

## append the feature to the data as column name
colnames(tsdata) <- (feature[,2])
colnames(trdata) <- (feature[,2])

## update the column names
names(tsdata) <- gsub("-", ".", names(tsdata))
names(trdata) <- gsub("-", ".", names(trdata))

## subset the raw data to the study scope
stsdata <- tsdata[grep("mean\\(\\)|std\\(\\)", colnames(tsdata))]
strdata <- trdata[grep("mean\\(\\)|std\\(\\)", colnames(trdata))]

## read the subject 
subts <- read.table("subject_test.txt")
colnames(subts) <- "subject"
subtr <- read.table("subject_train.txt")
colnames(subtr) <- "subject"

## read the activity items
act <- read.table("activity_labels.txt")
actts <- read.table("y_test.txt")
colnames(actts) <- "activity"
for(n in 1:6) {actts$activity[actts$activity %in% n] <- as.character(act[n,2])}

acttr <- read.table("y_train.txt")
colnames(acttr) <- "activity"
for(n in 1:6) {acttr$activity[acttr$activity %in% n] <- as.character(act[n,2])}

## merge train and test data into one data set
nts <- cbind(subts, actts, stsdata)
ntr <- cbind(subtr, acttr, strdata)
mdata <- rbind(ntr, nts)

## remove () in the column name
names(mdata) <- gsub("[(][)]", "", names(mdata))

## create second tidy data set
ntidy <- summarise_each(group_by(mdata, subject, activity), funs(mean))
write.table(ntidy, file = "new_tidy_set.txt", row.name=FALSE) 


