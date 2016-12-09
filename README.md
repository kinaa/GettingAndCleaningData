# Project description 
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#R Code

This repo contains R script called "run_analysis" which reads the data from certain location under wd. 
Firstly, activities and features tables are read. Then test tables are read, making a one full test table out of it (with correct column names from the features file). 
Same action is repeated with train tables. 
Afterwards both test and train tables are merged together. 
Further column which contain mean and std are identified
With the help of dyplr package these column are selected and proper acitvities names are added to the dataset.
With the help of tidyr package datatable is cleaned:
  1. making our table a long dataset (as mentioned in the rubric as either long or wide form is acceptable)
  2. separating measures from variables
  3. grouping by the required elements (each variable for each activity and each subject)
  4. calculating average per goroupped element
  5. moving variables to columns
Finally tidy data set is written to the certain folder under wd as a txt file.  

