## Create the table
library(dplyr)
## Load all required data files
stest = read.table("subject_test.txt")
Xtest =  read.table("X_test.txt")
ytest = read.table("y_test.txt")
Test = cbind(stest,Xtest,ytest)
ssubject = read.table("subject_train.txt")
Xsubject = read.table("X_train.txt")
ysubject = read.table("y_train.txt")
Subject = cbind(ssubject,Xsubject,ysubject)
## Load activity labels and features
activitylabs = read.table("activity_labels.txt")
features = read.table("features.txt")
## Create totals for X, Y & Subject to be used later
XCon = rbind(Xsubject,Xtest)
YCon = rbind(ysubject,ytest)
SubCon = rbind(ssubject,stest)
## Extract the mean and standard deviation from each measurement
wantfeatures = features[grep("mean\\(\\)|std\\(\\)", features[,2]),]
XCon = XCon[,wantfeatures[,1]]
## Name activities in data set
colnames(YCon) = "activity"
YCon$activitylabel = factor(YCon$activity, labels = as.character(activitylabs[,2]))
nactivitylabs = YCon[,-1]
## Label data set with descriptive variable names
colnames(XCon) = features[wantfeatures[,1],2]
## Creation of tidy independent data set
colnames(SubCon) = "subject"
NTestSubject = cbind(XCon, nactivitylabs,SubCon)
NTestSubjectmean = NTestSubject %>% group_by(nactivitylabs, subject) %>% summarize_each(funs(mean))
write.table(NTestSubjectmean, file = "tidydata.txt", row.names = FALSE, col.names = TRUE )