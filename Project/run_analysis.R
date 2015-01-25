## Merge the training and the test sets to create one data set
## Set/read x,y and subject data for train and test datasets respecitvely
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
SubjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
SubjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)


## Combining x,y and subject data for train and test datasets   
mergedX <- rbind(xTrain, xTest)
mergedY <- rbind(yTrain, yTest)
mergedS <- rbind(SubjectTrain, SubjectTest)



## Get the descriptions for features and rename columns
features <- read.table("./UCI HAR Dataset/features.txt")[,"V2"]

colnames(mergedX)<-features
colnames(mergedS)<-c("Subject")

##Uses descriptive activity names to name the activities in the data set.
##Appropriately labels the data set with descriptive activity names.

colnames(mergedY) <-"Activity"
mergedY$Activity[mergedY$Activity == 1] = "WALKING"
mergedY$Activity[mergedY$Activity == 2] = "WALKING_UPSTAIRS"
mergedY$Activity[mergedY$Activity == 3] = "WALKING_DOWNSTAIRS"
mergedY$Activity[mergedY$Activity == 4] = "SITTING"
mergedY$Activity[mergedY$Activity == 5] = "STANDING"
mergedY$Activity[mergedY$Activity == 6] = "LAYING"



## Extracts only the measurements on the mean and standard deviation for each measurement. 

feature_means <- grep("-mean\\(\\)", features, value=TRUE)
feature_stds <- grep("-std\\(\\)", features, value=TRUE)
merge_feature_results <- c(feature_means,feature_stds)
mergedX <- mergedX[, merge_feature_results]


#Combine all previous results into one dataset
tidySet <- cbind(mergedS, mergedY, mergedX)

 
#Create a 2nd, independent tidy data set with the average of each variable for each activity and each subject:
t <- tidySet[, 3:dim(tidySet)[2]] 
tidySetList <-list(tidySet$Subject, tidySet$Activity)
tidySetAvg <- aggregate(t,tidySetList, mean)

# Rename activity and subject name of columns 
names(tidySetAvg)[1] <- "Subject"
names(tidySetAvg)[2] <- "Activity"


# Create txt in diretory
write.table(tidySetAvg, "tidySet_UCI_HAR_AVG_Dataset.txt",row.names=FALSE)
 