#Set the working directory
#setwd("C:\\users\\{User}\\documents\\{project folder}")

#Create a R script and save to the project folder
#Download the reshape2 package, install and load
library(reshape2)

#Read the Data and Columns and Store to Variable
x_train <- read.table("X_train.txt")
x_test <- read.table("X_test.txt")
y_train <- read.table("y_train.txt")
y_test <- read.table("y_test.txt")
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")
featureNames <- read.table("features.txt")
activityLabels <- read.table("activity_labels.txt")

#Add Column Name for Subject Train and Test
names(subject_train) <- "SubjectID"
names(subject_test) <- "SubjectID"

#Manage COlumn Names for Measurement Files and Label Files
names(x_train) <- featureNames$V2
names(x_test) <- featureNames$V2
names(y_train) <- "Activity"
names(y_test) <- "Activity"

#Combine Files and Dataset
combinedTrain <- cbind(subject_train, y_train, x_train)
combinedTest <- cbind(subject_test, y_test, x_test)
combinedTrainAndTest <- rbind(combinedTrain, combinedTest)

#Manage Mean and STD
meanSTDCols <- grepl("mean\\(\\)", names(combinedTrainAndTest)) | grepl("std\\(\\)", names(combinedTrainAndTest))
meanSTDCols[1:2] <- TRUE

#Remove Unnecessary Columns
combinedTrainAndTest <- combinedTrainAndTest[, meanSTDCols]

#Convert to Factor
combinedTrainAndTest$Activity <- factor(combinedTrainAndTest$Activity, labels=activityLabels$V2)

#Create Tidy Dataset
melted <- melt(combinedTrainAndTest, id=c("SubjectID","Activity"))
tidy <- dcast(melted, SubjectID+Activity ~ variable, mean)

#Generate CSV File
write.csv(tidy, "tidy.csv", row.names=FALSE)
#Generate Text File
write.table(tidy, "tidy.txt", row.names=FALSE)