# Exhibit 8.2 on page 177.
data(hare) 
m1.hare=arima(sqrt(hare),order=c(3,0,0)) 
m1.hare

# A constrained ARIMA model with some elements fixed at certain values can be fitted by using the fixed argument in the 
# arima function. The fixed argument should be a vector of the same length as the coefficient vector and its elements set 
# to NA for all of the free elements but set to zero (or another fixed value) for all of the con- strained coefficients. 
# here the AR(2) coefficient is constrained to be zero ( φ2 = 0 ) and hence fixed=c(NA,0,NA,NA), 
# that is, the AR(1), AR(3), and the ‘‘intercept’’ term are free parameters, whereas the AR(2) is fixed at 0. 
# Remember that the ‘‘intercept’’ term is last. 
# Below is the command for fitting the constrained AR(3) model for the hare data.
m2.hare=arima(sqrt(hare),order=c(3,0,0), fixed=c(NA,0,NA,NA))
m2.hare
# Note that the intercept term is actually the mean in the centered form of the ARMA model; 
# that is, if y = sqrt(hare) − intercept, then the model is
# yt = 0.919yt–1 –0.5313yt–3 +et

plot(rstandard(m2.hare), ylab='Standardized Residuals',type='b')
abline(h=0)

# Exhibit 8.12 on page 185 (prefaced by some commands in Exhibit 8.1 on page 176)
data(color) 
m1.color=arima(color,order=c(1,0,0)) 
tsdiag(m1.color,gof=15,omit.initial=F)
# The tsdiag function in the TSA package has been modified from that in the stats package of R. 
# It performs model diagnostics on a fitted model. 
# The argument gof specifies the maximum number of lags in the acf function used in the model diagnostics. 
# Setting the argument omit.initial=T omits the few initial residuals from the analysis. 
# This option is especially useful for checking seasonal models where the initial residuals are close to zero by construction 
# and including them may skew the model diagnostics. 
# In the example, the omit.initial argument is set to be F so that the diagnostics are done with all residuals. 
# Recall that the Ljung-Box (portmanteau) test statistic equals the weighted sum of the squared residual autocorrelations 
# from lags 1 to K, say; see Equation (8.1.12) on page 184. 
# Assuming that the ARIMA orders are correctly specified, the validity of the approximate chi-square distribution for 
# the Ljung-Box test statistic requires that K be larger than the lag beyond which the original time series has negligible 
# autocorrelation. The modified tsdiag function in the TSA package checks this requirement; 
# consequently the Ljung-Box test is only computed for sufficiently large K. 
# If the required K is larger than the specified maximum lag, tsdiag will return an error message.
# This problem can be solved by increasing the maximum lag asked for. 
