# ---------------------------------------------------------------------------------------
# This R script is part of the project requirements for John Hopkins Data Science
#    Coursera Course, "Getting and Cleaning Data" .
# Description:
#   1. Reads the data files provided in the "UCI HAR Dataset" and 
#   2. Generates a tidy dataset for a subset of columns from the full data set.
#   3. The tidy data set contains averages for different measures for a subject and activity
# Input:
#   1. Download the dataset: 
#       https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#   2. Unzip the downloaded file, which generates a directory "UCI HAR Dataset"
#   3. The script looks for the data files relative to the working directory. So, make sure
#       the "UCI HAR Dataset" directory is set as the working directory before execution of
#      the script.
# Output:
#   1. Generates a file "UCI_tidy_dataset.csv" in the working directory
#   2. Please refer to the Code book and the README.md accompanying this script for 
#      a description of the variables in the output dataset.
# ---------------------------------------------------------------------------------------

require(reshape2)

# read file containing the variable names for the data
print("Reading variable name from features.txt... please wait", quote = F)
con <- file("./features.txt", "r", blocking = FALSE)
labels <- readLines(con)
close(con)
print("Completed reading variable name from features.txt...", quote = F)

# read the test data set
# subject_test.txt: subject ids for each observation
# y_test.txt: activity label for each observation 
# X_test.txt: observations 
# testData is a merged data set containing all the test data files
print("Reading test data... please wait", quote = F)
testData <- data.frame()
testData <- read.table("./test/subject_test.txt", header=FALSE, sep="")
testData <- cbind(testData, read.table("./test/y_test.txt", header = FALSE, sep = ""))
testData <- cbind(testData, read.table("./test/X_test.txt", header = FALSE, sep = ""))
print("Completed reading test data... ", quote = F)

# similar to test but for train set
print("Reading train data... please wait", quote = F)
trainData <- data.frame()
trainData <- read.table("./train/subject_train.txt", header=FALSE, sep="")
trainData <- cbind(trainData, read.table("./train/y_train.txt", header = FALSE, sep = ""))
trainData <- cbind(trainData, read.table("./train/X_train.txt", header = FALSE, sep = ""))
print("Completed reading train data... ", quote = F)


print("Generating the full data set... please wait", quote = F)

# merge both the test and train data sets
mergedData <- rbind(testData, trainData)

# because of adding subject id, activity label add them into the column headings
# and set the merged data set column names
labelNames <- c("subject-id", "activity-label", labels)
colnames(mergedData) <- labelNames

# a x-ref table with the activity labels and the activity name (description)
activityLabels <- data.frame()
activityLabels <- read.table("./activity_labels.txt", header = FALSE, sep="")
colnames(activityLabels) <- c("activity-label", "activity-name")

# Add the activity name into the full data set by joining over the activity label column
finalMergedDataSet <- merge(activityLabels, mergedData, by.X = "activity-label", by.Y = "activity-label", all = FALSE)

print("Completed generating the full data set...", quote = F)


# Generate a subset of the full data set. I have chosen to only consider the actual "raw" signals 
# data which is the tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyGyro-XYZ as per the file - "features_info.txt" 
# accompanying the original data set. As per the project requirements, only the mean() and std() 
# are to be considered. So, find the columns with such names in the merged data set.

print("Extracting subset of full data set... please wait", quote = F)

extractedLabels <- NULL
finalMergedLabels <- colnames(finalMergedDataSet)
for (i in 1:length(finalMergedLabels)) {
  extractedLabels[i] <- ( 
      grepl("activity-label", finalMergedLabels[i], fixed = T)    |
      grepl("activity-name", finalMergedLabels[i], fixed = T)     |
      grepl("subject-id", finalMergedLabels[i], fixed = T)        |
      grepl("tBodyAcc-mean", finalMergedLabels[i], fixed = T)     |
      grepl("tBodyAcc-std", finalMergedLabels[i], fixed = T)      |
      grepl("tGravityAcc-mean", finalMergedLabels[i], fixed = T)  |
      grepl("tGravityAcc-std", finalMergedLabels[i], fixed = T)   |
      grepl("tBodyGyro-mean", finalMergedLabels[i], fixed = T)    |
      grepl("tBodyGyro-std", finalMergedLabels[i], fixed = T)
  )
}
extractedDataSet <- finalMergedDataSet[extractedLabels]
print("Completed extracting subset of columns from the full set...", quote = F)

# change the column names to more readable format
#oldLabels <- colnames(extractedDataSet)
newLabels <- colnames(extractedDataSet)
newLabels <- tolower(newLabels)                 # to lower case
newLabels <- gsub("_","",newLabels)             # remove "_" character
newLabels <- gsub("\\(\\)","",newLabels)        # remove () characters
newLabels <- sub("^[0-9]+ ","",newLabels)       # remove the digits and space at the beginning
newLabels <- gsub("-","\\.",newLabels)          # change "-" to "."
colnames(extractedDataSet) <- newLabels         # set the column names to the new labels
print("Completed changing the column names for the extracted data set....", quote = F)

# not required, but for debugging purposes
write.csv(extractedDataSet, file = "./merged_dataset.csv", row.names = FALSE)
print("Completed writing the extracted data set in merged_dataset.csv ....", quote = F)

# Generate the mean for each variable for each activiy and subject
# and save it in another data set "tidyData"
meltedDataSet <- melt(extractedDataSet, id = c("activity.name", "subject.id"))
tidyData <- dcast(meltedDataSet, formula = activity.name + subject.id ~ variable, mean)
print("Completed generating the tidy data set...", quote = F)

# Change the column names of the tidyData data set. 
# Wrap the column names in avg()"
tidyDataLabels <- colnames(tidyData)
tidyDataLabels <- sub("^t", "avg\\(t", tidyDataLabels)
tidyDataLabels <- sub("\\.x", "\\.x\\)", tidyDataLabels)
tidyDataLabels <- sub("\\.y", "\\.y\\)", tidyDataLabels)
tidyDataLabels <- sub("\\.z", "\\.z\\)", tidyDataLabels)
colnames(tidyData) <- tidyDataLabels
print("Completed changing the column names of tidy data set...", quote=F)

# Output the tidyData data set into a csv file
write.csv(tidyData, file = "./UCI_tidy_dataset.csv", row.names = FALSE)
print("Completed writing the tidy data set in UCI_tidy_dataset.csv...", quote=F)
