rm(list=ls())
cat("\014")

set_test <- read.table("/Users/Reza/Downloads/Cleaning_Data/Week_4/Project/UCI HAR Dataset/test/X_test.txt")
dim(set_test)
act_test <- read.table("/Users/Reza/Downloads/Cleaning_Data/Week_4/Project/UCI HAR Dataset/test/y_test.txt")
dim(act_test)
subject_test <- read.table("/Users/Reza/Downloads/Cleaning_Data/Week_4/Project/UCI HAR Dataset/test/subject_test.txt")
dim(subject_test)
set_train <- read.table("/Users/Reza/Downloads/Cleaning_Data/Week_4/Project/UCI HAR Dataset/train/X_train.txt")
dim(set_train)
act_train <- read.table("/Users/Reza/Downloads/Cleaning_Data/Week_4/Project/UCI HAR Dataset/train/y_train.txt")
dim(act_train)
subject_train <- read.table("/Users/Reza/Downloads/Cleaning_Data/Week_4/Project/UCI HAR Dataset/train/subject_train.txt")
dim(subject_train)

features <- read.table("/Users/Reza/Downloads/Cleaning_Data/Week_4/Project/UCI HAR Dataset/features.txt")
dim(features)

## ----------------------------------------------------------------------------------------------
# body_acc_x_test <- read.table("/Users/Reza/Downloads/Cleaning_Data/Week_4/Project/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
# dim(body_acc_x_test )



# set_test <- mutate( set_test, dummy=seq(1,dim(set_test)[1]))
# set_train <- mutate( set_train, dummy=seq( dim(set_test)[1]+1 , dim(set_train)[1] + dim(set_test)[1] )  )
# 
# act_test <- mutate( act_test, dummy=seq(1,dim(act_test)[1]))
# act_train <- mutate( act_train, dummy=seq( dim(act_test)[1]+1 , dim(act_train)[1] + dim(act_test)[1] )  )
# 
# subject_test <- mutate( subject_test, dummy=seq(1,dim(subject_test)[1]))
# subject_train <- mutate( subject_train , dummy=seq( dim(subject_test)[1]+1 , dim(subject_train)[1] + dim(subject_test)[1] ) )

set_merged <- rbind(set_train,set_test)
act_merged <- rbind(act_train,act_test)
subject_merged <- rbind(subject_train,subject_test)
# set_merged <- merge(set_train,set_test,all = TRUE)
## ----------------------------------------------------------------------------------------------
# act_merged <- merge(act_train,act_test,all = TRUE)
# subject_merged <- merge(subject_train,subject_test,all = TRUE)
# 
# set_merged <- select(set_merged,-dummy)
# act_merged <- select(act_merged,-dummy)
# subject_merged <- select(subject_merged,-dummy)
features <- features$V2

meanstd_flag <- grep ("mean|std",features)
set_meanstd <- set_merged[,meanstd_flag]
features_names <- as.character(features[meanstd_flag])
features_names <- c(features_names,"Activity")

## ----------------------------------------------------------------------------------------------
activities <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
nameact <- function(x){
  if (x==1) x="WALKING"
  if (x==2) x="WALKING_UPSTAIRS"
  if (x==3) x="WALKING_DOWNSTAIRS"
  if (x==4) x="SITTING"
  if (x==5) x="STANDING"
  if (x==6) x="LAYING"
  x
}

## ----------------------------------------------------------------------------------------------

act_labeled <- sapply(act_merged[,1],nameact)
set_meanstd_bind <- cbind(set_meanstd,act_labeled)

## ----------------------------------------------------------------------------------------------

colnames(set_meanstd_bind) <- features_names
set_merged_f <- set_meanstd_bind[ , c (ncol(set_meanstd_bind) , 1:(ncol(set_meanstd_bind)-1) )]
colnames(set_merged_f)[1]<-"Activity"
set_merged_f2 <- cbind(set_merged_f,subject_merged)
set_merged_f3 <- set_merged_f2[ , c (ncol(set_merged_f2) , 1:(ncol(set_merged_f2)-1) )]
colnames(set_merged_f3)[1]<-"Subject"
set_merged_sub_sort <- arrange(set_merged_f3,Subject,Activity)
empty <- filter(set_merged_sub_sort[,3:ncol(set_merged_sub_sort)], Subject==31)
empty2 <- filter(set_merged_sub_sort, Subject==31)
empty3 <- filter(set_merged_sub_sort, Subject==31)


for (i in 1:30){
  grouped <- filter( set_merged_sub_sort, Subject==i )
  
  for( j in activities){
    groupedf <- filter( grouped , Activity==j )
    finall <- sapply( groupedf[,3:ncol(groupedf)], mean )
    empty3[1,] <- c(i,j,finall)
    empty2 <- rbind(empty2,empty3)
  }
}

independent_data <- empty2

write.table(independent_data , file = "./independent_data.txt" , quote = FALSE , row.names = FALSE )
write.table(independent_data , file = "./independent_data.csv" , quote = FALSE , row.names = FALSE )

# dim(set_merged)
# dim(act_merged)
# dim(subject_merged)
# dim(set_meanstd )
# dim(set_meanstd_bind)
