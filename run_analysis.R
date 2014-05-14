library(reshape2)

# this function is to load data into memory, merge test and train dataset, extract useful data features
# return dataset for analysis
MergeAndExtractData <- function( directory ) {
  
  feathers <- read.table(paste0(directory, "/features.txt"))
  useful_feathers <- feathers[grep("mean\\(\\)|std\\(\\)", feathers[,2]), ]
  
  train_set <- read.table(paste0(directory, "/train/X_train.txt"))
  test_set <- read.table(paste0(directory, "/test/X_test.txt"))
  all_set <- rbind(train_set[, useful_feathers[, 1]], test_set[, useful_feathers[, 1]])
  colnames(all_set) <- useful_feathers[, 2]
  
  train_activity <- read.table(paste0(directory, "/train/y_train.txt"), col.names=c("activity_id"))
  test_activity <- read.table(paste0(directory, "/test/y_test.txt"), col.names=c("activity_id"))
  all_activity <- rbind(train_activity, test_activity)
  activity_label <- read.table(paste0(directory, "/activity_labels.txt"), col.names=c("activity_id", "activity_label"))
  
  train_subject <- read.table(paste0(directory, "/train/subject_train.txt"), col.names="subject")
  test_subject <- read.table(paste0(directory, "/test/subject_test.txt"), col.names="subject")
  all_subject <- rbind(train_subject, test_subject)
  
  all_data <- cbind(all_set, all_activity, all_subject)
  all_data <- merge(all_data, activity_label, by.x="activity_id", by.y="activity_id", all.x=TRUE, sort=FALSE)
  
  all_data
}

# this function is to create independent tidy data set with the average of each variable for each activity 
# and each subject. 
GetTidyData <- function(data) {
  groupData <- melt(data, id.vars = c("subject", "activity_id", "activity_label"))
  groupData$value <- as.numeric(groupData$value)
  meanData <- aggregate(value~subject+activity_id+activity_label+variable, data=groupData, FUN=mean)
  tidyData <- dcast(meanData, subject+activity_id+activity_label ~ variable)
  tidyData
}

# write the tidy data into file
WriteTidyData <- function(data, filename) {
  write.table(data, file=filename, quote=FALSE, sep = " ", row.names=FALSE)
}


