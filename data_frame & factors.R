#1-Data frame----

#A data frame is a two-dimensional data structure that can hold different data types.

#Data frames are created using the `data.frame()` function.
?data.frame
df <- data.frame(
  PatientID = c(101, 102, 103),
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(29, 35, 42),
  Diagnosis = c("Diabetes", "Hypertension", "Asthma"),
  "Admission Date" = as.Date(c("2025-05-01", "2025-05-03", "2025-05-04")),
  row.names = NULL,
  check.rows = FALSE,
  check.names = TRUE,           # Converts "Admission Date" to "Admission.Date"
  fix.empty.names = TRUE,
  stringsAsFactors = FALSE
)

str(df) #structure of data frame
class(df) #show data type 

class(df[,2])
class(df[,3])
class(df[,5])

##1.1-Accessing Individual Elements----

df1<- df[1,3] # Accessing the element in the first row and third column
df1

df2<-df[,4] #Accessing the elements of fourth column
df2

df3<-df[2,"Name"]#Accessing 2 row and name column element
df3

##1.2- Accessing Columns----

#Use the `$` operator to access a single column.

d1<-df$PatientID
d1
d2<-df[["Name"]]
d2

##1.3-Access multiple columns----

d3<- df[ ,c(2, 3)] #Accessing col2 and col3 elements

d3
d3.1<-df[,c("Age","Diagnosis")]
d3.1
##1.4-Accessing Rows----
d4<-df[2,]
d4
##1.5-Accessing multiple rows----

d5<-df[c(2,3),]
d5

##1.6-Adding and removing columns----

df$stage<- as.integer(c(1,2,3)) # adding new column
df
df$stage<-NULL#  removing stage column
df

##1.7 concatenating data frame----

df <- data.frame(
  PatientID = c(101, 102, 103),
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(29, 35, 42),
  Diagnosis = c("Diabetes", "Hypertension", "Asthma"),
  "Admission Date" = as.Date(c("2025-05-01", "2025-05-03", "2025-05-04")),
  row.names = NULL,
  check.rows = FALSE,
  check.names = TRUE,           # Converts "Admission Date" to "Admission.Date"
  fix.empty.names = TRUE,
  stringsAsFactors = FALSE
)
d_f <- data.frame(
  PatientID = c(101, 102, 103),
  Test = c("Blood Sugar", "Cholesterol", "Lung Function"),
  Result = c(140, 190, 85),
  Unit = c("mg/dL", "mg/dL", "%"),
  stringsAsFactors = FALSE
)
  
d_f

merge_df<-merge(df,d_f,by="PatientID") # we can merge both data frame on the basis of one common column which is in this case is pateintID


combined_df <- rbind(df, d_f) # this code will not work here bacause the number of column is not same in both data frame.

#Ensure that both data frames have the same columns with the same names before using `rbind()`.
df6 <- data.frame(
  sample_id = c("Sample1", "Sample2", "Sample3"),
  time_point = c(4, 8, 16),
  metric1 = c(85, 90, 88))

df7 <- data.frame(
  metric2 = c(165, 175, 180),
  metric3 = c(0.7, 0.4, 0.2))

d8<-cbind(df6, df7) #`cbind()` combines data frames by columns, placing them side by side.

##1.8-handlinng with NA's values----

d9 <- data.frame(
  ID = c(1, 2, 3, 4),
  Name = c("Alice", NA, "Charlie", "David"),
  Age = c(25, 30, NA, 40),
  Diagnosis = c("Diabetes", "Asthma", NA, "Hypertension"),
  Score = c(88.5, NA, 92.0, 85.0),
  stringsAsFactors = FALSE
)

mean(d9$Age) # taking mean of age column as it conatin NA values will return NA as output 

d9.1<- is.na(d9) #this will show where NA is in data frame

d9.2<- na.omit(d9) #Remove rows with any `NA`s

d9.3 <- d9[!is.na(d9$Age), ] #Remove rows for which a specified column is `NA`.

d9$Name[is.na(d9$Name)] <- "mike" #Replace `NA`s with more meaningful values.
d9

d9$Age[is.na(d9$Age)] <- 0

d9$Diagnosis[is.na(d9$Diagnosis)]<-"unknown"
d9

##1.9-The `%in%` Operator----

#The %in% operator in R is used to test if elements of one vector are contained in another vector.

x <- c(1, 2, 3, 4, 5)
x %in% c(2, 4, 6)

df8 <- data.frame(Name = c("Ali", "Sara", "John", "Mary"), Age = c(23, 25, 22, 24))
df8[df$Name %in% c("Sara", "Mary"), ]
# Returns rows where Name is either Sara or Mary

x1<-data.frame(
  sample_id = c("Sample1", "Sample2", "Sample3"),
  disease = c("Autism", "ID","epilapsy"),
  age_of_patient = c(10, 32,7)
)

samples_of_interest <- c("Sample1", "Sample3")
df_subset <- x1[x1$sample_id %in% samples_of_interest, ]

df9<- data.frame(
  sample_id = c("Sample1", "Sample2", "Sample3"),
  time_point = c(4, 8, 16),
  metric1 = c(85, 90, 88)
)

columns_of_interest <- c("sample_id", "metric1")

df_subset <- df9[,colnames(df9) %in% columns_of_interest]
print(df_subset)

##2-factors----
?factor
# Creating a vector
y <-c("female", "male", "male", "female")
print(y)

# Converting the vector x into a factor 
# named gender
gender <-factor(y)
print(gender)

# Creating a factor with levels defined by programmer
gender_1<- factor(c("female", "male", "male", "female"),
                 levels = c("female", "transgender", "male"))
gender_1

print(is.factor(gender)) # checking for factor in R
class(gender_1)

##2.1- Accessing elements of a Factor in R

gender_1[3] #Accessing third element of factor
gender_1[c(1,3)] #Accessing 1 and 3 element of factor

#Subtracting one element from factor
gender_1[-2]

#Modification in factor

gender_1[2]<-"female"
gender_1



gender_2 <- factor(c("female", "male", "male", "female" ))

# add new level
levels(gender_2) <- c(levels(gender_2), "other") 
gender_2[3] <- "other"
gender_2

#factors in Data Frame

age <- c(40, 49, 48, 40, 67, 52, 53) 
salary <- c(103200, 106200, 150200,
            10606, 10390, 14070, 10220)
gender <- factor(c("male", "male", "transgender", 
            "female", "male", "female", "transgender"))
employee<- data.frame(age, salary, gender) 
print(employee) 
print(is.factor(employee$gender)) 


education_raw <- c("High School", "PhD", "Bachelors", "Masters", "Bachelors", "PhD", NA)
education_factor <- factor(
  x = education_raw,
  levels = c("High School", "Bachelors", "Masters", "PhD"),
  labels = c("HS", "UG", "PG", "Doctorate"),
  exclude = NA,
  ordered = TRUE
)

print(education_factor)

