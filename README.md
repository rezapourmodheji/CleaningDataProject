# CleaningDataProject
---
## Reading the Data

The sets for both training and test data are read from two text files: `X_test.txt` and `X_train.txt`. X_test has 2947 measurements and X_train 7352. As anatcipated they both have measurements based on a number of features 561. `y_test.txt` and `y_train.txt` determines the activity each measurement is performed for. `subject_test.txt` and `subject_train.txt` determines the subjects as well. Therefore they all have 2947 and 7352 rows for test and trian accordingly.

---
## Merging the Data

It is required to have all measurements of test and train in one data frame. Thus the final data frame reflecting the emerging has a total measurement of 2947+7352=10299. This merge must be done for the activities and subjects as well.

---
## Merging the Data