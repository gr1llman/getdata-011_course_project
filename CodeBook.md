==================================================================
CodeBook.md forthe output of run_analysis.R script

==================================================================
Created for "Getting and Cleaning Data" coursera.org class from Johns Hopkins Bloomberg School of Public Health
Created by github.com user gr1llman
==================================================================

This codebook contains information about the dataframe created by the run_analysis.R script.

It contains a description of the steps taken to transform data about smartphones into the summarized
data frame output by the script.  It also contains information about each variable in the output.

==================================================================
The raw source data is from the following dataset:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

More details about that dataset, and the dataset, can be found at the following link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

******************************************************************************************************************************************************************

Steps taken to create the data frame created by run_analysis.R

******************************************************************************************************************************************************************
=================================================================================
The following steps were executed prior to development of the script
=================================================================================

1.  The zipped complete data set was downloaded from this url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2.  The zipped file was unzipped using the Windows feature that performs this task.

3.  The following files were copied into a directory to be used as a working directory.
	x_test.txt 
	x_train.txt
	y_test.txt 
	y_train.txt
	subject_test.txt
	subject_train.txt
	activity_labels.txt
	features.txt

4.  RStudio was started and using the menu option in "Session" the working directory was set.
	Note:  The run_analysis.R script was also placed in this working directory.

5.  The various files were loaded / explored using r commands in RStudio to determine dimensions of
    the files and ultimately how to combine them.  The details of the commands executed are unimportant
    because they do not impact the actual execution of the script or the output of data frame.

=================================================================================
The following steps are executed by the script
=================================================================================


1.  The test and train data sets are merged by:
	-  Reading all the files into data frames
	-  Naming the columns of the x_ files with the column names found in the features.txt file
	-  Binding a column with the subject number for each row in the x_ files with the subject identified in the subject_ file
	-  Creating a temporary data frame for each column of activity numbers (from the y_ files) mapped to the
	   corresponding activity name (activity_labels file).
	-  Binding a column with the activity associated with the activity identified for each row of the x_ files
	-  Binding the rows of the x_ files (with the added columns)

2.  The resultant data frame was subset to only include the subject, the activity and all variables that were mean or standard
    deviation variables.  The mean and standard deviation variables were identfied by having the stings "mean()" or
    "std()" in their variable names.

3.  The resultant data frame was grouped by subject and activity.

4.  The grouped data frame was summarized to calculate the mean of each of the observation variables for each of the subject / activity pairs
    with any observations.

5.  The summarized data frame was output by the script.

=================================================================================
The following step was taken in the console in RStudio to store the output data frame as a txt file
=================================================================================

1.  The command write.table(dataframename, "filename.txt", row.names = FALSE) was executed to store the data frame as a text file.


******************************************************************************************************************************************************************

Data dictionary describing the data frame created by run_analysis.R

******************************************************************************************************************************************************************

Data frame includes meaningful variable names.

Variable name 			Description
=============			===========

Subject				Single number from 1 to 30 identifying the subject of the experiment that the measurements relate to

Activity			Activity names associated with the subject and the measurements for the row.  Possible values:
					WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Measurement variables		There are 66 measurement variables that are a subset of the variables in the original data.  The following describes the variables and units.



The variables come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter
with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude 
of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

There were many calcluations based on these estimates.  For the summarized data set only the following estimates were selected:

mean(): Mean value
std(): Standard deviation

The values of the measurement varibles in each row are the mean of the measurement variables selected for the unique identifying pair (subject / activity) on the same row.



				More detail about the measurement variable and the measurements can be found at the following link:

					http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


===========================================================================
Acknowledgements:
========
The Human Activity Recognition Using Smartphones Dataset used by permission based on licensing information that stipulates that its use must acknowledge the following publications 
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a 
Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

That dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.