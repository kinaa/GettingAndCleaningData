#Original data
=================
The original data set is the "Human Activity Recognition Using Smartphones Dataset", which is available for download from the UCI Machine Learning Repository http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


#Orginal data set information
=================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 


#Tiday data set 
=================
Tiday set contains 6 columns:

"subject"  - ID of a volounteer who performed activities
"activity" - type of activity performaed
"measures" - following fetaures from the original experimet:
  fBodyAcc
  fBodyAccJerk
  fBodyAccMag
  fBodyBodyAccJerkMag
  fBodyBodyGyroJerkMag
  fBodyBodyGyroMag
  fBodyGyro
  tBodyAcc
  tBodyAccJerk
  tBodyAccJerkMag
  tBodyAccMag
  tBodyGyro
  tBodyGyroJerk
  tBodyGyroJerkMag
  tBodyGyroMag
  tGravityAcc
  tGravityAccMag
"mean", "meanFreq", "std" - avrage value per variable, per measure, activity, subject

Tiday data set contains 3060 rows each of them being unique combiation of subject, activity and measure.


#Script transformations
=================
Firstly, activities and features tables are read. Then test tables are read, making a one full test table out of it (with correct column names from the features file). Same action is repeated with train tables. Afterwards both test and train tables are merged together. Further column which contain mean and std are identified With the help of dyplr package these column are selected and proper acitvities names are added to the dataset. With the help of tidyr package datatable is cleaned:
  making our table a long dataset (as mentioned in the rubric as either long or wide form is acceptable)
  separating measures from variables
  grouping by the required elements (each variable for each activity and each subject)
  calculating average per goroupped element
  moving variables to columns Finally tidy data set is written to the certain folder under wd as a txt file.
  
