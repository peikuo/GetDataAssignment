run_analysis.R contain methods to merge , extract, and process to get tidy dataset.

## MergeAndExtractData 
this function is to load data into memory, merge test and train dataset, extract useful data features
return dataset for analysis
input parameter 'directory' is the directory path that contained you data file.


## GetTidyData
this function is to create independent tidy data set with the average of each variable for each activity 
and each subject. 
input parameter 'data' is the dataset return from function MergeAndExtractData 

## WriteTidyData
this function is to write the tidy data into file
input parameter 'data' is the tidy data
input parameter 'file' is the file path for writing in


## DEMO
data <- MergeAndExtractData("your directory for dataset")
tidy_data <- GetTidyData(data)
WriteTidyData(tidy_data, "your filepath")