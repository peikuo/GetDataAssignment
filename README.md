## run_analysis.R contain methods to merge , extract, and process to get tidy dataset.
<br/>
## MergeAndExtractData 
this function is to load data into memory, merge test and train dataset, extract useful data features
return dataset for analysis<br/>
input parameter 'directory' is the directory path that contained you data file.<br/>


## GetTidyData
this function is to create independent tidy data set with the average of each variable for each activity 
and each subject. <br/>
input parameter 'data' is the dataset return from function MergeAndExtractData <br/>

## WriteTidyData
this function is to write the tidy data into file<br/>
input parameter 'data' is the tidy data<br/>
input parameter 'file' is the file path for writing in<br/>


## DEMO
data <- MergeAndExtractData("your directory for dataset") <br/>
tidy_data <- GetTidyData(data)<br/>
WriteTidyData(tidy_data, "your filepath")<br/>