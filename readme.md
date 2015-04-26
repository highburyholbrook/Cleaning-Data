Getting and Cleaning Data - Course Project

Human Activity Recognition Using Smartphones Dataset

The first step in my analysis was to download the zip file of the dataset and
extract all of the text files into a directory called Project 1.  The working
directory was then set in R as Project 1.

I then read in all of the training and test text files, as well as the features
text file.

I then modified the names listed in the features file to be able to use them
as valid column names, as well as dropped them to be all lowercase.  I then
made the names in the features file become the column names for the x data.

After creating the column names for the values in x data (both training and test
data) I added the y-values data as well as the data for the subjects to the 
x data.  I then made sure to add descriptive column names for both the y and 
subject data.

Then I combined the test and the training data into one large data set.  After
combining the training and the test data into one large data set, I then 
updated the activity indicators with the actual English descriptions of what
the activity indicators were.  I basically hardcoded 1 to be Walking, 2 to be 
Walking Upstairs, and so on.  I know that there is a much better and more
elegant way to do this, but this was my solution for the time being.

After updating the Activity data, I then used the grep function to only return
the columns that I wanted for my tidy data set.  Those column were those which 
contained "std", "mean", "Activity", and "Subject".

Once I had the columns that I wanted, I then called the dplyr package in order
to group by and average my data by Activity and Subject.  Then I 
exported my new tidy data set to a text file called tidyset.