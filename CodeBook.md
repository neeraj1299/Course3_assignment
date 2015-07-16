Introduction

The script run_analysis.R performs the 5 steps described in the course project's definition.

Variables
1. x_train to read from x_train.txt
2. x_test to read from  x_test.txt
3. y_train to read from y_train.txt
4. y_test to read from  y_test.txt
5. subject_train to read from subject_train.txt
6. subject_test to read from  subject_test.txt
7. x_data binds x_train and x_test
8. y_data binds y_train and y_test
9. subject_data binds subject_train and subject_test



Steps:
1.  rbind similar data i.e x_train & x_test etc... 
2.  Then, pick only those columns (from merged dataset) that are related to mean and standard deviation measures 
3.  get correct labels from features and activity text file and apply to relevant dataset
4.  on this final dataset, apply aggregate function to group by acitivity abd subject
5. store the data computed in tidy.txt


Used plyr package to action this


