#Code Book

The script run_analysis is meant to be run in the same working directory with the following data
The data linked represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script does the following:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
At this point a dataset is produced with the clean merged data and will be saved in the working directory as "cleandata.txt"

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The dataset with the averages of the required measurements is presented in the file "final2.txt"
