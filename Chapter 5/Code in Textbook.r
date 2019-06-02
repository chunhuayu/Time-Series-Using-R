# Exhibit 5.4 on page 91. 
plot(diff(log(oil.price)),ylab='Change in Log(Price)',type='l')
  
# The function diff outputs the first difference of the supplied time series. 
# Higher-order differences can be computed by supplying the differences argument. 
# the second difference of log(oil.price) can be computed by the command
diff(log(oil.price), differences=2)
# A useful convention of R is that the name of an argument in a function can be abbreviated if it does not result in ambiguity.
# For example, the previous command can be shortened to
diff(log(oil.price),diff=2)
# Note that the second argument of the diff function is the lag argument. 
# By default, lag=1 and the diff function computes regular differences — first or higher differences. 
# computing the seasonal differences of period 12 can be done by issuing the command 

diff(tempdub,lag=12). 
# What will be computed by the command diff(log(oil.price),2)?
# diff(log(oi.price),2)=diff(log(oil.price),lag=2)
# Indeed, mixed arguments (some named and some unnamed in a haphazard order) may result in erroneous interpretation by R. 
# The order of the arguments in a function can be quickly checked by running the command 
# args(function.name) or ?function.name, 
# where function.name should be replaced by the name of the function you are checking.


# Exhibit 5.11 on page 102.
library(MASS)
boxcox(lm(electricity~1))
# The function boxcox computes the maximum likelihood estimate of the power transformation on the response variable to 
# make a linear regression model appropriate for the data. The first argument is a fitted model by the lm function. 
# By default, the boxcox function produces a plot of the log-likelihood function of the power parameter. 
# The MLE of the power parameter is the value that maximizes the plotted likelihood curve. 
# Here the model is that some power transform of electricity is given by the model of a constant mean plus normally 
# distributed white noise. But we already know that electricity is serially correlated, so this method is not entirely correct, 
# as the autocorre- lation in the series is not accounted for.
# a more appropriate model is that some power transform of the time series variable follows an AR model. 
# The function BoxCox.ar implements this approach. 
# It has two drawbacks in that it is much more computer-intensive and that other covariates cannot be included in the model in 
# the current version of the function. The first argument of BoxCox.ar is the name of the time series variable. 
# The AR order may be supplied by the user through the order argument. 
# If the AR order is missing, the function estimates the AR order by minimizing the AIC for the log-transformed data. 

# Both boxcox and BoxCox.ar require the response variable to be posi-tive.
BoxCox.ar(electricity)
# This plots the log-likelihood function of the power parameter for the model that accounts for autocorrelation in the data.
