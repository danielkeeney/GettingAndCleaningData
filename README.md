# Getting and Cleaning Data Final Project
###### By Daniel Keeney

### Overview
**run_analysis.R** is a single script with several functions which performs the tasks described by the Getting and Cleaning Data course project.  The functions are:

#### run_analysis
This calls all the subsequent functions in the correct order, and returns the tidy data set.  This is the main entry point for this script.

#### run_analysis.libraries
This loads the required libraries which are needed later.

#### run_analysis.setup
This downloads the initial zip data file if it does not yet exist.  Then, if the unzipped folder does not exist, it attempts to unzip the zip file.  These operations are independent of each other, so if the download is skipped, it will still attempt to unzip.

#### run_analysis.load
This reads all the input data into data tables and then combines them together.  This includes adding the labels, subject, and activity information as well as combining the test and training data into a single data set.

#### run_analysis.filter
This filters the data such that only mean and standard deviation values are returned.

#### run_analysis.makeTidy
This runs some dplyr commands on the data to calculate the mean of all observations combined based on subject ID and activity.
