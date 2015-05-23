
#Merges the training and the test sets to create one data set.

xtr<-read.table("train/X_train.txt")
xte<-read.table("test/X_test.txt")
merxt<-rbind(xtr,xte)

sub1 <- read.table("train/subject_train.txt")
sub2 <- read.table("test/subject_test.txt")
mersub <- rbind(sub1,sub2)

ytr <- read.table("train/y_train.txt")
yte <- read.table("test/y_test.txt")
meryt <- rbind(ytr,yte)

labels<-read.table("activity_labels.txt")

#Extracts only the measurements on the mean and standard deviation for each measurement. 

features<-read.table("features.txt")
index <- grep("mean()|-std()", features[, 2])
merxt2<-merxt[,index]
names(merxt2)<-features[index,2]

#Uses descriptive activity names to name the activities in the data set
names(meryt)<-"activity_label"      #names the activities identifier header
meryt[,1]=labels[meryt[,1],2]       #assigns the activity labels to the activities identified with an index from 1 to 6
names(mersub)<-"subjectID"          #names the subject id header

#Appropriately labels the data set with descriptive activity names.

#mersub contains the column with the subject id numbers
#meryt is the column with the activity labels  1 WALKING 
#                                              2 WALKING_UPSTAIRS
#                                              3 WALKING_DOWNSTAIRS
#                                              4 SITTING
#                                              5 STANDING
#                                              6 LAYING

cleandata<-cbind(mersub,meryt,merxt2)
write.table(cleandata,"cleandata.txt")

# From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.

subjects<-as.character(unique(mersub)[,1])
labels2<-as.character(labels[,2])
final<-cleandata[1:(6*length(subjects)),]
temp<-data.frame()
row=1

for (i in 1:length(subjects)){      #loops through all subjects
            
      for (j in 1:6){               #loops through all 6 activities
      temp<-cleandata[cleandata$subjectID==subjects[i] &          # Subsets data for subject i
                      cleandata$activity_label==labels2[j],]      # and activity j
      final[row,1]<-subjects[i]                                   # Adds subjectID
      final[row,2]<-labels2[j]                                    # Adds activity label
      final[row,3:ncol(temp)]<-colMeans(temp[,3:ncol(temp)])      # Calculates column means and 
                                                                  # adds them to "final" data frame
      row=row+1
      }
}
final[1:10, 1:5]

write.table(final,"final.txt")




