-> This code book contains the usage of the date in this project.

-> Explanation of Each Data File
    - features.txt: Names of the 561 features.
    - activity_labels.txt: Names and IDs for each of the 6 activities.
    - X_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers.
    - subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.
    - y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.
    - X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.
    - subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.
    - y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.
    
-> Ignored Data Files
    - Inertia Signals Files
    
-> Processing Steps
     1. Set the working directory.
     2. Create a R script and save to the project folder.
     3. Download the reshape2 package, install and load.
     4. Read the Data and Columns and Store to Variable.
     5. Add Column Name for Subject Train and Test.
     6. Manage COlumn Names for Measurement Files and Label Files.
     7. Combine Files and Dataset.
     8. Manage Mean and STD.
     9. Remove Unnecessary Columns.
     10. Convert to Factor.
     11. Create Tidy Dataset
     12. Generate CSV or Text File
