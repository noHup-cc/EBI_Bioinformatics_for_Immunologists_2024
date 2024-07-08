#' ---
#' title: "An introduction to R"
#' author: "Jiawei Wang & Jinzheng Ren"
#' date: "2024-06-24"
#' output: html_document
#' ---
#' 
## ----setup, include=FALSE------------------------------------------------------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

#' 
#' ## Overview
#' 
#' Some of the materials originate in the [Introduction to R](https://bookdown.org/palmjulia/r_intro_script/) with some of the text copied with a few edits.
#' 
#' This guide provides an introduction to R, a powerful language and environment for statistical computing and graphics. The materials include basic R computations, data structures, functions, data manipulation, and visualization techniques. It is designed for those new to R or those looking to solidify their understanding of its fundamentals.
#' 
#' ## R basics
#' 
#' R can perform basic arithmetic operations directly in the console.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
2-5*3^2
(2-5)*3^2
(2-5)*(3^2)

#' 
#' In R, you can assign values to variables using `<-`, `->`, or `=`.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
x <- 3
7 -> some.complicated.name
z = 10

x + some.complicated.name + z

#' 
#' Note: You cannot use `10 = z` for assignment.
#' 
#' You can view all defined objects and remove them when needed.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
ls()       # View all objects
rm(x)      # Remove a specific variable
rm(list=ls())  # Remove all variables

#' 
#' ## Data structures
#' 
#' ### Vectors
#' 
#' A vector is a sequence of elements of the same type. Here's how to create and manipulate vectors:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
my_vector <- c(8, 2, 4, 6, 2, 1)
my_vector

#' 
#' Operations with vectors
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
my_vector * 2

#' 
#' Here, R executes the operation element-wise. This means the computation should involve either two elements of the same length (like a+b) or one vector and a single number (like a\*3). If the lengths of the vectors in your calculation don’t fit, R will recycle the shorter to make it fit the longer of the vectors.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
b <- c(1, 1, 1, 1, 1, 1)
my_vector + b

#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
long <- c(1, 2, 3, 4)
short <- c(1, 2)
long+short

#' 
#' Here, the shorter vector was repeated, i.e. the calculation was long + c(short, short).
#' 
#' Every element of a vector can be accessed individually by referencing its position (i.e. its index) in the vector. You can for example retrieve the fourth element of my_vector like this:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
my_vector
my_vector[4]

#' 
#' It is also possible to select more than one element of the vector by using an integer vector of the desired indices (e.g. c(1,4,5) if you want to retrieve the first, fourth and fifth element of a vector) within the square brackets:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
my_vector
my_vector[c(1, 4, 5)]

#' 
#' We call this subsetting your vector. For subsetting vectors we often need longer sequences of integers. To generate a sequence of consecutive integer numbers R has the <start> : <end> operator, which is read as from <start> to <end>:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
3:10 #generates sequence from 3 to 10

#' 
#' ### Character
#' 
#' A piece of text is called a string and is written in a pair of double or single quotes.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
v2 <- c("male", "female", "female", "male")
v2

#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
v3 <- c('blue', 'brown', 'yellow')
v3

#' 
#' ### Logical
#' 
#' Another important type of vector is the logical vector, the elements of which are the so called booleans TRUE and FALSE, which can be shortened by T and F (cases matter, you have to use upper case letters in both versions.)
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
c(TRUE, FALSE, TRUE)

#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
c(F, T, T, T)

#' 
#' Boolean values are the result of logical operations, that is, of statements that can be either true or false:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
3 < 4

#' 
#' The most common logical operators we will use are the following:
#' 
#' -   AND &
#' 
#' -   OR \|
#' 
#' -   NOT !
#' 
#' -   greater than \>
#' 
#' -   greater or equal \>=
#' 
#' -   less than \<
#' 
#' -   less or equal \<=
#' 
#' -   equal to == (yes, you need two equal signs)
#' 
#' -   not equal to !=
#' 
#' Combination of logical operations
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
((1+2)==(5-2)) & (7<9)

#' 
#' ### Data frames
#' 
#' If you want to do statistics, the most likely format your data will come in is some kind of table. In R, the basic form of a table is called a data.frame and looks like this:
#' 
#' | Name | Height | Gender | Age |
#' |------|--------|--------|-----|
#' | John | 185.2  | male   | 25  |
#' | Max  | 175.8  | male   | 32  |
#' | Susi | 155.1  | female | 27  |
#' | Anna | 162.7  | female | 24  |
#' 
#' Usually every row is an observation (e.g. an individual or a measurement point) and each column is a variable on which the observation is measured (e.g. age, gender etc.). Below is one way to create the above dataframe.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
# Create vectors for each column 
Name <- c("John", "Max", "Susi", "Anna") 
Height <- c(185.2, 175.8, 155.1, 162.7) 
Gender <- c("male", "male", "female", "female") 
Age <- c(25, 32, 27, 24)

# Combine the vectors into a dataframe

df <- data.frame(Name, Height, Gender, Age) 
df

#' 
#' You can extract each of the columns with a \$ :
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
df$Name

#' 
#' It is also possible to select parts of your data.frame by simply listing the indices of the rows and columns you want to keep. This works similarly to subsetting a vector by using [<rows to keep> , <columns to keep>]:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
df[c(1:3), c(1,3)] # keep rows 1 to 3 and columns 1 and 3

#' 
#' If you want to keep all columns or all rows, you leave the corresponding element in the [,] empty. You nevertheless have to keep the comma!
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
df[1,] # only keep first row

#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
df[,2] # only keep second column

#' 
#' Basically, a data.frame in R is a number of vectors of the same length that have been stuck together columnwise to build a table. Each column must have a unique format but different formats can be assigned to different columns.
#' 
#' ### Lists
#' 
#' While data.frames are useful to bundle together vectors of the same length, lists are used to combine more heterogeneous data. The following block of code creates a list:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
# create list 
my.list <- list(my_vector, df, 1, "a string") 
print(my.list)

#' 
#' A list is a collection of R objects that are called the elements of the list. Lists are similar to data.frames, but while data.frames can only have vectors of the same length as their elements (i.e. the variables), lists can have all kinds of data types as elements. An element of a list can be a vector of arbitrary length, a data.frame, another list or even a function. You can access a single list element by referencing its position in the list using double square brackets [[]]:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
my.list[[1]]

#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
my.list[[2]]

#' 
#' If you want to subset the list (i.e. keep only certain parts), use single square brackets []:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
print(my.list[2:4])

#' 
#' Note that if you use single square brackets [], the result will always be a list, whereas using double square brackets [[]] will return whatever type the object is that you are referencing with [[]].
#' 
#' my.list is an unnamed list, but it is also possible to create a named list:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
#create list 
my.named.list <- list(a=my_vector, b=df, c=1, d="a string") 
#print list 
print(my.named.list )

#' 
#' The advantage of a named list is that you can extract the list elements by their names, similar to extracting variables from a data.frame:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
my.named.list$a

#' 
#' The square brackets [] and [[]] do however also work on named lists. Because lists can bundle a lot of heterogeneous data in one R object, they are quite often used to give results of functions for statistical analyses as you will see later on.
#' 
#' ### Type of data structure
#' 
#' You can find out what type of data structure an object is with the class() function:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
class(my.list)

#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
class(df)

#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
class(c(TRUE,FALSE, FALSE))

#' 
#' When you get more complex objects, it can sometimes be useful to get an overview over their structure with str():
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
str(my.list)

#' 
#' ## Functions
#' 
#' ### Function
#' 
#' A function can be thought of as a small machine that takes some input (usually some kind of data), processes that input in a certain way, and gives back the result as output.
#' 
#' R has some built-in functions.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
mean(c(2, 4, 6))

#' 
#' The information that goes into the function is called an argument, the output is called the result. A function can have an arbitrary number of arguments, which are named to tell them apart. The function log() for example takes two arguments: a numeric vector x with numbers you want to take the logarithm of and a single integer base with respect to which the logarithm should be taken :
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
log(x = c(10, 20, 30), base = 10)

#' 
#' To find out how a function is used (i.e. what arguments it takes and what kind of result it returns) you can use R’s help. Just put ? in front of the function name (without brackets after the function name). If you run this code, the help page appears in the lower right window in R Studio.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
?log

#' 
#' ### Packages
#' 
#' A basic set of functions are already included in basic R, i.e. the software you downloaded when installing R. But since there is a huge community worldwide constantly developing new functions and features for R and since the entirety of all R functions there are is way to big to install at once, most of the functions are bundeled into so called packages. A package is a bundle of functions you can download and install from the Comprehensive R Archive Network (CRAN) (<https://cran.r-project.org/>). If you visit the site, you can also get an overview over all available packages. You can install a package by using the function install.packages() which takes the package name as a string (i.e. in quotes) as its argument:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
install.packages("lubridate")

#' 
#' Once you have installed the package, its functions are downloaded to your computer but are not accessible yet, because the package has to be activated first.
#' 
#' To activate the package, you use the function library(). This function activates the package for your current R session, so you have to do this once per session (a session starts when you open R/Rstudio and ends when you close the window).
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
library(lubridate) 
today()

#' 
#' ### Read data
#' 
#' *working directory*
#' 
#' Before we can show you how to import data, you have to get to know another important concept: the working directory. The working directory is basically the folder on your computer where R looks for files to import and where R will create files if you save something. To find out what the current working directory is, use:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
getwd()

#' 
#' To change the working directory, use the function setwd() and put the correct path in it.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
setwd(getwd()) # setwd("<Path to the chosen directory>")

#' 
#' The comma-separated values (.csv) format is probably the format most widely used in the open-source community. Csv-files can be read into R using the read.csv() function, which expects a csv-file using , as a separator and . as a decimal point. If you happen to have a German file that uses ; and , instead, you have to use read.csv2().
#' 
#' Here's a sample dataset in CSV format. The dataset contains the following columns:
#' 
#' -   Year: Represents years from 2000 to 2100.
#' 
#' -   Category: Represents different product categories (Electronics and Clothing).
#' 
#' -   Type: Represents different product types (High-End, Standard, Mid-Range).
#' 
#' -   Sales, Profit, Expenses: Numerical variables
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
example_csv = read.csv("example.csv", header = TRUE, sep = ",") 
example_csv

#' 
#' If you have another kind of file, just google read R and you file type and you will most likely find an R package for just that.
#' 
#' ### Data visualization
#' 
#' The plot() function is a built-in tool used to draw points (markers) in diagrams. While there are other built-in functions like lines(), points(), pie(), and barplot() for plotting, we will focus solely on the plot() function here. Later, we'll explore more advanced tools for visualization. Here's a quick way to visualize data.
#' 
#' The function takes parameters for specifying points in the diagram.
#' 
#' Parameter 1 specifies points on the x-axis.
#' 
#' Parameter 2 specifies points on the y-axis.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
plot(example_csv$Profit, example_csv$Sales)

#' 
#' ### Save data
#' 
#' Sometimes you have worked on some data and want to be able to use your R objects in a later session. In this case, you can save your workspace (the objects listed under Environment) using save() or save.image(). save() takes the names ob the objects you want to save and a name for the file they are saved in. save.image() just saves all of the R objects in your workspace, so you just have to provide the file name:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
save(example_csv, file="example.RData") # saves only example_csv 
save.image(file="my_workspace.RData") # saves entire workspace

#' 
#' When you now open a new R session and want to pick up where you left, you can load the data with load():
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
load("example.RData") 
load("my_workspace.RData")

#' 
#' If you want to save a data.frame in some non-R format, almost every read function has a corresponding write function. The most versatile is write.table() which will write a text-file based format, like a tabular separated file or a csv, depending on what you supply in the sep argument.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
write.table(example_csv, "my_example.csv", sep = ",", row.names = FALSE, col.names = TRUE, quote = FALSE) 
# or write.csv(example_csv, "my_example.csv", row.names = FALSE, quote = FALSE)

#' 
#' ### Defining a function
#' 
#' Apart from using already existing functions in R, you can write you own function if you don’t find one that is doing exactly what you need. For demonstration purposes, let’s define a function mySum() that takes two single numbers firstNumber and secondNumber as input and computes the sum of these numbers:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
mySum <- function(firstNumber, secondNumber){ 
  result <- firstNumber + secondNumber 
  return(result) # or just result
}

#' 
#' After defining the function we can use it:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
mySum(3,4)

#' 
#' It is also possible to assign default values to some of the arguments. The following function has a default of 10 for secondNumber:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
mySum2 <- function(firstNumber, secondNumber=10){ 
  result <- firstNumber + secondNumber 
  result 
}

#' 
#' This means if you omit secondNumber in the function call, it is assumed to be 10:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
mySum2(5)

#' 
#' But you can overwrite the default:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
mySum2(5, 2)

#' 
#' ## Exercise 1
#' 
#' ::: exercise
#' Make a function called computeEucDistance that takes two vectors (assumed to have numerical values) as input and computes the Euclidean distance between them. Use this function to compute the distance between the points (1, 1) and (2, 2). The Euclidean distance between two vectors $v$ and $w$ is calculated as $((v_1 - w_1)^2 + \dots + (v_n - w_n)^2)^{1/2}$.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
########## YOUR CODE STARTS HERE ##########

########## YOUR CODE ENDS HERE ##########

vector_1 <- c(1, 1)
vector_2 <- c(2, 2)

# Compute and print the Euclidean distance between the two vectors
distance <- computeEucDistance(vector_1, vector_2)
cat("The Euclidean distance between the vectors is:", distance, "\n")

#' 
#' Hints:
#' 
#' 1.  Recall the element-wise operation of vectors.
#' 
#' 2.  Functions like sum() and sqrt() may be useful. If you are not sure about what those functions do, use ?<a function> to find out.
#' :::
#' 
#' ## Conditional execution and loops
#' 
#' ### Conditional execution
#' 
#' Sometimes you want your code to do one thing in one case and another thing in the other case. For example you could write some code that tests the body temperature.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
tempChecker <- function(bodytemp){

  if(bodytemp<36){
      
      return("too cold")
  
  }else if(bodytemp>=38){
  
      return("too hot")
  
  }else{
  
      return("normal")
  }
  
}

tempChecker(35) 
tempChecker(39) 
tempChecker(37)

#' 
#' ### Loops
#' 
#' The final structure is the loop: A loop allows you to assign repetitive tasks to your computer instead of doing them yourself. The first kind of loop you’ll learn about is the for loop. In this loop you specify the number of repetitions for a task explicitly. The following loop prints the numbers from 1 to 5:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
for (i in 1:5) {

  print(i)

}

#' 
#' In the () part you define the counting variable, which is often called i (but can have any other name too) and we define the values this counting variable should take (the values 1 to 5 in our case). In the {} part we then define the task for every iteration. print(i) simply tells R to print the value of i into the console. So the above loop has 5 iterations in each of which the current value of i is printed to the console.
#' 
#' Of course we can also have proper computations. For example we can add up all the numbers from 1 to 1000 with this code:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
result <- 0

for(count in 1:1000){
   
  result <- result + count

}

result

#' 
#' Sometimes a repetitive task has to be done until a certain condition is met, but we cannot tell beforehand how many iterations it is going to take. In these cases, we can use the while loop. For example you can count how often you have to add 0.6 until you get to a number that is greater than 1000:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
x <- 0 
counter <- 0 
while(x <= 1000){ 
  x <- x + 0.6 
  counter <- counter + 1 
} 
counter

#' 
#' Before the loop starts, both x and counter have the value 0. Then in every iteration, x grows by 0.6 and counter by 1 to count the number of iterations. As soon as the condition in () is not met anylonger (i.e. when x is greater than 1000), the loop stops. As you can see, it takes 1667 iterations to make x greater than 1000.
#' 
#' ## Exercise 2
#' 
#' ::: exercise
#' Write a function is_prime(n) that takes an integer n as input and returns TRUE if n is a prime number, and FALSE otherwise. Use this function to print all prime numbers between 1 and 50.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
# Function to check if a number is prime 
is_prime <- function(n) {
  ########## YOUR CODE STARTS HERE ##########

  ########## YOUR CODE ENDS HERE ########## 
}

# Loop to print prime numbers between 1 and 50
for (num in 1:50) { 
  if (is_prime(num)) { 
    cat(num, "is a prime number.\n") 
  } 
}


#' :::
#' 
#' Hints:
#' 
#' 1.  a %% b is the modulus operator. It calculates the remainder when the number on the left-hand side (a) is divided by the number on the right-hand side (b).
#' 
#' ## Data manipulation
#' 
#' Previously, we conducted some basic exploratory analysis on our data, but it was limited. To further analyze our data, we need more advanced tools for data manipulation.
#' 
#' The tidyverse (Wickham et al. 2019) is an R package that contains a lot of useful functions to deal with these problems, so we’ll start by installing and loading this package:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
install.packages("tidyverse") #only do this once

#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
library(tidyverse)

#' 
#' Here we will use our test.csv data. Please make sure to use read_csv() and not read.csv(). While both are used to read csv-files into R, the former is a special tidyverse function that gives your data.frame a couple of nice extra features.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
# load data 
example_csv = read_csv("example.csv") 
example_csv

#' 
#' If you look at the type of example_csv using class(), you can see that it is more than just a data.frame, it is for example also a tbl which is short for tibble.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
class(example_csv)

#' 
#' Basically, a tibble can be used for everything a data.frame can be used for, but it has some nice additional properties that are outside the scope of this tutorial.
#' 
#' ### Select, Filter, Apply
#' 
#' The first two functions for data manipulation are select(), which allows you to keep only certain variables (i.e. columns) and filter(), which allows you to keep only certain rows.
#' 
#' As its first argument, select() takes a data.frame or tibble and as its second argument the names of the variables you want to keep. Although it is technically not needed, we recommend bundling together the variable names in a vector:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
select(example_csv, c(Category, Sales))

#' 
#' It is also possible to specify the variables you want to throw out instead, by putting a - before their names:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
select(example_csv, -c(Category, Sales))

#' 
#' When you use filter() to chose only certain rows, you’ll mostly have some kind of rule which cases to keep. These rules are expressed as logical statements. filter() takes a tibble as its first and a logical expression as its second argument:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
filter(example_csv,(Category == "Electronics") & (Type == "High-End") & Profit > 2600 )

#' 
#' It is also possible to select parts of your tibble by simply listing the indices of the rows and columns you want to keep. This works similarly to subsetting a vector by using [<rows to keep> , <columns to keep>]:
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
example_csv[c(1:3), c(1,3)] #keep rows 1 to 3 and columns 1 and 3

#' 
#' If you want to keep all columns or all rows, you leave the corresponding element in the [,] empty. You nevertheless have to keep the comma!
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
example_csv[1,] #only keep first row

#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
example_csv[,2] #only keep second column

#' 
#' Apply functions are a family of functions in base R that allow you to repetitively perform an action on multiple chunks of data. An apply function is essentially a loop but runs faster than loops and often requires less code.
#' 
#' There are many different apply functions because they are meant to operate on different types of data (e.g., apply, lapply, sapply, vapply, tapply, and mapply). Here, we will only discuss apply for simplicity.
#' 
#' the apply function looks like this: apply(X, MARGIN, FUN).
#' 
#' -   X is an array or matrix (this is the data that you will be performing the function on)
#' 
#' -   Margin specifies whether you want to apply the function across rows (1) or columns (2)
#' 
#' -   FUN is the function you want to use
#' 
#' my.matrx is a matrix with 1-10 in column 1, 11-20 in column 2, and 21-30 in column 3. my.matrx will be used to show some of the basic uses for the apply function.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
my.matrx <- matrix(c(1:10, 11:20, 21:30), nrow = 10, ncol = 3) 
my.matrx

#' 
#' What if I wanted to summarize the data in matrix m by finding the sum of each row?
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
apply(my.matrx, 1, sum)

#' 
#' What if I wanted to be able to find how many datapoints (n) are in each column of m?
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
apply(my.matrx, 2, length)

#' 
#' What if instead, I wanted to find n-1 for each column? There isn’t a function in R to do this automatically, so I can create my own function. If the function is simple, you can create it right inside the arguments for apply. In the arguments I created a function that returns length - 1.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
apply(my.matrx, 2, function (x) length(x)-1)

#' 
#' If you don’t want to write a function inside of the arguments, you can define the function outside of apply, and then use that function in apply later. This may be useful if you want to have the function available to use later. In this example, a function to find standard error was created, then passed into an apply function.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
st.err <- function(x){ 
  sd(x)/sqrt(length(x)) 
} 
apply(my.matrx,2, st.err)

#' 
#' ### Computing summaries by group
#' 
#' One thing you’ll want to do quite often in statistics is to compute a certain statistic not for your whole sample but individually for certain subgroups. The steps needed for this are the following:
#' 
#' 1.  group your data in subsets according to some factor, e.g., Type
#' 
#' 2.  apply the statistic to each subset
#' 
#' 3.  combine the results in a suitable way
#' 
#' R has a huge number of solutions for this. Some of the most handy ones are part of the dplyr package, which you’ve already loaded as part of the tidyverse. Among others, this package introduces the so-called pipe operator %\>% which is used to chain together multiple operations on the same data set.
#' 
#' The following code takes our data example_csv and computes the the mean Profit and the median Expenses for each Type. Here’s a breakdown of each line:
#' 
#' -   example_csv %\>%: Here the pipe operator (%\>%) is used to pass the data frame example_csv into the subsequent operations.
#' 
#' -   group_by(Type): Groups the data by the levels of the Type variable, indicating that subsequent summary statistics will be calculated for each unique Type group.
#' 
#' -   summarise(meanProfit=mean(Profit, na.rm=T), medianExpenses=median(Expenses, na.rm=T)): This line creates summary statistics for each Type group. It calculates the mean of the Profit variable, assigning the result to a new variable called meanProfit. Similarly, it calculates the median of the Expenses variable and assigns the result to a new variable called medianExpenses. The na.rm = T argument is used to exclude any missing values from the calculations.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
example_csv

#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
example_csv %>% 
  group_by(Type) %>% 
  summarise(meanProfit=mean(Profit, na.rm=T), medianExpenses=median(Expenses, na.rm=T))

#' 
#' Instead of generating a separate table for the summaries, an alternative approach is to integrate the computed values directly into the input data by substituting summarise() with mutate():
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
example_csv %>% 
  group_by(Type) %>% 
  mutate(meanProfit=mean(Profit, na.rm=T), medianExpenses=median(Expenses, na.rm=T))

#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
example_csv %>% 
  group_by(Type) %>% 
  mutate(meanProfit=mean(Profit, na.rm=T), medianExpenses=median(Expenses, na.rm=T)) %>%  filter(Type == "High-End")

#' 
#' ## Exercise 3
#' 
#' ::: exercise
#' Calculate the difference between sales and expenses (net revenue). Then, filter out the cases where the net revenue is below the average net revenue for each category. Replace the `"..."` with your code.
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
########## YOUR CODE STARTS HERE ##########

# Step 1: Calculate the difference between sales and expenses (net revenue) for each row 
# and save the result in a new column called Net_Revenue. 
example_csv_with_net_revenue <- example_csv %>% ...
  
# Step 2: Filter out the cases where the net revenue is below the average net revenue for each category.
filtered_data <- example_csv_with_net_revenue %>% ...

########## YOUR CODE ENDS HERE ########## 

#' :::
#' 
#' ## Solutions
#' 
#' ### Solution to exercise 1
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
# Function to compute the Euclidean distance between two vectors
computeEucDistance <- function(vect1, vect2) {
  # Calculate the squared differences between corresponding elements
  squared_differences <- (vect1 - vect2)^2
  
  # Sum the squared differences
  sum_squared_differences <- sum(squared_differences)
  
  # Take the square root of the sum to get the Euclidean distance
  distance <- sqrt(sum_squared_differences)
  
  # Return the computed distance
  return(distance)
}

vector_1 <- c(1, 1)
vector_2 <- c(2, 2)

# Compute and print the Euclidean distance between the two vectors
distance <- computeEucDistance(vector_1, vector_2)
cat("The Euclidean distance between the vectors is:", distance, "\n")

#' 
#' ### Solution to exercise 2
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
# Function to check if a number is prime
is_prime <- function(n) {
    # Check if n is less than or equal to 1
    if (n <= 1) {
        return(FALSE)
    }
    
    # Check for factors from 2 to sqrt(n)
    for (i in 2:sqrt(n)) {
        if (n %% i == 0) {
            return(FALSE)
        }
    }
    
    return(TRUE)
}

# Loop to print prime numbers between 1 and 50
for (num in 1:50) {
    if (is_prime(num)) {
        cat(num, "is a prime number.\n")
    }
}

#' 
#' ### Solution to exercise 3
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
# Step 1: Calculate the difference between sales and expenses (net revenue) for each row 
# and save the result in a new column called Net_Revenue.
example_csv_with_net_revenue <- example_csv %>%
  mutate(Net_Revenue = Sales - Expenses)
  
# Step 2: Filter out the cases where the net revenue is below the average net revenue for each category.
filtered_data <- example_csv_with_net_revenue %>%
  group_by(Category) %>%
  mutate(Avg_Net_Revenue = mean(Net_Revenue)) %>%
  filter(Avg_Net_Revenue >= Net_Revenue) 

#' 
#' ## Session information
#' 
#' <details>
#' 
## ------------------------------------------------------------------------------------------------------------------------------------------
sessionInfo()

#' 
#' </details>
