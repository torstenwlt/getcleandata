README

The analysis file proceeds in 6 steps:

1) Merge the training and test data sets

First the different components of the training data are read and put together.
Then the same procedure is repeated for the test data.
Finally training and test data are put together.


2) Adding descriptive variable names

The variable names are read from the features.txt file and assigned to the columns of the dataframe create in step 1.
Two columns names are assigned manually.


3) Select columns with means and standard deviations of the measures

First, all the variables (columns) containing means and standard deviations are determined.
Then the subset of the data consisting these columns as well the the variables activity and subject are extracted.


4) Adding descriptive activity names

The activity names are read. Then from the activity variable a factor variable using those names as labels is created.
Finally the newly created variable "activity_description" is added to the data frame while "activity" is dropped.


5) A data set with the average of each variable for each activity and each subject is created from the data set from step 4

The dplyr package is used to subset and summarize the data accordingly.

6) The data set from step 5 is written to a txt file

