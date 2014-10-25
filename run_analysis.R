## Pre-Requisite Step 1: It is assumed that you manually download files 
## from Assignment page and unzip into your desired dir (e.g. my working Dir below)

## Pre-Requisite Step 2: set working dir to be the location of the unzipped files
## e.g. setwd("C:/Users/Admin/Desktop/Coursera-GCD/UCI HAR Dataset") 

###########################################################################

## * Step 1: You may need to install the following R packages
if("dplyr" %in% rownames(installed.packages()) == FALSE) {install.packages("dplyr")};library(dplyr)

## Assumption!: All files we are reading were saved with a default write.table

## * Step 2: Read in Feature label set - Will use this for part 1 of the assignment
ovlFeatLabels <- read.table("./features.txt", col.names=c("Fnumber","Fname"), as.is=TRUE)

## * Step 3: Read in Activity labels - Will use this for part 3 of the assignment
ovlActLabels <- read.table("./activity_labels.txt", col.names=c("ActivityID","Activity"), as.is=TRUE)


## * Step 4: Construct the full Test Set
# Read in Activity Test Set
tstActivity <- read.table("./test/y_test.txt", col.names="ActivityID") 
# Read in Subject Test Set
tstSubject <- read.table("./test/subject_test.txt", col.names="Subject")
# Read in Feature data test set, assigning the Feature labels at the same time
tstFeatData <- read.table("./test/X_test.txt", col.names=ovlFeatLabels$Fname)
# add the single column sets to the main set to complete the overall Test set
tstData <- cbind(tstSubject,tstActivity,tstFeatData)
# Clear old dataframes from memory as no longer needed
rm(tstSubject,tstActivity,tstFeatData)

## * Step 5: Construct the full Training Set
# Read in Activity Training Set
trnActivity <- read.table("./train/y_train.txt", col.names="ActivityID") 
# Read in Subject Training Set
trnSubject <- read.table("./train/subject_train.txt", col.names="Subject")
# Read in Feature data Training set, assigning the Feature labels at the same time
trnFeatData <- read.table("./train/X_train.txt", col.names=ovlFeatLabels$Fname)
# add the single column sets to the main set to complete the overall Training set
trnData <- cbind(trnSubject,trnActivity,trnFeatData)
# Clear old dataframes from memory as no longer needed
rm(trnSubject,trnActivity,trnFeatData,ovlFeatLabels)

## * Step 6: Combine the two Sets. 
# *** REQUIREMENT 1 OF THE ASSIGNMENT ***
req1Data <- rbind(trnData,tstData)

# Clear old dataframes from memory, except the overall one
rm(trnData,tstData)


## * Step 7: Extract only the measurements on the mean and standard deviation for 
# each measurement the "." is there because I only want the "actual" mean measurements (see Note) 

# Note: I am deliberately not including the following measurements:
# - *meanFreq() measurements 
# Mean and mean frequency are two distinct measurements. 
# - angle(*Mean*) measurements
# the angle variables should also not be included as they are not strictly 
# means of a variable. They are variables composed of means
# My logic for this decision is based on my own opinion and the general views
# expressed in this thread: https://class.coursera.org/getdata-008/forum/thread?thread_id=149

# *** REQUIREMENT 2 OF THE ASSIGNMENT ***
req2Data <- req1Data[,c(grep("mean.",colnames(req1Data), fixed = TRUE), grep("std.",colnames(req1Data), fixed = TRUE))]


## * Step 8: Get a more logical dataframe
# Strictly speaking "req2Data" should be the requirement for part 2. However,
# I feel it is more logical to also include the Activity and Subject Columns in
# the data that I want to use for the rest of the assignment so I will do that below
meanstdData <- req1Data[,c(1:2, grep("mean.",colnames(req1Data), fixed = TRUE), grep("std.",colnames(req1Data), fixed = TRUE))]

## * Step 9: Merge in the activity labels, assigning a meaningful name to every ActivityID
req3Data <- merge(ovlActLabels,meanstdData,by="ActivityID",all=FALSE)

# Clear old dataframes from memory
rm(ovlActLabels,meanstdData)

## * Step 10: Remove the ID column as no longer needed, leaving us with just what we
# need to go forward 
## *** REQUIREMENT 3 OF THE ASSIGNMENT ***
req3Data <- subset(req3Data, select=-c(ActivityID))

## * Step 11: perform the tidy up of column names for Requirement 4
# Start by copying the dataframe from the last step
req4Data <- req3Data
# Remove all the dots in the column names to start 
names(req4Data) = gsub("\\.","",names(req4Data)) 
# Name the "time" variables - they start with 't'
names(req4Data) = sub("^t","time",names(req4Data))
# Name the "frequency" variables - they start with 'f'
names(req4Data) = sub("^f","frequency",names(req4Data))
# replace all occurrences of Acc, Gyro, Mag, std with full English words
names(req4Data) = gsub("Acc","accelerometer",names(req4Data))
names(req4Data) = gsub("Gyro","gyroscope",names(req4Data))
names(req4Data) = gsub("Mag","magnitude",names(req4Data))
names(req4Data) = gsub("std","standarddeviation",names(req4Data))
# after examining the data set, I saw theat some variables had what 
# appears to be a typo "BodyBody" - let's remove the duplicate portion too
names(req4Data) = sub("BodyBody","body",names(req4Data))
# finally ensure all column names are lowercased - this is recommended in week 4 lectures
# We are left with the descriptive variable names 
# *** REQUIREMENT 4 OF THE ASSIGNMENT ***
names(req4Data) <- tolower(names(req4Data))

# NOte: You might want to do a all(colSums(is.na(req4Data))==0) check here to verify there are no NAs before summarising

## * Step 12: group and summarize the data for Requirement 5
# Start by grouping the dataframe from the last step by Activity AND Subject
req5Data <- group_by(req4Data, activity, subject)
# We can then summarize the grouped table and get the mean for each grouping for every variable
# *** REQUIREMENT 5 OF THE ASSIGNMENT ***
req5Data <- summarise_each(req5Data, funs(mean))

## * Step 13: Write out the final tidy data set to the working directory
write.table(req5Data, file = "./req5Data.txt", row.names=FALSE)

# Step 14: Technically I think we should clear all of the requirement 
# dataframes from memory, as I've written the final output to a file, 
# but I'll leave it commented out for now
# rm(req1Data,req2Data,req3Data,req4Data,req5Data)