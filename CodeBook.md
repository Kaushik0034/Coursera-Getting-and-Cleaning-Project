## Purpose of the Project
The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 


## Data Source for the Project

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Data Descriptions 

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person  performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed- width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and  gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff  frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## Analysis script steps 

The requirement is to create one R script called run_analysis.R that will do the following - 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each   activity and each subject.

In order to meet the above requirement the run_analysis.R script is created ,following things happen step by step in     this script- 

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
