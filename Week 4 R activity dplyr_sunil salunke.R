#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice
HairEyeColor_df <- as.data.frame(HairEyeColor)

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(HairEyeColor_df)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")

library(dplyr)

#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)
HairEyeColor_df %>% select(Hair,Sex)

#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as a new dataset
#and give it a name
HairSex_df <- HairEyeColor_df %>% select(Hair,Sex)

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
HairSex_df %>% select(-Sex)

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'
HairEyeColor_df %>% rename(gender = Sex)

#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
HairEyeColor_df_new <- HairEyeColor_df %>% rename(gender = Sex) 
HairEyeColor_df_new
#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
HairEyeColor_df_new %>%  filter(gender == 'Male')
HairEyeColor_df_new_males <- HairEyeColor_df_new %>%  filter(gender == 'Male')

#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)
HairEyeColor_df_new %>%  group_by(gender)

#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#After you run it, write the total here: 592
total=mutate(HairEyeColor_df_new, total=cumsum(Freq))
total

#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
HairEyeColor_df_new %>%  filter(gender == 'Female')
HairEyeColor_df_new_females <- HairEyeColor_df_new %>%  filter(gender == 'Female')

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
HairEyeColor_df_new_males_females <- union(HairEyeColor_df_new_males, HairEyeColor_df_new_females)
HairEyeColor_df_new_males_females

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
HairEyeColor_df_new_males_females %>% group_by(gender) %>% summarise(avg = mean(Freq))
#this gives average male vs female freq. it shows average female freq is higher than male freq.
