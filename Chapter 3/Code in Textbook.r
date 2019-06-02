# Exhibit 3.1 on page 31.
data(rwalk)
# This command loads the time series rwalk, which is a random walk realization. 
model1=lm(rwalk~time(rwalk))
summary(model1)

# Exhibit 3.2 on page 31.
plot(rwalk,type='o',ylab='y')
abline(model1)
# The function abline is a low-level graphics function. 
# If a fitted simple regression model is passed to it, it adds the fitted straight line to an existing graph. 
# Any straight line of the form y = β0 + β1x can be superimposed on the graph by running the command
abline(a=beta0,b=beta1)

# For example, the following command adds a 45 degree line on the current graph.
abline(a=0,b=1)


# Suppose we want to fit a quadratic time trend model to the rwalk series. 
# We need to create a new covariate that contains the square of the time indices. 
# The quadratic variable may be created before invoking the lm function. 
# Or it may be created on the fly when invoking the lm func- tion. The latter approach is illustrated here.
model1a=lm(rwalk~time(rwalk)+I(time(rwalk)^2))
# Notice that the expression time(rwalk)^2 is enclosed within the I function which instructs R to create a new variable 
# by executing the command passed into the I func- tion. 
# The fitted quadratic trend model can be inspected with the summary function.

> summary(model1a)
Call:
lm(formula = rwalk ~ time(rwalk) + I(time(rwalk)^2)) Residuals:
Min 1Q Median 3Q Max -2.696232 -0.768018 0.008256 0.853365 2.344685 Coefficients:
Estimate Std. Error t value Pr(>|t|) 
(Intercept) -1.4272911 0.4534893 -3.147 0.00262 ** 
time(rwalk) 0.1746746 0.0343028 5.092 4.16e-06 ***
I(time(rwalk)^2) -0.0006654 0.0005451 -1.221 0.22721 ---
Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
Residual standard error: 1.132 on 57 degrees of freedom Multiple R-Squared: 0.8167, Adjusted R-squared: 0.8102 
F-statistic: 127 on 2 and 57 DF, p-value: < 2.2e-16


# Exhibit 3.3 on page 32.
data(tempdub)
month.=season(tempdub)
# The expression season(tempdub) outputs the monthly index of tempdub as a factor, and saves it into the object month.. 
# The first period sign (.) is part of the name (month.) and is included to make the printout from later commands more clear.

# A factor is a kind of data structure for handling qualitative (nominal) data that do not have a natural ordering like 
# numbers do. However, for purposes of summary and graphics, the user may supply the levels argument to indicate an ordering 
# among the factor values. For example, the following command creates a factor containing the qualitative variable sex, 
# with the default ordering using the dictionary order.
> sex=factor(c('M','F','M','M','F'))
> sex
[1] M F M M F
Levels: F M
# We can change the ordering as follows:
> sex=factor(c('M','F','M','M','F'),levels=c('M','F')) > sex
[1] M F M M F
Levels: M F
# Note the swap of F and M in the levels. The function table counts the frequencies of the two sexes.
> table(sex)
sex M F
32
# The printout lists the frequencies of the values according to the order supplied in the level argument.


# the intercept term has to be removed to avoid multicollinearity. The expression ‘‘-1’’ in the formula takes care of this. 
# The fitted model corresponds to fitting a mean separately for each month. 
# If the expression ‘‘-1’ ’ is omitted, lm deals with the multicollinearity by omitting the first indicator variable; 
# that is, the indicator variable for Jan- uary will be deleted. In such a fitted model, the intercept represents the overall 
# January mean and the coefficients for other months are the deviations of their means from the January mean.
model2=lm(tempdub~month.-1)
summary(model2)
fitted(model2)
residuals(model2)


# Exhibit 3.4 on page 33.
model3=lm(tempdub~month.) 
# intercept is automatically included so one month (January) is dropped
summary(model3)


# Exhibit 3.5 on page 35.
har.=harmonic(tempdub,1)
# The first pair of harmonic functions (sine and cosine pairs) can be constructed by the harmonic function, 
# which takes a time series as its first argument and the number of harmonic pairs as its second argument. 
# The output of the harmonic function is a matrix that is saved into an object named har..
# Again, the first period is part of the name and included to make the later print- outs clearer.
model4=lm(tempdub~har.)
summary(model4)


# We now briefly discuss the use of matrices in R. A matrix is a rectangular array of num- bers. 
# It can be created by the matrix function. Here is an example:
> M=matrix(1:6,ncol=2) >M
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6
# The matrix function expects a vector as its first argument, 
# and it uses the values in the supplied vector to fill up a matrix column by column. 
# The column dimension of a matrix is specified by the ncol argument and the row dimension by the nrow argument. 
# The expression 1:6 stands for the vector containing the integers from 1 to 6. 
# So the matrix function creates a matrix consisting of two columns using the six numbers 1, 2, 3, 4, 5, and 6. 

# The dimensions of a matrix can be extracted using the dim function.
> dim(M)
[1] 3 2
This displays the row and column dimensions of M as a vector. The function apply can process a matrix column by column, with each column operated by a supplied func- tion. For example, the column means of M can be computed as follows:
> apply(M,2,mean)
[1] 2 5
The first argument of the apply function is the matrix on which it processes, and the second argument is MARGIN, which should be set to 1 for row processing or 2 for col- umn processing. The third argument is FUN, which takes the user-specified function. The example above instructs R to process M column by column and apply the mean function to each column. How would you modify the preceding R command to compute the row sums of M?


# Exhibit 3.6 on page 35. 
plot(ts(fitted(model4),freq=12,start=c(1964,1)), ylab='Temperature',type='l',
ylim=range(c(fitted(model4),tempdub))) points(tempdub)
# The ylim option ensures that the y-axis has a range that includes both the raw data and the fitted values.


# Exhibit 3.8 on page 43. plot(y=rstudent(model3),x=as.vector(time(tempdub)),
xlab='Time', ylab='Standardized Residuals',type='o') The expression rstudent(model3) returns the (externally) Studentized residuals from the fitted model. To compute the (internally) standardized residuals, use the com- mand rstandard(model3).


# Exhibit 3.11 on page 45. 
hist(rstudent(model3),xlab='Standardized Residuals')
# Note that the default heading of the histogram says that the plot is a histogram of rstudent(model3). 


# Exhibit 3.12 on page 45.
# The expression rstudent(model3) extracts the standardized residuals of model3. 
# The qqnorm function then plots the Q-Q normal scores plot of the residuals. 
# A reference straight line can be superimposed on the Q-Q normal score plot by running the command 
qqnorm(rstudent(model3))
qqline(rstudent(model3)).


# Exhibit 3.13 on page 47.
# The acf function computes the sample autocorrelation function of the time series sup- plied to the function. 
# The maximum number of lags is determined automatically based on the sample size. 
# It can, however, be changed to, say, 30 by setting the option max.lag=30 when calling the function.
acf(rstudent(model3))
# The Shapiro-Wilk test and the runs test on the residuals can be carried out respec- tively by the following commands.
shapiro.test(rstudent(model3))
runs(rstudent(model3))
# These commands compute the test statistics as well as their corresponding p-values.
