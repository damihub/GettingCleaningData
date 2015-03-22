# GettingCleaningData
Project for getting and cleaning data

Following the tidy data principle to merge and clean the test data to one data set.
1. Each variable forms a column
2. Each observation forms a row
3. Each table/file stores one kind of data

Following these steps you can get the an output of a new tidy data set.

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

1. download the data file from the link provided and unpack to single directory
2. download the script from here
3. run the script with data file in the same environment in R 

The script loads the test data and map with proper test label. It subsets the data of mean and standard deviation for each measurement then maps to the subjects and activities. It outputs the average of each measurement for the subject and activities. 

