##Unzipped all files from the zip file and placed them into a folder called Project1##
setwd("C:/Users/Holbrook/data-science-coursework/Getting and Cleaning Data/Project 1")
##Reading in training data##
x_train <- read.table("x_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

##Reading in test data##
x_test <- read.table("x_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

##Reading in features##
features <- read.table("features.txt")

##Make features a factor variable##
new_features <- features[,2]

##Removing invalid characters from features##
new_features <- gsub("[^A-Za-z0-9]", "", new_features)
new_features <- tolower(new_features)

##Making column names for x_train##
colnames(x_train) <- new_features

##Making column names for x_test##
colnames(x_test) <- new_features

##Combining training data##
train <- cbind(y_train, x_train)
train <- cbind(subject_train, train)

##Updating column names for training data set##
colnames(train)[1] <- "Subject"
colnames(train)[2] <- "Activity"

##Combining test data##
test <- cbind(y_test, x_test)
test <- cbind(subject_test, test)

##Updating column names for test data##
colnames(test)[1] <- "Subject"
colnames(test)[2] <- "Activity"

##Combining test and training data##
data <- rbind(train, test)

##Converting Activity code to Activity Name##
data$Activity <- replace(data$Activity, data$Activity == 1, "Walking")
data$Activity <- replace(data$Activity, data$Activity == 2, "Walking Upstairs")
data$Activity <- replace(data$Activity, data$Activity == 3, "Walking Downstairs")
data$Activity <- replace(data$Activity, data$Activity == 4, "Sitting")
data$Activity <- replace(data$Activity, data$Activity == 5, "Standing")
data$Activity <- replace(data$Activity, data$Activity == 6, "Laying")

##Selecting only the columns I want with Subject, Activity, mean and standard dev##
select_data <- data[,grep("mean|std|Subject|Activity", names(data))]

##Calling dplyr package##
library(dplyr)

##Grouping my select data by Subject and Activity##
grouped <- select_data %>% group_by(Subject, Activity)

##Taking the mean of each column by Subject and Activity##
tidy_set <- grouped %>% summarise_each(funs(mean))

##Writing tidy_set to text file##
write.table(tidy_set, file = "tidyset.txt", row.names = FALSE)
