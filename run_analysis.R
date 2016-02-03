run_analysis <- function() {
  run_analysis.setup()
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