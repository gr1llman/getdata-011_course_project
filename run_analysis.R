run_analysis <- function() {
        # This function uses data about smartphones described at the following link:
        # http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
        #
        # This function returns a tidy dataset from this data after combining data sets with test
        # and with training data.  Here are the steps:
        #
        #  1. Merge the test and training datasets.
        #  2. Extract only measurements on the mean and standard deviation for each measurement.
        #  3. Use descriptive activity names to name activities in the data set.
        #  4. Appropriately label the data set with descriptive variable names.
        #  5. From the data set in step 4, create a second, independent tidy data set with the average
        #     of each activity and subject area.
        
        #  This function uses functions from the dplyr library so load that library
        
        library(dplyr)
        
        #  Read the data common to both the test and the training data sets:
        #      activity_labels are the descriptive labels for each activity
        #      features are the variable / column names for the large data set columns
        
        activity_labels <- read.table("activity_labels.txt")
        features <- read.table("features.txt")
        
        #  Read the test data and the train data
        #      x_test, x_train contains 561 individual observation vectors, with each vector 
        #          being one set of observations for one subject and one activity
        #      y_test, y_train contains the activity numbers for each observation
        #      subject_test, subject_train contains the subject number for each observation
        
        x_test <- read.table("x_test.txt")
        x_train <- read.table("x_train.txt")
        y_test <- read.table("y_test.txt")
        y_train <- read.table("y_train.txt")
        subject_test <- read.table("subject_test.txt")
        subject_train <- read.table("subject_train.txt")
                    
                
        #  Merge the activity_labels with the test and train activity numbers
        
        y_test <- merge(y_test, activity_labels)
        y_train <- merge(y_train, activity_labels)
        
        # Create table combining all test data
        
        test_data <- cbind(subject_test[, 1], y_test[, 2], x_test[,])
        
        # Create table combining all train data
        
        train_data <- cbind(subject_train[, 1], y_train[, 2], x_train[,])
        
        # Use meaningful names for all variables, feature contains names for observations
        # Also, rbind binds by variable name
        
        names(test_data) <- c("Subject", "Activity", as.character(features[,2]))
        names(train_data) <- c("Subject", "Activity", as.character(features[,2]))
        
        # Select only columns with mean() and std() as well as Subject and Activity
        # Create a vector with the column indices to select
        
        select1 <- grep("Subject|Activity|mean\\(\\)|std\\(\\)", names(test_data))
        select2 <- grep("Subject|Activity|mean\\(\\)|std\\(\\)", names(train_data))
        
        
        # Revise the test_data and the train_data set to only have the columns selected
        
        test_data <- test_data[ , select1]
        train_data <- train_data[ , select2]
        
        # Bind the rows of the data together
        
        all_data <- rbind(test_data, train_data)
                       
        # Group the data for summarise_each
        
        sum_data <- group_by(all_data, Subject, Activity)
        
        # Summarise_each column and store as data frame
        
        sum_data <- data.frame(summarise_each(sum_data, "mean"))
        
        # Output data frame
        
        sum_data
        
        
        
        
}