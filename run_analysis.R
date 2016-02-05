run_analysis <- function() {
  run_analysis.libraries()
  run_analysis.setup()
  allData <- run_analysis.load()
  meanAndStd <- run_analysis.filter(allData)
}

run_analysis.filter <- function(allData) {
  subset(allData, select = grepl("mean|std|^subject$|^activity$", names(allData)))
}

run_analysis.load <- function() {
  foldername <- "UCI HAR Dataset"
  # descriptions
  dataTitles <- fread(paste(foldername, "features.txt", sep="/"))$V2
  activityTitles <- fread(paste(foldername, "activity_labels.txt", sep="/"))$V2
  # test data
  test <- fread(paste(foldername, "test", "X_test.txt", sep="/"))
  subjectTest <- fread(paste(foldername, "test", "subject_test.txt", sep="/"))
  yTest <- fread(paste(foldername, "test", "y_test.txt", sep="/"))
  # training data
  train <- fread(paste(foldername, "train", "X_train.txt", sep="/"))
  subjectTrain <- fread(paste(foldername, "train", "subject_train.txt", sep="/"))
  yTrain <- fread(paste(foldername, "train", "y_train.txt", sep="/"))
  # label columns
  names(test) <- dataTitles
  names(train) <- dataTitles
  # add subject ids
  test$subject <- subjectTest
  train$subject <- subjectTrain
  # add activity titles
  test$activity <- activityTitles[yTest$V1]
  train$activity <- activityTitles[yTrain$V1]
  # combine test and training data
  collated <- rbind(test, train)
  collated
}

run_analysis.setup <- function() {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  filename <- "getdata-projectfiles-UCI HAR Dataset.zip"
  foldername <- "UCI HAR Dataset"
  if (!file.exists(filename)) {
    download.file(url, destfile = filename)
  }
  if (!file.exists(foldername)) {
    unzip(filename)
  }
}

run_analysis.libraries <- function() {
  library(data.table)
}