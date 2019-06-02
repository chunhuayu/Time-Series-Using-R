# Below is a function that computes the method-of-moments estimator of the MA(1) coef- ficient of an MA(1) model. 
estimate.ma1.mom=function(x){r=acf(x,plot=F)$acf[1]; if (abs(r)<0.5) return((-1+sqrt(1-4*r^2))/(2*r)) else return(NA)}

# The syntax of an R function takes the form
function.name = function(argument list){function body}
# where function body is a set of R statements (commands).Normally, complete R commands are separated by line breaks.
# Alternatively, they may be separated by the semicolon symbol (;). If an R command is incomplete, 
# R will assume that it is to be continued on the next line and so forth until R reads a complete command. 

# So the function above has a single argument called x and contains two commands. The first one is
r=acf(x,plot=F)$acf[1]
# which instructs R to compute the acf of x without plotting the values, 
# extract the first element of the computed sample acf function (that is, the lag 1 autocorrelation) 
# and then save it in an object called r. The object r is a local object; 
# it only exists within the estimate.ma1.mom function environment. The second command is
if (abs(r)<0.5) return((-1+sqrt(1-4*r^2))/(2*r)) else return(NA)

# Note the line break after the if clause and the second half of the command. 
# Since the if clause alone is incomplete, R assumes that it is to be continued on the next line. 
# With the second line, R finds a complete R command and so concludes the two lines of commands together as a complete command.
# In other words, R sees the next command as equivalent to the following one line:
# if (abs(r)<0.5) return((-1+sqrt(1-4*r^2))/(2*r)) else return(NA) 
# The function abs computes the absolute value of the argument passed to it, 
# whereas sqrt is the function that computes the square root of its argument. 
# Now, we are ready to interpret the second command: if the absolute value of r, 
# the lag 1 autocorrelation of x, is less than 0.5 in magnitude, the function returns the number (−1 + sqrt(1 − 4*r^2))/(2*r)
# which is the method-of-moments estimator of the MA(1) coefficient θ1 ; 
# otherwise the function returns NA (see Equation (7.1.4) on page 150). 
# The symbol NA is the code standing for a missing value in R. 
# (NA stands for not available.) In this example, R is specifically instructed what value to return to the user. 
# However, the default procedure is that a function returns the value created by the last command in the function body. 
# R provides a powerful computer language for doing statistics. 
# Please consult the docu- ments on the R Website to learn more about R programming.

# Exhibit 7.1 on page 152.
data(ma1.2.s)
estimate.ma1.mom(ma1.2.s)
# This computes the MA(1) coefficient estimate by the method of moments using the user-created estime.ma1.mom function above!

data(ar1.s)
# the preceding R command fits an AR(1) model for the ar1.s series by solving the Yule-Walker equation.
ar(ar1.s,order.max=1,AIC=F,method='yw')
# This computes the AR coefficient estimates for the ar1.s series. 
# The ar function estimates the AR model for the centered data (that is, mean-corrected data), 
# so the intercept must be zero and not estimated or printed out in the output. 
# The ar function requires the user to specify the maximum AR order through the order.max argument. 
# The AR order may be estimated by choosing the order, between 0 and the maximum order, whose model has the smallest AIC. 
# This option can be specified by setting the AIC argument to take the true value, that is, AIC=T. 
# Or we can switch off order selection by specifying AIC=F. 
# The ar function can estimate the AR model using a number of methods, including solving the Yule-Walker equations, 
# ordinary least squares, and maximum likelihood estimation (assuming normally distributed white noise error terms). 
# These correspond to setting the option method='yw', method='ols', or method='mle', respectively. 



# Exhibit 7.6, page 165.
data(arma11.s)
arima(arma11.s, order=c(1,0,1),method='CSS')
# The arimafunction estimates an ARIMA(p,d,q) model for the time series passed to it as the first argument.
# Estimation can be carried out by the conditional sum-of-squares method (method= 'CSS') or maximum likelihood (method='ML').
# The default estimation method is maximum likelihood, with initial values determined by the CSS method. 
# The fitted model may also be saved as an object that can be further manipulated, for model diagnostics. 
# By default, if d = 0, a stationary ARMA model will be fitted. 
# Also, the fitted model is in the centered form; that is, an ARMA model fitted to the series minus its sample mean. 
# The intercept term reported in the output of the arima function is a misnomer, as it is in fact the mean! 
# However, the mean so estimated generally differs slightly from the sample mean.

Chapter 7 R Commands 445
# Exhibit 7.10 on page 168.
# This saves the fitted AR(3) model in the object named res. The output of the arima function is a list.
res=arima(sqrt(hare),order=c(3,0,0))
# find out what is saved in res. You will find that most of the things in res are not directly useful. 
str(res)
# Instead, the output of the arima function has to be processed by other functions for more informed summaries.  
residuals(res)
fitted(res)


set.seed(12345)
coefm.cond.norm=arima.boot(res,cond.boot=T,is.normal=T, B=1000,init=sqrt(hare))
# The arima.boot function carries out a bootstrap analysis based on a fitted ARIMA model. 
# Its first argument is a fitted ARIMA model, that is, the output from the arima function. 
# Four different bootstrap methods are available: 
## The bootstrap series can be initialized by a supplied value (cond.boot=T) or not (cond.boot=F), 
## a nonpara- metric bootstrap (is.normal=F) 
## a parametric bootstrap assuming normal innovations (is.normal=T) can be used. 
## For a conditional bootstrap, the initial values can be supplied as a vector 
# (the arima.boot function will use the initial values from the supplied vector). 
# The bootstrap sample size, say 1000, is specified by the B=1000 option. 
# The function arima.boot outputs a matrix with each row being the bootstrap estimate of the ARIMA coefficients 
# obtained by maximum likelihood estimation with the bootstrap data. 
# if B=1000 and the model is an AR(3), then the output is a 1000 by 4 matrix where each row consists of the bootstrap AR(1)
# AR(2), and AR(3) coefficients plus the mean estimate in that order ( φ^1, φ^2, φ^3, μ^ ).
# signif(apply(coefm.cond.norm,2,function(x) {quantile(x,c(.025,.975),na.rm=T)}),3)
# This is a compound R statement. It is equivalent to the two commands
temp=apply(coefm.cond.norm,2,function(x) {quantile (x,c(.025,.975),na.rm=T)})
signif(temp,3)
# except that the temporary variable temp is not created in the original compound statement. 
# Recall that the apply function is a general-purpose function for processing a matrix. 
# Here the apply function processes the matrix coefm.cond.norm column by column, 
# with each column supplied to the no-name user-supplied function

function(x){quantile(x,c(.025,.975),na.rm=T)}
# The third argument of the quantile function is specified as na.rm=T (na stands for not available and rm means remove),
# which means that any missing values in the input are discarded before computing the quantiles. 
# This specification is pivotal because by default any quantile of a dataset with some missing values is defined to be a 
# missing value (NA) in R. (Some bootstrap series may have convergence problems upon fitting an ARIMA model and hence the 
# output of the bootstrap function may contain some missing values.) To return to the interpretation of the command on the 
# right-hand side of temp, it instructs R to compute the 2.5th and 97.5th percentiles of each bootstrap coefficient estimate. 
# To enable precise calculations, R maintains many significant digits in the numbers stored in an object. 
# The printed version, however, usually requires fewer significant digits for clarity. 
# This can be done by the signif function. The signif function outputs the object passed into it as first argument, 
# but only to the number of significant digits specified in the second argument, which is three in the example. 
# Altogether, the compound R command computes the 95% bootstrap confidence intervals for each AR coefficient.
