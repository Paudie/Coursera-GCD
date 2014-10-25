---
title: "CodeBook"
author: "Paudie"
date: "Tuesday, October 21, 2014"
---

This is a code book that describes 
1/ the original data, 
2/ any transformations or work performed to clean up the data
3/ the variables in the final tidy data set

# The original data source

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data Set Information

Summary:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


# Transformation details

There was done in 5 main parts: 
1. Combining of the training and test sets from the original files, including lablels from ancillary files provided
2. Extractin only the true mean and standard deviation measurements given from the combined data set
3. Using the descriptive activity names provided in another ancillary file to name the activities in the data set
4. The column names are tidied to give fully descriptive labels
5. A final, independent tidy data set is created by grouping the data by the 6 Activities (LAYING, SITTING, STANDING, WALKING, WALKING_UPSTAIRS, and WALKING_DOWNSTAIRS) and the 30 Subjects (people involved in the experiment), with the 66 value variables summarized to show the mean values of each

# Variables in the final data set
 [1] "activity" - (LAYING, SITTING, STANDING, WALKING, WALKING_UPSTAIRS, and WALKING_DOWNSTAIRS)                                               
 [2] "subject" - (ID of the person performing the activity, numeric 1:30)                                                 

All of the other variables listed below are numeric values representing the mean of this measurement from the original data for each Activity/Subject combination:  
 [3] "timebodyaccelerometermeanx"                          
 [4] "timebodyaccelerometermeany"                              
 [5] "timebodyaccelerometermeanz"                              
 [6] "timegravityaccelerometermeanx"                           
 [7] "timegravityaccelerometermeany"                           
 [8] "timegravityaccelerometermeanz"                           
 [9] "timebodyaccelerometerjerkmeanx"                          
[10] "timebodyaccelerometerjerkmeany"                          
[11] "timebodyaccelerometerjerkmeanz"                          
[12] "timebodygyroscopemeanx"                                  
[13] "timebodygyroscopemeany"                                  
[14] "timebodygyroscopemeanz"                                  
[15] "timebodygyroscopejerkmeanx"                              
[16] "timebodygyroscopejerkmeany"                              
[17] "timebodygyroscopejerkmeanz"                              
[18] "timebodyaccelerometermagnitudemean"                      
[19] "timegravityaccelerometermagnitudemean"                   
[20] "timebodyaccelerometerjerkmagnitudemean"                  
[21] "timebodygyroscopemagnitudemean"                          
[22] "timebodygyroscopejerkmagnitudemean"                      
[23] "frequencybodyaccelerometermeanx"                         
[24] "frequencybodyaccelerometermeany"                         
[25] "frequencybodyaccelerometermeanz"                         
[26] "frequencybodyaccelerometerjerkmeanx"                     
[27] "frequencybodyaccelerometerjerkmeany"                     
[28] "frequencybodyaccelerometerjerkmeanz"                     
[29] "frequencybodygyroscopemeanx"                             
[30] "frequencybodygyroscopemeany"                             
[31] "frequencybodygyroscopemeanz"                             
[32] "frequencybodyaccelerometermagnitudemean"                 
[33] "frequencybodyaccelerometerjerkmagnitudemean"             
[34] "frequencybodygyroscopemagnitudemean"                     
[35] "frequencybodygyroscopejerkmagnitudemean"                 
[36] "timebodyaccelerometerstandarddeviationx"                 
[37] "timebodyaccelerometerstandarddeviationy"                 
[38] "timebodyaccelerometerstandarddeviationz"                 
[39] "timegravityaccelerometerstandarddeviationx"              
[40] "timegravityaccelerometerstandarddeviationy"              
[41] "timegravityaccelerometerstandarddeviationz"              
[42] "timebodyaccelerometerjerkstandarddeviationx"             
[43] "timebodyaccelerometerjerkstandarddeviationy"             
[44] "timebodyaccelerometerjerkstandarddeviationz"             
[45] "timebodygyroscopestandarddeviationx"                     
[46] "timebodygyroscopestandarddeviationy"                     
[47] "timebodygyroscopestandarddeviationz"                     
[48] "timebodygyroscopejerkstandarddeviationx"                 
[49] "timebodygyroscopejerkstandarddeviationy"                 
[50] "timebodygyroscopejerkstandarddeviationz"                 
[51] "timebodyaccelerometermagnitudestandarddeviation"         
[52] "timegravityaccelerometermagnitudestandarddeviation"      
[53] "timebodyaccelerometerjerkmagnitudestandarddeviation"     
[54] "timebodygyroscopemagnitudestandarddeviation"             
[55] "timebodygyroscopejerkmagnitudestandarddeviation"         
[56] "frequencybodyaccelerometerstandarddeviationx"            
[57] "frequencybodyaccelerometerstandarddeviationy"            
[58] "frequencybodyaccelerometerstandarddeviationz"            
[59] "frequencybodyaccelerometerjerkstandarddeviationx"        
[60] "frequencybodyaccelerometerjerkstandarddeviationy"        
[61] "frequencybodyaccelerometerjerkstandarddeviationz"        
[62] "frequencybodygyroscopestandarddeviationx"                
[63] "frequencybodygyroscopestandarddeviationy"                
[64] "frequencybodygyroscopestandarddeviationz"                
[65] "frequencybodyaccelerometermagnitudestandarddeviation"    
[66] "frequencybodyaccelerometerjerkmagnitudestandarddeviation"
[67] "frequencybodygyroscopemagnitudestandarddeviation"        
[68] "frequencybodygyroscopejerkmagnitudestandarddeviation"
