##Loading the data 
labels = read.csv("activity_labels.txt", header = FALSE, sep="")
features = read.csv("features.txt", sep=" ", header = FALSE)

testx = read.csv("X_test.txt", sep = "", header = FALSE)
trainx = read.csv("X_train.txt", sep="", header = FALSE)

testy = read.csv("y_test.txt", sep ="", header = FALSE)
trainy = read.csv("y_train.txt", header = FALSE)

subjecttest = read.csv("subject_test.txt", header = FALSE)
subjecttrain = read.csv("subject_train.txt", header = FALSE)

##Combining the test and train data
y = rbind(trainy, testy)
subject = rbind(subjecttrain, subjecttest)
x = rbind(trainx, testx)

##Removing the indivdual test and train data sets to clear the memory
#remove(subjecttrain, subjecttest, trainx, testx, trainy, testy)

##Adding the subject and lables column to the activity data
Data = cbind(y, subject, x)
##Adding column names, y = Activity (walking, etc), Subject is the person, and the rest of the columns are the features 
colnames(Data) = c("Activity", "Subject", as.character(features[,2]))
CleanData = Data[,!duplicated(colnames(Data))]
CleanData = cbind(select(CleanData, matches("Activity", ignore.case = TRUE)), select(CleanData, matches("Subject", ignore.case = TRUE)), select(CleanData, contains("mean()", ignore.case = TRUE)),select(CleanData, contains("std()", ignore.case = TRUE))) 


CleandData = as.data.table(CleanData)
CleanData$Activity = as.character(CleanData$Activity)
##Applying the label names to each activity
CleanData$Activity = gsub("1", "Walking", CleanData$Activity)
CleanData$Activity = gsub("2", "WalkingUpstairs", CleanData$Activity)
CleanData$Activity = gsub("3", "WalkingDownstairs", CleanData$Activity)
CleanData$Activity = gsub("4", "Sitting", CleanData$Activity)
CleanData$Activity = gsub("5", "Standing", CleanData$Activity)
CleanData$Activity = gsub("6", "LayingDown", CleanData$Activity)

##Averaging the data over each person over each activity.
tidy = aggregate(CleanData[,3:68], by = CleanData[,1:2], mean)

write.table(tidy, file = "tidydata.txt", row.name = FALSE)







