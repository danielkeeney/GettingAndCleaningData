# CodeBook
###### By Daniel Keeney

### The Data
The data used here are measurements taken from accelerometers worn by subjects while they performed various activities.  The initial data had raw values already normalized between [-1,1] for each observation as well as mean and standard deviation values calculated from these raw values.  The initial data was split into test and training data sets, but for this project they have been combined into a single data set.

### The Variables
This tidy dataset only contains the mean and std values, as well as subject ID and activity name.

### Transformations
The activity IDs have been replaced with activity names.  All observations have been combined per subject/activity pair and calculated the mean.
