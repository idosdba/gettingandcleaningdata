##run_anaysis.R
* This is a guide for anyone who needs details about the R Script "run_analysis.R" in this repository.
* Script is part of the project deliverables for "Getting and Cleaning Data" course of the "Johns Hopkins Data Science" track.

###Project Description
* The purpose of the project is to collect, manipulate, and clean a data set. 
* The goal is to generate a tidy data set that can be used for later analysis.
* The input data set is from [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

###Project Deliverables

1. Script: run_analysis.R
1. Codebook: CodeBook.md
1. README: README.md
1. Tidy Data Set: UCI_tidy_dataset.csv

* Please refer to the "CodeBook.md" for a description of the generated tidy data set and the transformations 
performed to arrive at it.

###Script Description
* The script is used to read, manipulate, clean, and generate a tidy data set from the 
input data [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

###How to run the script

1. Download the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
1. Unzip the downloaded file, which generates a directory "UCI HAR Dataset".
1. Set the "UCI HAR Dataset" directory as the working directory. The script looks for the data files relative to the working directory. 
1. Execute the script

###High level steps in the script 

1. Reads the data files that were unzipped from the "UCI HAR Dataset"
1. Manipulates the data files and forms two data sets (train and test).
1. Merges the two data frames to make one "merged" data set.
1. Extracts a certain number of variables from the "merged" data set for "extracted" data set, 
which forms the basis for "tidy" data set. Refer to "Choice of extracted measurements" for explanation 
on how I made this selection of variables forming the "extracted" data set.
1. Modifies the column names from the original to make them more human readable. Refer 
to "Choice of variable names" for explanation of the new names.
1. Calculates averages (mean) on the extracted data set for each subject and each activity.
1. Generates a tidy data set that contains averages (calculated above) for the extracted measures for 
a subject and activity.

###Output
* Generates a tidy data set with averages of each extracted variable for each activity and each subject. The 
generated file is "UCI_tidy_dataset.csv" and is located in the working directory.

###Choice of variable names
The original variables had characters that were not very suitable for processing and human readability. So changed 
the names as per following.
- Changed to lower case
- Removed "-" character
- Removed "()"
- Removed the digits and space and the beginning
- Changed "-" to "."

For example: the variable name "1 tBodyAcc-mean()-X" changed to "tbodyacc.mean.x"

After calculating the averages in the tidy data set, the variable names are changed to enclose them 
as in "avg(variablename)". So, the average of tbodyacc.mean.x for each subject and each activity is 
represented by variable "avg(tbodyacc.mean.x)"

###Choice of extracted measurements
- I decided to limit the "extracted" data set measurements to "raw" data variables only. The file "features_info.txt" 
in the UCI HAR Dataset describes all the measures. It says the "raw" signals are accelerometer (tAcc-XYZ) 
and gyroscope (tGyro-XYZ) 3-axial signals over time. The accelerometer signal was further separated into 
body (tBodyAcc-XYZ) and gravity (tGravityAcc-XYZ) acceleration signals. All these signal are captured 
for time domain. 
- Further the file states that other signals(Jerk, Magnitude, Frequency) are derived from 
the same accelerometer and gyroscopic readings by applying other transformations. So, I decided to form 
my tidy data on just these raw variables. This is the basis of my selection of measurements for the 
"extracted" data set. Also the project requirements state that we should use only the mean and standard
deviation measurements for the variables.
- I proceeded to extract the mean and standard deviation measurements for the body acceleration(tBodyAcc-XYZ), 
gravity acceleration(tGravityAcc-XYZ) and gyroscope(tBodyGyro-XYZ) variables(18 in total) along with 
the subject, activity name and activity label making it a total of 21 variables in my "extracted" data set. 
- Finally, calculated the averages for these 18 variables for each subject and each activity thus completing 
the generation of my "tidy" data set.

