#------------------------------------------------
# Getting and Cleaning Data Course Project
#
# Author: Daniel Felipe Otero
#------------------------------------------------


#In this proyect we will clean the data of measurments carried by 30 volunteers.

run_analysis<-function()
{
  library(dplyr)
  
  features<- read.table("./UCI HAR Dataset/features.txt")
  features$V2<- tolower(features$V2)
  actlabels<-read.table("./UCI HAR Dataset/activity_labels.txt")
  
  #Creating the test data
  
  data<-read.table("./UCI HAR Dataset/test/X_test.txt")
  labels <- read.table("./UCI HAR Dataset/test/Y_test.txt")
  subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  l<-nrow(features)
  
  colnames(labels)[1]<-"Activity"
  
  l<-nrow(labels)
  
  for(i in 1:l)
  {
    labels[i,1]<- as.character(actlabels[labels[i,1],2])
  }
  
  mnstd<-grep("mean|std",features$V2)
  
  l<-length(mnstd)
  
  test<-labels
  
  for(i in 1:l)
  {
    test<-cbind(test,data[,mnstd[i]])
    colnames(test)[i+1]<-as.character(features[mnstd[i],2])
  }
  
  colnames(subjects)[1]<-"Subject"
  
  test<-cbind(subjects,test)
  
  #Creating the train data
  
  data<-read.table("./UCI HAR Dataset/train/X_train.txt")
  labels <- read.table("./UCI HAR Dataset/train/Y_train.txt")
  subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  l<-nrow(features)
  
  colnames(labels)[1]<-"Activity"
  
  l<-nrow(labels)
  
  for(i in 1:l)
  {
    labels[i,1]<- as.character(actlabels[labels[i,1],2])
  }
  
  mnstd<-grep("mean|std",features$V2)
  
  l<-length(mnstd)
  
  train<-labels
  
  for(i in 1:l)
  {
    train<-cbind(train,data[,mnstd[i]])
    colnames(train)[i+1]<-as.character(features[mnstd[i],2])
  }
  
  colnames(subjects)[1]<-"Subject"
  
  train<-cbind(subjects,train)
  
  data<-rbind(test,train)
 
  data<-aggregate(data,by=list(data$Subject,data$Activity),mean)
  
  finalData <- data.frame(data[,1],data[,2])
  colnames(finalData)[1]<-"Subject"
  colnames(finalData)[2]<-"Activity"
  
  l<- ncol(data)
  
  for (i in 5:l)
  {
    finalData<- cbind(finalData,data[,i])
    colnames(finalData)[i-2]<-names(data[i])
  }
  
  finalData
  
  write.table(finalData,"result.txt",row.name=FALSE)
  
}