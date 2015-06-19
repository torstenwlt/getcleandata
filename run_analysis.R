# STEP 1: MERGE DATA SETS

TrainingDatapoints<-read.table("UCI HAR Dataset/train/X_train.txt")
TrainingActivities<-read.table("UCI HAR Dataset/train/y_train.txt")
TrainingSubjects<-read.table("UCI HAR Dataset/train/subject_train.txt")
TrainingData<-cbind(TrainingDatapoints, TrainingSubjects, TrainingActivities)

TestDatapoints<-read.table("UCI HAR Dataset/test/X_test.txt")
TestActivities<-read.table("UCI HAR Dataset/test/y_test.txt")
TestSubjects<-read.table("UCI HAR Dataset/test/subject_test.txt")
TestData<-cbind(TestDatapoints, TestSubjects, TestActivities)

CompleteData<-rbind(TrainingData, TestData)

# STEP 2: DESCRIPTIVE vARIABLE NAMES

Features<-read.table("UCI HAR Dataset/features.txt")

varnames<-Features[,2]
varnames<-as.character(varnames)
colnames(CompleteData) <- c(varnames, "subject", "activity")


# STEP 3: EXTRACT MEANS AND STANDARD DEVIATIONS
means<-grep("mean()", names(CompleteData), fixed=TRUE)
varnames[means]

stds<-grep(("std()"), names(CompleteData), fixed=TRUE)
varnames[stds]

mns_stds<-c(means,stds)

Data<-CompleteData[,c(mns_stds, 562, 563)]

# STEP 4: DESCRIPTIVE ACTIVITY NAMES

ActivityLabels<-read.table("UCI HAR Dataset/activity_labels.txt")
activity_description<-factor(Data$activity, labels=ActivityLabels$V2)

Data<-Data[,1:67]
Data<-cbind(Data, activity_description)

# STEP 5: Extract subdata

library("dplyr")

Data2<-Data %>% 
  group_by(subject, activity_description) %>% 
  summarise_each(funs(mean))

# STEP 6: Write final dataframt to txt file

write.table(Data2, file="courseproject_final.txt", row.names=FALSE)