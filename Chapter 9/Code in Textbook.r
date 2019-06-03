# Exhibit 9.2 on page 205.
data(tempdub)
tempdub1=ts(c(tempdub,rep(NA,24)),start=start(tempdub), freq=frequency(tempdub))
# This appends two years of missing values to the tempdub data, as we want to forecast the temperature for two years into 
# the future. The function start extracts the starting date of a time series. 
# The function frequency extracts the frequency of the time series passed to it, here being 12. 
# Hence, tempdub1 contains the Dubuque temperature series augmented by two years of missing data, 
# with the same starting date and frequency of sampling per unit time interval.
har.=harmonic(tempdub,1)
# This creates the first pair of harmonic functions.
   

m5.tempdub=arima(tempdub,order=c(0,0,0),xreg=har.)
# This fits the harmonic regression model using the arima function. 
# The covariates are passed to the function through the xreg argument. 
# In the example, har. is the covari- ate and the arima function fits a linear regression model of the response variable 
# on the covariate, with the errors assumed to follow an ARIMA model. specified ARIMA orders p = d = q = 0, is white noise; 
# that is, the arima function fits an ordinary linear regression model of tempdub on the first pair of harmonic functions. 
# Note that the result is the same as that from the fit using the lm function, which can be verified by the following commands:
har.=harmonic(tempdub,1); 
model4=lm(tempdub~har.) 
summary(model4)
# The xreg argument expects the covariate input either as a matrix or a data.frame. A data.frame can be thought of 
# as a matrix made up by binding together several covariates column by column. 
# It can be created by the data.frame function with multiple arguments, 
# each of which takes the form covariate.name = R statement for computing the covariate. If the covariate.name is omitted, 
# the R statement becomes the covariate name, which may be undesirable for a complex defining statement. 
# If the R statement is a matrix, its columns are taken as covariates with the column names taken as the covariate names. 
# Consider the example of augmenting the harmonic regression model above by a linear time trend. 
# The augmented model can be fitted by the command
arima(tempdub,order=c(0,0,0), xreg=data.frame(har.,trend=time(tempdub)))
m5.tempdub
newhar.=harmonic(ts(rep(1,24), start=c(1976,1),freq=12),1)
# This creates the harmonic functions over two years starting from January 1976 and ends in December 1975.
plot(m5.tempdub,n.ahead=24,n1=c(1972,1),newxreg=newhar., col=’red’, type=’b’,ylab='Temperature',xlab='Year')
# This computes and plots the forecasts based on the fitted model passed as the first argument. 
# Here, we specify a forecast for 24 steps ahead through the argument n.ahead=24. 
# The covariate values over the period of forecast have to be supplied by the newxreg argument. 
# The newxreg argument should match the xreg argument in terms of the covariates except that their values are from 
# different periods. 
# The plot may be drawn with a starting date different from the start date of the time series data by using the n1 argument. 
# n1=c(1972,1) specifies January 1972 as the start date for the plot. 
# For nonseasonal data (that is, frequency = 1), n1 should be a scalar. 
# The col and type arguments refer to the color and style of the plotted lines.


# Exhibit 9.3 on page 206.
data(color)
m1.color=arima(color,order=c(1,0,0))
plot(m1.color,n.ahead=12,col='red',type='b',xlab='Year', ylab='Temperature')

# The final command adds the horizontal line at the estimated mean (intercept)
abline(h=coef(m1.color)[names(coef(m1.color))=='intercept'])
# The expression coef(m1.color) extracts the coefficient vector.
# names(coef(m1.color)) returns the vector of names of the components of the coefficient vector. 
# (If the vectors under comparison are of unequal length, R recycles the shorter one repeatedly to match the longer one.) 
# [names(coef(m1.color))== 'intercept']returns a vector with the TRUE value in the position in which the “intercept” component
# lies and with all other elements FALSE. 
