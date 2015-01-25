"Human Activity Script"

This script will return a tidy data set which includes the means for each subject/activity combination for the columns containing means or standard deviations of a variable. There are 6 possible activities and 30 subjects. Therefore the resulting data set will have 180 observations.

Prerequisite steps before running this script:

- Download this file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Extract contents directly into your R working directory. The result should be a folder named "UCI HAR Dataset"
- Install the "dplyr" R package using the following command: install.packages("dplyr")

The script will perform the following steps:

1. Read into R the following files from the newly created "UCI HAR Dataset" folder:
y_train.txt
y_test.txt
X_train.txt
X_test.txt
subject_train.txt
subject_test.txt
features.txt

2. Read these files into the following variables respectively:
ytrain
ytest
xtrain
xtest
subjecttrain
subjecttest
columns

3. Merge these variables into one single data set under the variable AllData.

4. Extract only the columns that deal with the mean or standard deviation of a given column and assign this new data set to the variable extracteddata.

5. Clean up the resulting column names by getting rid of unecessary characters and by replacing abbreviations and shorthand terms with full descriptive words.

6. Return the means of each column for each subject/activity combination as a data.frame in the variable tidydataset.
