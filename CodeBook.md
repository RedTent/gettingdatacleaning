# Code book

This is a description of the dataset in `tidy_data_tot`.

## Transformations

1. The following fileshave been read into dataframes with the same names (but without the .txt):
    - features.txt
    - activity_labels.txt
    - train/X_train.txt
    - train/y_train.txt
    - train/train_subject.txt
    - test/X_test.txt
    - test/y_test.txt
    - test/test_subject.txt
2. the features in X_test and X_train have been given the names from features.txt
3. the labels from y_test and y_train have been given the name `activity_code`.
4. the subjects from subject_test and subject_train haven been given the name `subject`.
5. the data in activity_labels haven been given the names `acitvity_code` and `activity_label`.
6. the columns in the ..._test and ..._train dataframes have been combined into `test` and `train`.
7. the rows in `train` and `test` have been combined into a single dataframe: `combined`.
8. `combined` was left-joined with `activity_labels` to add the names of the activities.
9. The columns containing, `subject`, `activity_label`, `*mean()*` and `*std()*` where selected.



## Variables

### Labels

- `subject`
    - an identifier for the subject the subject who performed the activity. Its range is from 1 to 30. 
    
- `activitity_label`
    - The name of the activity

### Features (measurements)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

**Note:** Features are normalized and bounded within [-1,1].

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated and selected from these signals are: 

- mean(): Mean value
- std(): Standard deviation