## Reading in the data

ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
y <- rbind(ytrain,ytest)

xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
x <- rbind(xtrain,xtest)

subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(subjecttrain,subjecttest)
names(subject) <- "subjects"

## Relabeling activities & columns

y[y==1]<-"WALKING"
y[y==2]<-"WALKING_UPSTAIRS"
y[y==3]<-"WALKING_DOWNSTAIRS"
y[y==4]<-"SITTING"
y[y==5]<-"STANDING"
y[y==6]<-"LAYING"
names(y) <- "activity"

columns <- read.table("./UCI HAR Dataset/features.txt")

names(x) <- columns[,2]

## Merging data into one data set

AllData <- cbind(x,y,subject)
names(AllData) <- tolower(names(AllData))

## Extracting means & standart deviation columns

means <- AllData[,grepl("-mean\\()",names(AllData))]

std <- AllData[,grepl("-std",names(AllData))]

ysubject <- AllData[,562:563]

extracteddata <- cbind(means,std,ysubject)

## Cleaning up column names

names(extracteddata) <- gsub("bodybody","body",names(extracteddata))
names(extracteddata) <- gsub("tbody","time domain body",names(extracteddata))
names(extracteddata) <- gsub("fbody","frequency domain body",names(extracteddata))
names(extracteddata) <- gsub("acc"," acceleration",names(extracteddata))
names(extracteddata) <- gsub("gyro"," gyroscope",names(extracteddata))
names(extracteddata) <- gsub("tgravity","time domain gravity",names(extracteddata))
names(extracteddata) <- gsub("fgravity","frequency domain gravity",names(extracteddata))
names(extracteddata) <- gsub("-mean\\()"," mean",names(extracteddata))
names(extracteddata) <- gsub("-std\\()"," standard deviation",names(extracteddata))
names(extracteddata) <- gsub("-x"," on the x axis",names(extracteddata))
names(extracteddata) <- gsub("-y"," on the y axis",names(extracteddata))
names(extracteddata) <- gsub("-z"," on the z axis",names(extracteddata))
names(extracteddata) <- gsub("jerk"," jerking motion",names(extracteddata))
names(extracteddata) <- gsub("mag"," magnitude",names(extracteddata))

## Grouping data by subject & activity

library(dplyr)
options(dplyr.width = Inf)

grouped <- group_by(extracteddata,subjects,activity)

## Creating tidy data of desired means

tidydataset <- summarise_each(grouped,funs(mean))

## Outputting final data set

print(tidydataset)
