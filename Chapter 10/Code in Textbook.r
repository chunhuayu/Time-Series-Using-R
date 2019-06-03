# Exhibit 10.3
plot(y=ARMAacf(ma=c(0.5,rep(0,10),0.8,0.4), lag.max=13)[-1],x=1:13,type='h',
xlab='Lag k',ylab=expression(rho[k]),axes=F,ylim=c(0,0.6)) points(y=ARMAacf(ma=c(0.5,rep(0,10),0.8,0.4),
   lag.max=13)[-1],x=1:13,pch=20)
abline(h=0)
axis(1,at=1:13, labels=c(1,NA,3,NA,5,NA,7,NA,9,NA,11,NA,13))
axis(2) text(x=7,y=.5,labels=expression(list(theta&=&-0.5,
   Theta&=&-0.8)))
# As the labeling of the figure requires Greek alphabets and subscripts, 
# the label information has to be passed via the expression function. Run the help menu
?plotmath 
# to learn more about how to do mathematical annotations in R.
# Exhibit 10.10 on page 237
m1.co2=arima(co2,order=c(0,1,1),
seasonal=list(order=c(0,1,1),period=12))
# The argument seasonal supplies the information on the seasonal part of the seasonal ARIMA model. 
# It expects a list with the seasonal order supplied in the component named order and the seasonal period entered via 
# the period component, so 
# the command above instructs the arima function to fit a seasonal ARIMA (0,1,1) × (0,1,1)12 model to the co2 series.
m1.co2
# This prints a summary of the fitted seasonal ARIMA model.
