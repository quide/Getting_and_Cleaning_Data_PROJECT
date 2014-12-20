This code book should describe the variables, the data, and any transformations or work performed to clean up the data.

merge_data() function
 - reads variables names (column_name)
 - Prepare chosen_columns vector with the columns that matter (mean and standard deviation)
 - get TEST data with columns that matter, and columns names
 - insert correspondent subjects to TEST rows
 - insert correspondent activities to TEST rows
 - get TRAIN data with columns that matter, and columns names
 - insert correspondent subjects to TRAIN rows
 - insert correspondent activities to TRAIN rows
 - Join TRAIN with TEST
 - Get activities key-names pair
 - Change activity keys by name
 - Make final independent tidy data set with the average of each variable for each activity and each subject
 - return it
