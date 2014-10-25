Coursera-GCD
============

Getting and Cleaning Data Project:

Below are the high-level steps that should be followed to get the data
and run the script (run_analysis.R) that produces a final tidy data set

# Step 1: It is assumed that you manually download files from the below URL and unzip into your desired dir (e.g. my working Dir below in Step 2)
Download and Unzip the source data from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Step 2: Put/download run_analysis.R into your working dir

# Step 3: Using R/RStudio; set working dir to be the location of the unzipped files
e.g. setwd("C:/Users/Admin/Desktop/Coursera-GCD/UCI HAR Dataset") 

# Step 4: source("run_analysis.R")
This will run the R script, reading in various files from the downloaded datasets and creating 5 distinct data frames - 1 for each deliverable of the assignment

They will be: 
- req1Data - 10299 x 563 data frame (a comination of the training and test sets from the original, with labels)
- req2Data - 10299 x 66 data frame (being only the true mean and standard deviation measurements from req1Data)
- req3Data - 10299 x 68 data frame (being req2Data, with the DESCRIPTIVE Activity and subject ID attributes added at the start of the frame)
- req4Data - 10299 x 68 data frame (is the same as req3Data, except the column names are tidied to give fully descriptive labels)
- req5Data - 180 x 68 grouped data frame (being req4Data grouped by the 6 Activities (LAYING, SITTING, STANDING, WALKING, WALKING_UPSTAIRS, and WALKING_DOWNSTAIRS) and the 30 Subjects (people involved in the experiment), with the 66 value variables summarized to show the mean values of each)

These may not necessarily be required, but they are useful to follow the logic of the assignment

The final output is a text file from the req5Data set. It is written to the below file
req5Data.txt

The script will run for up to a minute but it depends on your machine.

# Step 5: Technically I think we should clear all of the requirement dataframes from memory
rm(req1Data,req2Data,req3Data,req4Data,req5Data)