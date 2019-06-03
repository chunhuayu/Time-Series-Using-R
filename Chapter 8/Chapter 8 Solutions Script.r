# (a)  Plot the sample ACF of the residuals. Comment on the size of the correlations. 
hare.sqr=(hare)^0.5
hare.fit=arima(hare.sqr,order=c(3,0,0))
acf(residuals(hare.fit))

# (b)  Calculate the Ljung-Box statistic summing to K = 9. Does this statistic sup- port the AR(3) specification? 
LB.test(hare.fit,lag=9)

# (c)  Perform a runs test on the residuals and comment on the results
runs(residuals(hare.fit))

# (d)  Display the quantile-quantile normal plot of the residuals. Comment on the plot. 
qqnorm(residuals(hare.fit))
qqline(residuals(hare.fit))

# (e)  Perform the Shapiro-Wilk test of normality on the residuals. 
shapiro.test(residuals(hare.fit))
