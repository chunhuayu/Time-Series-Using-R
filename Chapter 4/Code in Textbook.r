# Exhibit 4.2 on page 59.
data(ma1.2.s) 
plot(ma1.2.s,ylab=expression(Y[t]),type='o')
# The software R can display mathematical symbols in a graph. 
# The option ylab=expression(Y[t]) specifies that the y label is Y with t as its subscript, all in math font. 
# Typesetting a formula does require some additional work.

# An MA(1) series with MA coefficient equal to θ1 = −0.9 and of length n = 100 can be simulated by the following commands.
# This command initializes the seed of the random number generator so that a simulation can be reproduced if needed. 
# Without this command, the random generator will initialize “randomly,” and there is no way to reproduce the simulation.
# The argument 12345 can be replaced by other numbers to obtain different random numbers.
set.seed(12345)


# The arima.sim function simulates a time series from a given ARIMA model passed into the function as a list 
# that contains the AR and MA parameters as vectors. The simu- lated model above is an MA(1) model, 
# so there is no AR part in the model list. The software R uses a plus convention in parameterizing the MA part, 
# so we have to add a minus sign before the vector of MA values to agree with our parameterization. 
# The sample size is determined by the value of the argument n. 
# So, the command above instructs R to simulate a realization of size 100 from an MA(1) model with θ1 = −0.9.
y=arima.sim(model=list(ma=-c(-0.9)),n=100)


# We now digress to explain some pertinent facts about list. A list is the most flex- ible data structure in R. 
# You may think of a list as a cabinet with many drawers (elements or components), 
# each of which contains data with possibly different data structures. 
# an element of a list can be another list! The elements of a list are ordered according to the order they are entered. 
# Also, elements can be named to facilitate their easy retrieval. 
# A list can be created by the list function with elements supplied as its arguments.
# The elements may be passed into the list function in the form of name = value, delimited by commas. 
# Below is an example of a list contain- ing three elements named a, b, and c, where a is a three-dimensional vector, 
# b is a number, and c is a time series.

> list1=list(a=c(1,2,3),b=4,c=ts(c(5,6,7,8), start=c(2006,2),frequency=4))
> list1
$a
[1] 1 2 3
$b
[1] 4
$c Qtr1 Qtr2 Qtr3 Qtr4 2006 567 2007 8
# To retrieve an element of a list, run the command listname$elementname, for example
> list1$c
     Qtr1 Qtr2 Qtr3 Qtr4
2006 567 2007 8

# Data of irregular structure can be stored as a list. The output of a function is often a list. 
# Simply entering the name of a list may result in dazzling output if the printed list is large. 
# An alternative is to first explore the structure of a list by the function str (str stands for structure). 
> str(list1)
List of 3
 $ a: num [1:3] 1 2 3
 $ b: num 4
 $ c: Time-Series [1:4] from 2006 to 2007: 5 6 7 8
# This shows that list1 has three elements and describes these elements briefly.
