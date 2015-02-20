# getdata-011_course_project
Contains files to satisfy the requirements of the course project for the Johns Hopkins Bloomberg School of Public Health "Getting and Cleaning Data" coursera.org course
==================================================================
Created for "Getting and Cleaning Data" coursera.org class from Johns Hopkins Bloomberg School of Public Health
Created by github.com user gr1llman
==================================================================

This script was designed to work with various files from the following dataset:

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
=========================================

run_analysis.R creates a tidy dataset that creates one record for each subject and activity pair that has
any values in variables identified as mean() or std() in the original data set.   The summary created calulates
the mean / average value for the identifed variables. 

The script is formatted as a function that takes no parameters.  

The script outputs a dataframe that can then be exported for storage.  One good approach to storing the
data frame is to use the write.table(dataframename, "filename.txt", row.names = FALSE)

When you export the data using this command, you must import the data to r to view it in the original,
tidy format.  The recommended command to read the file is dataframename <- read.table("filename.txt", header = TRUE)
 
=========================================
Each line of that file create by the script is one observation and contains.
======================================

- Subject number
- Activity
- 66 variables with the calcuated mean

More details about the varibles is contained in the codebook provided with this script.

=========================================
To run this script you need the following files from the original smartphone data:
=========================================

x_test.txt - 30% of the observations from the smartphones from the experiment across 561 variables
x_train.txt - 70% of the observations from the smartphones from the experiment across 561 variables
y_test.txt - activity numbers corresponding to each row of the x_test.txt file
y_train.txt - activity numbers corresponding to each row of the x_train.txt file
subject_test.txt - subject numbers corresponding to each row of the x_test.txt file
subject_train.txt - subject numbers corresponding to each row of the x_train.txt file
activity_labels.txt - mapping of the activity numbers to textual names for the activities
features.txt - textual variable names for the 561 variables in the x_test.txt and x_train.txt files

You also require the dplyr package to be installed in your r workspace.
The script executes "library(dplyr)".


=========================================
The repo includes three (3) files:
=========================================

- 'README.md': This file

- 'CodeBook.md': Information about each variable and detailed steps 
                 (both in the script and external) followed to create the resultant dataset

- 'run_analysis.R': The actual script.


Acknowledgements:
========
The Human Activity Recognition Using Smartphones Dataset used by permission based on licensing information that stipulates that its use must acknowledge the following publications 
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a 
Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

That dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
