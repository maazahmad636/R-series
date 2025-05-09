#1- Conditional statement----

#this statement uses "if" and "else if" function. The "if" is used to specify a block of code to be executed if a condition is TRUE
# The else if saying "if the previous conditions were not true, then try this condition"

score<- 78 # change with any number you want;
if(score>=80){
  grade<- "A"
} else if(score>=75){
  grade<-"B+"
} else if(score>=70){
  grade<-"B"
} else if(score>=65){
  grade<-"C+"
} else{
  grade<-"F"
}
print(paste("the grade of student is", grade))

age<- 5

if(age==5){
  remarks<-"he/she needs to admitt in school"
} else if(age>=4){
  remarks<-"he/she will be admitt in next year"
} else if(age>=3){
  remarks<-"its early for him/her"
} else{
  remarks<-"child need parental care"
}
print(remarks)

#2-Regular Expressions----
#A regular expression, often denoted as regex or regexp, is a sequence of characters that defines a search pattern.

##2.1-grepl() function----
#grepl(pattern, x) searches for matches of a pattern within a vector x and returns a logical vector indicating whether a match was found in each element.

text <- "Hello, world!"
grepl("Hello", text)

##2.2-gregexpr() function----
#gregexpr(pattern, text) finds all matches of a pattern within a string and returns their positions as a list.

text_1 <- "abc def ghi"
matches <- gregexpr("...", text_1)
regmatches(text_1, matches)

text_2 <- "apple banana cherry"
matches <- gregexpr("a[ep]|ch", text_2)
regmatches(text_2, matches)

text_4 <- "start middle end"
matches <- gregexpr("^start|end$", text_4)
regmatches(text_4, matches)

text_5<- "aaab ab abb"
matches <- gregexpr("ab*", text_5)
regmatches(text_5, matches)

text_6 <- "Today is sunny."
sub("sunny", "cloudy", text_6)  # Replaces "sunny" with "cloudy"
gsub("[aeiou]", "*", text_6)  # Replaces vowels with *

sentence <- "Hello, world!"
words <- strsplit(sentence, ",")[[1]]  # Splits the string at ","
words

#3-loops----

for (i in 1:10){
  print(i^2)
  
}

x<- c(10:20)
for (i in x){
  print(c(x,x^2))
}

for(i in 1990:2020){
  print(i)
}

for (i in 1990:2000){
  print(paste("This year is",i))
}

fruit<- c("mango","apple","organe","banana")
for(i in fruit){
  print(paste("l love",i,"juice"))
}

y<- as.numeric(rep(0,20))
for(i in 1:20){
  y[i]=i^2
}
print(y)

y<- as.numeric(rep(0,20))
for(i in 10:20){
  y[i]=i^2
}
y

z<-10:20
container<-numeric(length(z))
for(i in 1:length(z)){
  container[i]=z[i]^2
}

container

##3.1 Alternative of loop function---- 

# the apply family which has (apply, lapply, tapply and sapply) are used as an alternative of loop 

data("mtcars") # load the data

str(mtcars) # to check the structure of data

# if have to mean of each column in data set if have to take of each column separately or use for loop for this statement
mean(mtcars$mpg)
mean(mtcars$cyl)

# but we can do this through apply family function eaisly. 
###3.1.1-apply function----
?apply
apply(mtcars,2,mean) # means of all column can be find

apply(mtcars,2,min) # give the sum of all rows 

apply(mtcars,2,max)

mtcars[2,2]<-NA
mtcars

apply(mtcars,2,mean) # cloumn 2 give NA because in column 2 one element is NA, therefore apply doesnot work with NA values.

# to remove NA value from dataset

apply(mtcars,2,mean,na.rm=TRUE)

data("ChickWeight")
str(ChickWeight)

apply(ChickWeight,2,mean) # It gives warning message beacause of factors

apply(ChickWeight[,c(1,2)],2,mean)

apply(ChickWeight[,-c(3,4)],2,mean) # another way to write the above function.

###3.1.2-tapply function----
?tapply
#the tapply() function is used to apply a function to subsets of a vector, grouped by one or more factors.


# mean of weight column of ChickWeight based on Diet 
tapply(ChickWeight$weight, ChickWeight$Diet, mean)

tapply(ChickWeight$Time,ChickWeight$Diet,mean)

###3.1.3-lapply----

#lapply() is a function used to apply a function to each element of a list or vector and return the results as a list.

numbers <- list(a = 1:3, b = 4:6)

lapply(numbers,mean)

###3.1.4-sapply function----

#sapply() is a function that works like lapply(), but it tries to simplify the output.

df <- data.frame(a = 1:5, b = c(2, 4, 6, 8, 10))

sapply(df, mean)

names <- c("Ali", "Sara", "Jonathan")
sapply(names, nchar)



