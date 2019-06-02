# Exhibit 6.9 on page 120. 
acf(ma2.s,ci.type='ma',xaxp=c(0,20,10))
# The argument ci.type='ma' instructs R to plot the sample ACF with the confidence band for the kth lag ACF computed based on 
# the assumption of an MA(k − 1) model. See Equation (6.1.11) on page 112 for details.

# Exhibit 6.11 on page 121.
pacf(ar1.s,xaxp=c(0,20,10))
#This calculates and plots the sample PACF function. Run the command ?par to learn more about the xaxp argument.

# Exhibit 6.17 on page 124.
eacf(arma11.s)
# This computes the sample EACF function (extended autocorrelation function) of the data arma11.s.
# The maximum AR and MA orders can be set via the ar.max and ma.max arguments. 
# Their default values are seven and thirteen, respectively. 
# computes the EACF with maxi- mum AR and MA orders of 10. 
# The EACF function prints a table of symbols with X standing for a significant value and O a nonsignificant value.
eacf(arma11.s,ar.max=10,ma.max=10) 


# This loads the uroot library and the following commands illustrate the computation of the Dickey-Fuller unit-root test.
library(uroot)
# This command finds the AR order for the differenced series, which is order 8, by the minimum AIC criterion.
ar(diff(rwalk))

# This computes the ADF test for the data rwalk. The selectlags argument takes a list as its value. 
# The mode argument specifies which lags must be included, and if it is absent, then the Pmax argument sets the maximum lag 
# and the ADF.test function determines which lags to include in the test using several methods by setting the mode to signif, 
# aic, or bic. The option signif is the default value for mode, 
# which estimates a subset AR model by retaining only significant lags. The argument itsd expects a vector; 
# the first two elements are binary, indicating whether to include a constant term (if the first element is 1) 
# or a linear time trend (if the second element is 1); 
# and the third element zero if there are no more covariates to include in the model. 
# See the help pages for the ADF.test function to learn more about it. 
# Hence, the R command instructs ADF.test to carry out the test with the null hypothesis that the model has a unit root 
# and an intercept term. The alternative is that the model is stationary, so a small p-value implies stationarity!
ADF.test(rwalk,selectlags=list(mode=c(1,2,3,4,5,6,7,8), Pmax=8),itsd=c(1,0,0))
ADF.test(rwalk,selectlags=list(Pmax=0),itsd=c(1,0,0))
# In comparison, the preceding command carries out the ADF test with the null hypothesis being that the model has a unit root, an intercept but no other lags, whereas the alter- native specifies that the model is a stationary AR(1) model with an intercept. If itsd=c(0,0,0), then the alternative model is a centered stationary AR(1) model, that is, with zero mean. Such a hypothesis is not relevant unless the data are already mean-corrected.



# Exhibit 6.22 on page 132.
# This simulates a subset ARMA model. Here rep(0,11) stands for a sequence of 11 zeros.
set.seed(92397) test=arima.sim(model=list(ar=c(rep(0,11),.8),
ma=c(rep(0,11),0.7)),n=120)


# The armasubsets function computes various subset ARMA models, 
# with the maxi- mum AR and MA orders specified by the nar and nma arguments, both set as 14 in the example above. 
# The associated AR models are estimated by the default method of ols (ordinary least squares).
# The armasubsets function computes various subset ARMA models, with the maxi- mum AR and MA orders specified by the nar 
# and nma argumentsboth set as 14 in the example above. 
# The associated AR models are estimated by the default method of ols (ordinary least squares).
res=armasubsets(y=test,nar=14,nma=14,y.name='test', ar.method='ols')


# it draws a table indicating several of the best subset ARMA models.
plot(res)
