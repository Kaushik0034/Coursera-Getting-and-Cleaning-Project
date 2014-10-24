## First set the working directory where the HAR training datasets are stored
setwd("../")
setwd("./data/project/UCI HAR Dataset/train")

##Then read the X_train.txt , y_train.txt and subject_train.txt files into R dataframes
##After reading the above three files , add 2 columns with training_x dataframe (column 562 and 563)
## Add the 2 columns one each from y_train.txt and subject_train.txt

training_x <-read.csv("X_train.txt",sep="",header=FALSE)
training_y <-read.csv("y_train.txt",sep="",header=FALSE)
training_sub <-read.csv("subject_train.txt",sep="",header=FALSE)
training <-cbind(training_x,training_y,training_sub)

## Now set the working directory where the HAR test datasets are stored
setwd("../")
setwd("./test")

##Then read the X_test.txt , y_test.txt and subject_test.txt files into R dataframes
##After reading the above three files , add 2 columns with test_x dataframe (column 562 and 563)
## Add the 2 columns one each from y_test.txt and subject_test.txt

test_x <-read.csv("X_test.txt",sep="",header=FALSE)
test_y <-read.csv("y_test.txt",sep="",header=FALSE)
test_sub <-read.csv("subject_test.txt",sep="",header=FALSE)
test <-cbind(test_x,test_y,test_sub)

## Merge the training and the test data sets to create one data set.
merged_data <- rbind(training,test)

## Set directory to read the features.txt and activity_labels.txt files 
setwd("../")

## Read features.txt file
features<-read.csv("features.txt",sep="",header=FALSE)

## Read activity_labels.txt file
activitylabels<-read.csv("activity_labels.txt",sep="",header=FALSE)

## Change the feature names to all lower cases for consistency
features[,2] <- tolower(features[,2])
## Replace all the "-" , "()" and " with "" from feature name
features[,2] = gsub("-","",features[,2])
features[,2] = gsub("[()]","",features[,2])

## Appropriately labels the data set with descriptive variable names
names(merged_data) =c(features[,2],'activity','subject')

## Filter only the mean and standard deviation for each measurement
grepdata<-grep("mean|std",features[,2])
## Then select only the mean and standard deviation columns from the merged data and 
## add this with the activity and subject data
selected<-merged_data[,c(grepdata,562,563)]


## Uses descriptive activity names to name the activities in the data set
currentActivity = 1
for (currentActivityLabel in activitylabels$V2) {
  selected$activity <- gsub(currentActivity, currentActivityLabel, selected$activity)
  currentActivity <- currentActivity + 1
}

##From the data set in step above, creates a second, independent tidy data set with the average of each variable 
##for each activity and each subject.
library(reshape2)
melted<-melt(selected,id=c('activity','subject'))
data<-dcast(melted,activity + subject ~variable,mean)
write.table(data, file = "./tidy_data.txt",row.names=FALSE)




