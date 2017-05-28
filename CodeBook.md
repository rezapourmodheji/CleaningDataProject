# Cleaning Data Project
---
## Reading the Data

The sets for both training and test data are read from two text files: `X_test.txt` and `X_train.txt`. X_test has 2947 measurements and X_train 7352. As anatcipated they both have measurements based on a number of features 561. `y_test.txt` and `y_train.txt` determines the activity each measurement is performed for. `subject_test.txt` and `subject_train.txt` determines the subjects as well. Therefore they all have 2947 and 7352 rows for test and trian accordingly.

---
## Merging and Naming the Data

It is required to have all measurements of test and train in one data frame. Thus the final data frame reflecting the emerging has a total measurement of 2947+7352=10299. This merge must be done for the activities and subjects as well. Then two columns are added to this data frame. `Subject` representing the subject the second one `Activity` for the activity. Then the names of the activities replaced the numbers which were representing the activity by `activity_labels.txt`.

---
## Extracting the data with mean and std

The features with the properties of mean and standard deviation has been detected and pulled out from `features.txt`. 79 features are detected. So based on this detection the data merged from the previous step is filtered.

---
## Average of each features for each activity and each subject

First the data is grouped by each subject and then by the activity. After two consequent grouping the mean value of each feature calculated. Therefore for each subject and each activity there are 79 avarage value. At the end these 79 values are calculated for every 30 subjects and 6 activities which are totally 180 measuremnts. This new data frame has been saved in a file named `independent_data`.

---
## Writing the data

The final version of the data containing the average of the specific features with 180 rows and 81 columns are written in the file `independent_data.csv`.

### Rows
* Each row is a associated with different subjects under different activities.

### Columns

* `Subject`: It indicates the subject (volunteer) on which the measurement has been carried. The measurements are perforemed on 30 subjects. This column is sorted from subject 1 to 30.
* `Activity`: The activity under which the subject is tested. There are six activities:
"WALKING"
"WALKING_UPSTAIRS"
"WALKING_DOWNSTAIRS"
"SITTING"
"STANDING"
"LAYING"
* All the rest are the avarege of the feastures which are mean or standard deviation of measurements. The list of the features can be found `features.txt` and more information about the features can be found in `features_info.txt`



---
