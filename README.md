##run_anaysis.R
===========
* This is a guide for anyone who needs details about the R Script "run_analysis.R" in this repository.
* Script is part of the deliverables for "Getting and Cleaning Data" course project of the Data Science track.
* Please refer to the "UCI_tidy_codebook.md" for a description of the output "tidy" data set and transformations 
performed to arrive at the "tidy" data set.
* The input data is [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for further analysis.
* The R script is called "run_analysis.R"

============
###Description
The script generates a "tidy" data set from the the input [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

============
###How to run the script
1. Download the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
1. Unzip the downloaded file, which generates a directory "UCI HAR Dataset".
1. Set the "UCI HAR Dataset" directory as the working directory. The script looks for the data files relative to the working directory. 
1. Execute the script

=============
###High level steps in the script 
1. Reads the data files provided in the "UCI HAR Dataset"
2. Merges different files belonging to the train and test data sets and makes one "merged" data set.
3. Extracts a certain number of "raw" variables from the "merged" data set for "extracted" data set, 
which forms the basis for "tidy" data set. Refer to "Choice of extracted measurements" for explanation 
on how I made this selection of variables forming the "extracted" data set.
4. Modifies the column names from the original to make them more human readable.
5. Calculates averages (mean) on the extracted data set for each subject and each activity.
6. Generates a tidy data set that contains averages (calculated above) for the extracted measures for 
a subject and activity.

==============
###Output
1. Generates a "tidy" data set with averages of each extracted variable for each activity and each subject. The 
generated file is "UCI_tidy_dataset.csv" and is located in the working directory.

=================
###Choice of extracted measurements
I decided to limit the "extracted" data set measurements to "raw" data variables only. The file "features_info.txt" 
in the UCI HAR Dataset describes all the measures. It says the "raw" signals are accelerometer (tAcc-XYZ) 
and gyroscope (tGyro-XYZ) 3-axial signals over time. The accelerometer signal was further separated into 
body (tBodyAcc-XYZ) and gravity (tGravityAcc-XYZ) acceleration signals. All these signal are captured 
for time domain. Every other measure appears to be derived from these raw signals. This is the basis of my
selection of measurements for my "extracted" data set.
Then proceeded to extract the mean and standard deviation (project requirement) measurements for these 
variables(18 in total) only along with the subject, activity name and label making it a total of 21 variables
in my "extracted" data set. Finally, calculated the averages for these 18 variables for each subject and 
each activity thus completing the generation of my "tidy" data set.

===================
