library(plyr)

# step 1: 
# Merges the training and the test sets to create one data set

# x is the test/training set
x_train <- read.table("train/X_train.txt") 
x_test <- read.table("test/X_test.txt") 
x_data <- rbind(x_train, x_test)

# y is the test/training label
y_train <- read.table("train/y_train.txt") 
y_test <- read.table("test/y_test.txt") 
y_data <- rbind(y_train, y_test)

subject_train <- read.table("train/subject_train.txt") 
subject_test <- read.table("test/subject_test.txt") 
subject_data <- rbind(subject_train, subject_test)
names(subject_data) <- "subject"
                      
# step 2: 
# Extracts only the measurements on the mean and standard deviation for each measurement
features<- read.table("features.txt")
ft_mean <- features[ grep("mean",features$V2) , ]
ft_std <- features[ grep("std",features$V2) , ]
ft_both <-  rbind(ft_mean, ft_std )
ft_both <-  arrange(ft_both, V1 )
selected_col <- as.numeric( ft_both$V1 )

# subset mean & std col
x_data <- x_data[ , selected_col ]
colnames(x_data) <- as.vector(ft_both$V2)

# step 3: 
# Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")

y_data <- merge(y_data, activities)
y_data[,1] <- y_data[,2]
y_data <- as.data.frame(y_data[,1])
names(y_data) <- "activity" 

# step 4: 
# Appropriately labels the data set with descriptive variable names

final_data <- cbind(x_data, y_data, subject_data)

# step 5: 
# create second, independent tidy data set with the average of each variable

tidy=aggregate( final_data, by=list(activity=final_data$activity, subject=final_data$subject), mean)
tidy <- tidy[ , 1:(ncol(tidy)-2)]

write.table(tidy, "tidy.txt")









