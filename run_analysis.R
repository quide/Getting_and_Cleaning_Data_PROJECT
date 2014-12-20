
merge_data <- function() {
    column_name <- read.table("features.txt")
    test_data <- read.table("test/X_test.txt", colClasses="numeric", col.names=column_name[,2])
    
    test_data <- cbind(test_data, read.table("test/subject_test.txt", colClasses="numeric", col.names="subject"))
    test_data <- cbind(test_data, read.table("test/y_test.txt", colClasses="numeric", col.names="activity"))
    #test_data$subjects <- read.table("test/subject_test.txt", colClasses="numeric", col.names="subject")
    #test_data$activity <- read.table("test/y_test.txt", colClasses="numeric", col.names="activity")
    

    train_data <- read.table("train/X_train.txt", colClasses="numeric", col.names=column_name[,2])
    
    train_data <- cbind(train_data, read.table("train/subject_train.txt", colClasses="numeric", col.names="subject"))
    train_data <- cbind(train_data, read.table("train/y_train.txt", colClasses="numeric", col.names="activity"))
    #train_data$subjects <- read.table("train/subject_train.txt", colClasses="numeric", col.names="subject")
    #train_data$activity <- read.table("train/y_train.txt", colClasses="numeric", col.names="activity")
    
    
    #if(!(names(test_data) == names(train_data)))
    #    stop
    
    set <- rbind(test_data, train_data)
    
    # generate vector with column names for mean and std
    columns_mean_std <- c("subject", "activity")
    j <- 2
    for (i in column_name[,2])
    {
        if(grepl("mean", i) || grepl("std", i))
        {
            j <- j + 1
            columns_mean_std[j] <- gsub(")", ".", gsub("(", ".", gsub("-", ".", i)))
        }
    }
        
    set_mean_std <- set[columns_mean_std]
}