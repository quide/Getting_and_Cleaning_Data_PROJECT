
merge_data <- function() 
{
    # Get column names
    column_name <- read.table("features.txt")
    
    # Prepare chosen_columns vector with the columns that matter (mean and standard deviation)
    j <- 0
    chosen_columns <- NULL
    for (i in column_name[,2])
    {
        j <- j + 1
        if(grepl("mean", i) || grepl("std", i))
        {
            chosen_columns[j] <- "numeric"
        }
        else
        {
            chosen_columns[j] <- "NULL"
        }
    }
    
    # get TEST data with columns that matter
    test_data <- read.table("test/X_test.txt", colClasses=chosen_columns, col.names=column_name[,2])
    # insert correspondent subjects to TEST rows
    test_data <- cbind(test_data, read.table("test/subject_test.txt", colClasses="numeric", col.names="subject"))
    # insert correspondent activities to TEST rows
    test_data <- cbind(test_data, read.table("test/y_test.txt", colClasses="numeric", col.names="activity"))

    # get TRAIN data with columns that matter
    train_data <- read.table("train/X_train.txt", colClasses=chosen_columns, col.names=column_name[,2])
    # insert correspondent subjects to TRAIN rows
    train_data <- cbind(train_data, read.table("train/subject_train.txt", colClasses="numeric", col.names="subject"))
    # insert correspondent activities to TRAIN rows
    train_data <- cbind(train_data, read.table("train/y_train.txt", colClasses="numeric", col.names="activity"))

    #if(!(names(test_data) == names(train_data)))
    #    stop
    
    set <- rbind(test_data, train_data)
    
    activity_name <- read.table("activity_labels.txt")
    
    set[["activity"]] <- activity_name[ match(set[['activity']], activity_name[[1]] ) , 2]
    
    set
}