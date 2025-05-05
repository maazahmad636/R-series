# In this notebook I will cover the R basics that you need to know in order to do anything in R:
a1<- "hello welcome to R programming"
print(a1) #in this way you can print your output

#1- Data types----

#there are four different type of data which are given below;

##1.1- Numeric data type----

#Numeric data contain real number which is either postive and negative and can be in decimal 
a2<- 10.23
a3<- 56+12
a4<- 13.33333
a5<-a4*4
###1.1.1- Find the class of data type----
class(a2)
typeof(a3) # this will show double because double is also special type of numeric data type
class(a4)

##1.2- Integer data type----

#Integer is whole number without decimal points. In R, you can explicitly define a varible as inteher by putting "L" with number
a6<- 12L
class(a6)

##1.3 Logical data type----

#The logical data type represents `TRUE` or `FALSE` values.

a7<- 5>3
a7
a8<- 9<8
a8
a9<- 100==100

class(a7)
class(a8)
class(a9)

### 1.3.1 Logical operation

#You can perform logical operations such as AND (`&`), OR (`|`), and NOT (`!`).

b1 <- TRUE
b2<- FALSE

# AND
print(b1 & b2)

# OR
print(b1 | b2)

# NOT
print(!b1)
print(!b2)
print(b1 & !b2)

##1.4 Character/String----

#The character data type is used to store text or strings. Character values must be enclosed in either single (`'`) or double (`"`) quotation marks.

b3<- "R is easy to learn"

class(b3)

#character can be concatenated  y ussing "paste()" function

b4<- "everything"
b5<- "is"
b6<-"possible"
paste(b4,b5,b6)

# "paste0" is special type of function which concatenate character without spaces.

paste0(b4,b5,b6)

## 1.5 Converting datatype----
b7<- 12.33
b8<-as.integer(b7) # this function convert the numeric data type into integer
class(b8)

b9<-c(TRUE, FALSE, TRUE)
class(b9)
b10<- as.numeric(b9)
class(b10)

#2-Data Structure----

##2.1 Vector----
#A vector is a sequence of elements of the same data type. It can be a sequence of numbers, characters, or logical values. Vectors are created using the `c()` function.

c1<- c(1,2,3,4,5) # this is numeric vector

c2<-c("you","will","succeed") # this is chacter vector

c3<-c(TRUE, FALSE, FALSE) # logical vector

#Vectors are one of the most commonly used data structures in R. You can access elements of a vector using square brackets.
c1[2] #accessing second element of vector
c1[c(1,2,4,5)] #accessing 1,2,4,5 element of vector
c1[2:5] #accessing from second to fifth element of vector

c2[3]
c3[1:2]

###2.1.1 Alternative way to create vectors:----
?seq
seq(from=2,to=10)
seq(from=100,to=50, by= -5) # "by" arugement means difference 
seq(1, 9, by = 2)

?rep
rep(1:100,2) # repeatinh 1 to 100 two times
rep(c("a","b","c"),3, each=2) #each element is repeated two time

## 2.2Matrices----
#A matrix is a two-dimensional collection of elements of the same data type. You can think of it as a table with rows and columns. You can create a matrix using the `matrix()` function.

c4<- matrix(1:9,nrow = 3,ncol = 3)
c5<- matrix(1:30, nrow = 3, ncol = 10,byrow=TRUE) # by default byrow is false 
 
###2.2.1- accessing the different element of marix----

c4[2,] # accessing the second row
c4[2,3] #accesssing the 2 row and 3 column element
c4[,1] #accessing the first column

c5[3,] #accessing the third row
c5[2,4] #accessing the 2 row and fouth column element

###2.2.2- Editing in the matrix:----

c5[2:3,5:6]<-0 #inserting 0 in 2 and 3 row and 5 and 6 columns

###2.2.3- Combining Matrices----
?cbind
cbind(c4,c5)# combine both matrix on the basis of column

rbind(c4,c5)# combine both matrix on the basis of rows
# The above code doesnot work because the rbind only work when number of column in both matrices in same 


t(c4) #t function is transpose which means it interchange rows into columns and vice versa. 

###-2.2.4- Deconstruction----

c(c5) # c function break down matrix into its original vector
