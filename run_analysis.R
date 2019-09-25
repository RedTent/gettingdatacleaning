# You should create one R script called run_analysis.R that does the following.
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
# 

library(tidyverse)

#loading data
feature_names <- read_lines("data/features.txt")
activity_labels <- read_fwf("data/activity_labels.txt", col_positions = fwf_empty("data/activity_labels.txt"))

x_train <- read_fwf("data/train/X_train.txt", col_positions = fwf_empty("data/train/X_train.txt"))
y_train <- read_fwf("data/train/y_train.txt", col_positions = fwf_empty("data/train/y_train.txt"))
subject_train <- read_fwf("data/train/subject_train.txt", 
                          col_positions = fwf_empty("data/train/subject_train.txt"))

x_test <- read_fwf("data/test/X_test.txt", col_positions = fwf_empty("data/test/X_test.txt"))
y_test <- read_fwf("data/test/y_test.txt", col_positions = fwf_empty("data/test/y_test.txt"))
subject_test <- read_fwf("data/test/subject_test.txt", 
                          col_positions = fwf_empty("data/test/subject_test.txt"))


# set names
names(x_test) <- feature_names
names(x_train) <- feature_names

names(y_train) <- "activity_code"
names(y_test) <- "activity_code"

names(subject_train) <- "subject"
names(subject_test) <- "subject"

names(activity_labels) <- c("activity_code", "activity_label")

# combine the dataframes into one
train <- bind_cols(subject_train, y_train, x_train)
test <-  bind_cols(subject_test, y_test, x_test)

combined <- bind_rows(train, test)


# add label names and extract mean and std dev
tidy_data_tot <- 
  combined %>% 
  left_join(activity_labels, by = "activity_code") %>% 
  select(contains("subject"), 
         contains("activity_label"), 
         contains("mean()"), 
         contains("std()"))

tidy_data_means <- 
  tidy_data_tot %>% 
  group_by(subject, activity_label) %>% 
  summarise_all(mean)

