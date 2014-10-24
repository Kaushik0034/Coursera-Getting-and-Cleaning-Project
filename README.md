## Course Project

Create one R script called run_analysis.R that does the following.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names.
* Creates a second, independent tidy data set with the average of each variable for each   activity and each subject.

## Steps

* Download the data source and put into a folder on the local drive. 
* Put run_analysis.R in the parent folder of UCI HAR Dataset
* Set your working directory using setwd() function in RStudio.
* Run source("run_analysis.R"), then it will generate a new file tidy_data.txt in your working directory.

## Prerequisite

* Install Reshape2 package before running the script. The script will add this package in   the library.

## Script (run_analysis.R) steps 

The requirement is to create one R script called run_analysis.R that will do the following - 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each   activity and each subject.

In order to meet the above requirement the run_analysis.R script is created ,following things happen step by step in this script- 

* Set the working directory where the HAR training datasets are stored.
* Then read the training files (X_train.txt , y_train.txt and subject_train.txt) into R dataframes
* After reading the above three files , add 2 columns from y_train and subject_train with 561 columns of training_x 
* y_train contains the data for the activities while subject_train contains data for 30 subjects
* Add the 2 columns one each from y_train.txt and subject_train.txt
* Next step is to set the working directory where the HAR test datasets are stored 
* Then read the test files (X_test.txt , y_test.txt and subject_test.txt) into R dataframes
* After reading the above three files , add 2 columns with test_x dataframe (column 562 and 563)
* Add the 2 columns one each from y_test.txt and subject_test.txt
* When the training and test data are read into 2 separate R dataframes (namely training & test), then the rbind is used to     merge training and test dataframes. 
* merged_data contains the merged data of test and training
* Next read the features.txt and activity_labels.txt
* After that few data cleaning steps performed to make the feature names in the features.txt file consistent
* When all the feature names are standarized and become consistent , then use the grep command to find the mean and std       features (features which has either mean or std in its name)
* Then select only the mean and standard deviation columns from the merged data. This reduces the total number of columns 
  in the merged data set from 563 to 88 columns in selected data frame. 
* Uses descriptive activity names to name the activities in the data set
* From the data set in step above, creates a second, independent tidy data set with the average of each variable 
  for each activity and each subject.
* For finding the mean for each activity and each subject , used the melt and dcast functions