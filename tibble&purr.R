library(tidyverse)

# Create a sample tibble from individual vectors
my_tib <- tibble(
  Id=1:4,
  Name = c("Sandip", "Gaurav", "Ram", "Pratik"),
  Age = c(25, 29,30, 35),
  Role = c("Engineer", "Data Scientist", "Developer", "HR"),
  Salary = c(45000,60000, 80000, 100000)
)

print(my_tib)  

library(tibble)

# Create a tibble using tribble
my_tib1 <- tribble(
  ~country,  ~sex,  ~status,  ~age,
  "pakistan","male","married",21,
  "china", "female","unmarried",11,
  "afg","male","umnarried",18,
  "turkyie","male","married",34,
)

print(my_tib1)

#Using as_tibble function

# Create a data frame
df <- data.frame(
  name = c("Saurabh", "Prasad", "Manohar"),
  age = c(25, 30, 35),
  city = c("New York", "San Francisco", "Los Angeles")
)
print(df)

# Convert the data frame to a tibble
tib <- as_tibble(df)

print(tib)

#Creating tibble from matrix

library(tibble)

# create a sample matrix
mat <- matrix(1:12, nrow = 4, ncol = 3)
mat

# convert the matrix into tibble
tib <- as_tibble(mat)
print(tib)


# purr package----

set.seed(123)
df_xyz <- tibble(
  x = rnorm(10),
  y = rnorm(10),
  z = rnorm(10)
)
df_xyz %>% 
  summarise(
    across(
      .cols  = everything(),
      .fns   = mean,
      .names = "{col}_mean"
    )
  )

?map2_dbl
xyz_means <- map_dbl(
  .x=df_xyz,
  .f=mean
)

data("iris")
df <- iris[1:4] # selecting only numerical values
means <- map(df, # data set
             mean # function to apply each column)
            
)

# lets create two vectors
vec1 <- iris$Sepal.Length
vec2 <- iris$Sepal.Width

# multiplying two vectors element by element with the map2 function and return the result as a vector
result <- map2(vec1, vec2, ~ .x * .y) 

print(result[[1]])

##pmap()function----
df <- tibble::tibble(
  gene = c("TP53", "EGFR", "BRCA1"),
  score = c(9.5, 8.2, 7.7),
  status = c("high", "medium", "low")
)

# Apply a function to each row
pmap(df, function(gene, score, status) {
  paste(gene, "has", status, "expression with score", score)
})

##reduce()----
dfs <- list(
  data.frame(gene = "TP53", expr = 2.3),
  data.frame(gene = "TP53", expr = 1.7),
  data.frame(gene = "TP53", expr = 3.1)
)

reduce(dfs, dplyr::full_join)
# Combines the data frames by rows (useful in merging results)

##accumulate()----
treatments <- c(0.5, 1.2, -0.3)
initial_expr <- 1.0

accumulate(treatments, function(x, y) x + y, .init = initial_expr)
# Output: 1.0, 1.5, 2.7, 2.4

samples <- list(
  list(id = "S1", condition = "treated"),
  list(id = "S2", condition = "control"),
  list(id = "S3", condition = "treated")
)

transpose(samples)
# Output: list(id = list("S1", "S2", "S3"), condition = list("treated", "control", "treated"))

#forcats----

samples <- tibble::tibble(
  condition = factor(c("control", "treated", "treated", "control", "stressed"))
)

# Lump all but top 2 most frequent levels
samples <- samples %>%
  mutate(condition = fct_lump(condition, n = 2))

library(forcats)
library(dplyr)
library(tibble)

df3 <- tibble(
  treatment = factor(c("A", "B", "C", "A", "B", "C")),
  response = c(4, 3, 2, 5, 2, 1)
)

df4<-df3 %>% 
  mutate(treatment = fct_reorder(treatment, response)) %>%
  arrange(treatment)

f <- factor(c("low", "medium", "high"))
fct_rev(f)

g <- factor(c("a", "b", "b", "c", "c", "c"))
fct_infreq(g)

h <- factor(c("a", "a", "b", "c", "d", "e", "f"))
fct_lump(h, n = 2)

i <- factor(c("ctrl", "trt", "trt"))
fct_recode(i, control = "ctrl", treatment = "trt")


