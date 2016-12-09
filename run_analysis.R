#reading activities and features tables
activities <- read.table("./Coursera/03_cleaning data/final_assignment/UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "")
features <- read.table("./Coursera/03_cleaning data/final_assignment/UCI HAR Dataset/features.txt", header = FALSE, sep = "")

#reading test tables, adding column names for 561 features
test_data <- read.table("./Coursera/03_cleaning data/final_assignment/UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "", col.names=features$V2)
test_activties <- read.table("./Coursera/03_cleaning data/final_assignment/UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "")
test_subject <- read.table("./Coursera/03_cleaning data/final_assignment/UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "")

#adding subject and activity nr column to the test data set, setting correct column names 
test_data <- cbind(test_subject, test_activties, test_data)
colnames(test_data)[1] <- "subject"
colnames(test_data)[2] <- "activity_nr"

#reading train tables, adding column names for 561 features
train_data <- read.table("./Coursera/03_cleaning data/final_assignment/UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "", col.names=features$V2)
train_activties <- read.table("./Coursera/03_cleaning data/final_assignment/UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "")
train_subject <- read.table("./Coursera/03_cleaning data/final_assignment/UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "")

#adding subject and activity nr column to the train data set, setting correct column names 
train_data <- cbind(train_subject, train_activties, train_data)
colnames(train_data)[1] <- "subject"
colnames(train_data)[2] <- "activity_nr"

colnames(activities)[2] <- "activity"

full_data <- rbind(test_data, train_data) # merging test and train dataset

#finding which columns contain mean (whih also includes meanFreq) or standard deviation
c1 <- names(full_data)
m1 <- grep("mean()", c1)
m2 <- grep("std()", c1)

library(dplyr)
mean_std_tbl <- select(full_data, 1, 2, m1, m2 ) #selecting first two columns (subject & activities) and the ones that contain either mean() or std() expression 
mean_std_acc_tbl <- merge(mean_std_tbl, activities, by.x="activity_nr", by.y="V1") #Adding descriptive activity names to name the activities in the data set

library(tidyr) # making our table a long dataset with tidyr (as mentioned in the rubric as either long or wide form is acceptable)
tblx <- mean_std_acc_tbl %>%
          gather(vars, values, tBodyAcc.mean...X:fBodyBodyGyroJerkMag.std..) %>% #making our table a long dataset with tidyr (as mentioned in the rubric as either long or wide form is acceptable)
          separate(vars, c("measures", "variables"))%>% #separating measures from variables
          group_by (subject, activity, measures, variables)%>% #grouping by the required elements (each variable for each activity and each subject)
          summarize (average=mean(values)) %>% #calculating average per goroupped element
          spread(variables, average) #moving variables to columns

write.table(tblx, "./Coursera/03_cleaning data/final_assignment/tblx.csv")

