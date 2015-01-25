##Getting and Cleaning Data Course Project

###Project description

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following.
 
1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.
 
3. Uses descriptive activity names to name the activities in the data set.

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


##Solution

* Firstly download the getdata-projectfiles-UCI HAR Dataset.zip, unzip and place in your work directory.
* Place the run_analysis.R file in your working directory as well.
* The unzip folder containing the UCI HAR Dataset and the run_analysis.R should be on the same level in your directory.
* Ensure that data.table and plyr packages are installed.
* In your R session load/run the file by using source("run_analysis.R")

This will result in one file being created:

* tidySet_UCI_HAR_AVG_Dataset.txt this produces the tidy data set which contains the average of each variable for each activity and each subject.
 
