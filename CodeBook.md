#Codebook of the Homework

For this homework I created a tidy data set so it can be analyze afterwards.

#----------------------------------------------------
# Data Variables
#----------------------------------------------------
- Subject: Number between 1 an 30 identifying a subject tested
- Activity: Activity performed by the subject

For each of the next variables there exists a column with the mean value and the standard deviation of each experiment.
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Finally, the value shown represents the mean value
of all the tests and trains performed by the subject in the specific activity. 

-tBodyAcc-XYZ
-tGravityAcc-XYZ
-tBodyAccJerk-XYZ
-tBodyGyro-XYZ
-tBodyGyroJerk-XYZ
-tBodyAccMag
-tGravityAccMag
-tBodyAccJerkMag
-tBodyGyroMag
-tBodyGyroJerkMag
-fBodyAcc-XYZ
-fBodyAccJerk-XYZ
-fBodyGyro-XYZ
-fBodyAccMag
-fBodyAccJerkMag
-fBodyGyroMag
-fBodyGyroJerkMag
-gravityMean
-tBodyAccMean
-tBodyAccJerkMean
-tBodyGyroMean
-tBodyGyroJerkMean

#----------------------------------------------------
# Cleaning the RAW Data
#----------------------------------------------------

The data was divided between train and test sessions. This data was merged, a column game was gived and finally the subject number
and activity was added so it is easier to read and analyze. This procedure can be run with the run_analysis.R program that you can 
find in the README.md file. The program will worked if new data is added to the raw files.

