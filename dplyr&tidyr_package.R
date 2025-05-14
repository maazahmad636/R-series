#1-dplyr pacakge----

install.packages("tidyverse") # install package

library(tidyverse) # activate package

data("mtcars") # built in data set in R
print(mtcars)

str(mtcars)
##1.1- select function----

sel_data <- dplyr::select(mtcars,mpg, cyl) ## Choose columns 'mpg' and 'cyl'

dplyr::select(mtcars, starts_with("d"))   # columns that start with "d"
dplyr::select(mtcars, ends_with("e"))     # columns that end with "e"
dplyr::select(mtcars, contains("a"))      # columns that contain "a"

dplyr::select(mtcars,-am) # remove the column "am"

##1.2- filter function----

#`filter()` : Select specific rows of a data frame based on conditions.

filtered_data <- filter(mtcars, cyl > 4) #Choose rows where 'cyl' is greater than 4.
print(filtered_data)

filter(mtcars, hp > 95, gear > 3)  # both conditions must be TRUE (AND logic)

filter(mtcars, mpg < 10 | drat > 3) # either condition can be TRUE

filter(mtcars, carb %in% c(2, 4)) # 2 and 4 values in carb column

filter(mtcars, !(vs > 0))  # same as vs <= 0

##1.3- Combining both select and filter function----

result <- mtcars %>%
  filter(qsec > 17) %>%
  dplyr::select(hp, gear)

print(result)

##1.4-mutate function----

# Add a new column 'kpl' (kilometers per liter) by modifying an existing column 'mpg'
mutated_data <- mutate(mtcars, kpl = mpg * 0.425144)
print(mutated_data)

# Use mutate to add multiple new columns
mtcars_modified <- mtcars %>%
  mutate(
    power_to_weight = hp / wt,
    efficiency = mpg / cyl
  )

# View the first few rows
head(mtcars_modified)
#view last few rows
tail(mtcars_modified)

#using ifelse function in muate function
mtcars_labeled <- mtcars %>%
  mutate(fuel_efficiency = ifelse(mpg > 20, "Efficient", "Inefficient"))

# View the first few rows
head(mtcars_labeled[, c("mpg", "fuel_efficiency")])

##1.5-summerize function----

#`summarize()`: Summarize the data to get aggregate statistics

# Calculate the minimum, average, and maximum 'mpg' for the entire dataset
summary <- summarize(mtcars, min_mpg = min(mpg), avg_mpg = mean(mpg), max_mpg = max(mpg))

##1.6-group_by function----

#`group_by()`: Group the data by one or more variables, usually used in conjunction with another function

# Group data by 'gear'
grouped_data <- group_by(mtcars, gear)

gd<-mtcars %>%
  group_by(cyl) %>%
  summarize(avg_mpg = mean(mpg))

gd1<-mtcars %>%
  group_by(cyl) %>%
  summarize(avg_hp = mean(hp))

gd2<-mtcars %>%
  group_by(gear) %>%
  summarize(count = n())

##2-tidyr package----

#The sole purpose of the tidyr package is to simplify the process of creating tidy data.


# Create a sample messy data frame
df <- data.frame(
  Name = c("Ali", "Sara", "John"),
  Math_2023 = c(85, 90, 78),
  Science_2023 = c(88, 94, 80),
  Math_2024 = c(89, 91, 83),
  Science_2024 = c(90, 96, 85)
)
print(df)

library(tidyverse)
?pivot_longer
# Pivot wider columns to longer format
long_data <- df %>%
  pivot_longer (
    cols = -Name,                         # all columns except 'Name'
    names_to = c("Subject", "Year"),      # split names into these two
    names_sep = "_",                      # split at underscore
    values_to = "Score"                   # values go into 'Score'
  )


wide_data <- long_data %>%
  pivot_wider(
    names_from = c(Subject, Year),   # new column names from these
    values_from = Score              # values from this column
  )

print(wide_data)

#3-Stringr----

#The stringr package in R (part of the tidyverse) provides a consistent and easy-to-use set of functions for string manipulation.

#### str_c means combining string----
str_c("bio", "tech", sep = "-")  # "bio-tech"

str_c("Item", 1:3)  # "Item1" "Item2" "Item3"

#### str_dup duplicate string----

str_dup("ha", 3)  # "hahaha"

#### str_split(): Split string by a pattern----

str_split("A-B-C", "-") # "A" "B" "C"

### str_flatten(): Flatten a list of strings----

str_flatten(c("a", "b", "c"), collapse = "-")  # "a-b-c"

### str_to_lower(), str_to_upper(), str_to_title()----

str_to_lower("HELLO")  # "hello"
str_to_upper("hello")  # "HELLO"
str_to_title("hello world")  # "Hello World"

###str_squish(): Remove extra spaces between words----

str_squish("  tidy   data ")  # "tidy data"

###str_replace_all(): Replace all matches----

str_replace_all("I love cats and cats", "cats", "dogs")
# "I love dogs and dogs"




