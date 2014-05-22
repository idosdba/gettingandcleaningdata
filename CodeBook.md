#Tidy Data Set from Human Activity Recognition Using Smartphones Data Set

**Abstract:** Averages of mean and standard deviation measures for the acceleration(body & gravity) and gyroscopic 
recordings of each of 30 subjects for each of 6 activities based on the Human Activity Recognition Using Smartphones database.

**Data Set Characteristics:** Multivariate, Averages

**Number of Instances:** 181 (including header)

**Number of Attributes:** 21

**Date:** 05/23/2014

### Source:
The original data set is obtained from [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

**Excerpt from the source:**
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person 
performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial 
linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded 
to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers 
was selected for generating the training data and 30% the test data. 

**For each record it is provided:**

1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
1. Triaxial Angular velocity from the gyroscope.
1. A 561-feature vector with time and frequency domain variables.
1. Its activity label.
1. An identifier of the subject who carried out the experiment.

* A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

* The data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


### Tidy Data Set Information:

The Tidy data set contains the average of a subset of variables from the original data set for each activity and each subject.

**Signals comprising the tidy data set:**

* The original data set contained multiple variables and multiple measures on each of these variables. For the 
purpose of this project the number of variables and the measures are limited.
* The tidy data set is limited to the mean and standard deviation measurements for the body acceleration(tBodyAcc-XYZ), 
gravity acceleration(tGravityAcc-XYZ) and gyroscope(tBodyGyro-XYZ) variables(18 in total) along with 
the subject, activity name and activity label making it a total of 21 variables.
* Please refer to the accompanying "README.md" for further explanation on how these variables are chosen to be part of
the tidy data set.

**Variable Names:**
The original variables had characters that were not very suitable for processing and human readability. So changed the
names as per following.
1. Changed to lower case
1. Removed "-" character
1. Removed "()"
1. Removed the digits and space and the beginning
1. Changed "-" to "."

For example: the variable name "1 tBodyAcc-mean()-X" changed to "tbodyacc.mean.x"

After calculating the averages in the tidy data set, the variable names are changed to enclose them as in "avg(variablename)"
So, the average of tbodyacc.mean.x for each subject and each activity is represented by variable "avg(tbodyacc.mean.x)"

**For each record it is provided:**

1. activity.name
1. subject.id
1. activity.label
1. avg(tbodyacc.mean.x)
1. avg(tbodyacc.mean.y)
1. avg(tbodyacc.mean.z)
1. avg(tbodyacc.std.x)
1. avg(tbodyacc.std.y)
1. avg(tbodyacc.std.z)
1. avg(tgravityacc.mean.x)
1. avg(tgravityacc.mean.y)
1. avg(tgravityacc.mean.z)
1. avg(tgravityacc.std.x)
1. avg(tgravityacc.std.y)
1. avg(tgravityacc.std.z)
1. avg(tbodygyro.mean.x)
1. avg(tbodygyro.mean.y)
1. avg(tbodygyro.mean.z)
1. avg(tbodygyro.std.x)
1. avg(tbodygyro.std.y)
1. avg(tbodygyro.std.z) 

