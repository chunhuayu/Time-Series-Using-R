### Q1
set.seed(15716)
data1=arima.sim(n=60,list(ar=0.6,ma=0.4))+100
data1.1st=window(data1,end=50)
data1.2nd=window(data1,start=51)
### Q1.a
model1=arima(data1.1st,order = c(1,0,1),method = "ML")
model1
### Q1.b
model1.FC=plot(model1,n.ahead=10,ylab = 'Data1(Forecasts)',pch=19)$pred
abline(h=coef(model1)[names(coef(model1))=='intercept'])
model1.FC
### Q1.c
AC.FC=cbind(data1.2nd,model1.FC)
AC.FC
### Q1.d
plot(model1,n.ahead=10,ylab = 'Data1 with Forecasts',pch=19)
points(data1.2nd,pch=12)
abline(h=coef(model1)[names(coef(model1))=='intercept'])

### Q2
### Q2.a
data(deere3)
plot(deere3,type='o',ylab='Deviations')
### Q2.b
acf(deere3)
pacf(deere3)
### Q2.c
eacf(deere3)
res=armasubsets(y=deere3,nar=8,nma=8,y.name='test',ar.method='ols')
plot(res)
arima(deere3,order = c(1,0,0),method="ML")
### Q2.d
model2=arima(deere3,order=c(1,0,0))
plot(rstandard(model2),ylab ='Standardized Residuals',type='o'); abline(h=0)
acf(rstandard(model2))
qqnorm(residuals(model2));qqline(residuals(model2))
shapiro.test(residuals(model2))
### Q2.e
model2.FC=plot(model2,n.ahead=10)
model2.FC$pred
### Q2.f
plot(model2,n.ahead = 10,ylab = 'Deviations',xlab='Year',pch=19)
abline(h=coef(model2)[names(coef(model2))=='intercept'])

### Q3
data("electricity")
### Q3.a
plot(electricity,type = 'o')
### Q3.b
BoxCox.ar(electricity)
### Q3.c
W=log(as.vector(electricity))
plot(W,type='o',ylab='log(electricity)')
### Q3.d
DW=diff(W)
plot(diff(W),type='o',ylab = '1st diff of Log(electricity)')
### Q3.e
acf(DW,lag.max = 36)
pacf(DW,lag.max = 36)
plot(diff(DW),ylab='Seasonal & First Diff of W')
### Q3.f
SDW=diff(DW,lag = 12)
plot(SDW,type = 'o',ylab = 'Seasonal & First Diff of W')
### Q3.g
acf(SDW,lag.max = 36)
acf(SDW,lag.max = 36,ci.type='ma')
pacf(SDW,lag.max = 36)
### Q3.h
eacf(SDW,ar.max = 25,ma.max=25)
### Q3.i
Model3=arima(W,order=c(0,1,1),seasonal=list(order=c(0,1,1),period=12))
Model3

### Q4
# Exhibit 1.7 a time series plot of tempdub 
data("tempdub")
plot(tempdub,ylab='Temperature',type='o')
# Exhibit 3.3 desplays the results of fitting the seasonal means model to tempdub dataset
# period added to improve table display
# season() outputsthe montly index of tempdub as a factor
month.=season(tempdub)
# -1 remove the intercept term, displays hte results of fitting the seasonal means model to the Temp data.
model.2=lm(tempdub~month.-1)
summary(model.2)
# Exhibit 3.4 January is dropped automatically
model.3=lm(tempdub~month.)
summary(model.3)
# Exhibit 3.5 an example of fitting a cosine curve at the fundamental frequency to the average monthly temp series.
# cosine-sine trend
har.=harmonic(tempdub,1)
model.4=lm(tempdub~har.)
summary(model.4)
# Exhibit 3.6 ylim ensures that the y axis range fits the raw data and the fitted values
plot(ts(fitted(model.4),freq=12,start=c(1964,1)),
     ylab='Temperature',type='l',ylim = range(c(fitted(model.4),tempdub)))
points(tempdub)
# Exhibit 3.8
plot(y=rstandard(model.3),x=as.vector(time(tempdub)), xlab='Time',ylab='Standardized Residuals',type = 'o')
# Exhibit 3.9
plot(y=rstudent(model.3),x=as.vector(time(tempdub)),xlab='Time', ylab='Standardized Residuals', type='l')
points(y=rstudent(model.3),x=as.vector(time(tempdub)), pch=as.vector(season(tempdub)))
# Exhibit 3.10
plot(y=rstudent(model.3),x=as.vector(fitted(model.3)),xlab='Fitted Trend Values', ylab='Standardized Residuals',
     type='n')
points(y=rstudent(model.3),x=as.vector(fitted(model.3)),pch=as.vector(season(tempdub)))
# Exhibit 3.11
hist(rstudent(model.3),xlab = 'Standardized Residuals')
# Exhibit 3.12
qqnorm(rstudent(model.3))
# Exhibit 9.2
tempdub1=ts(c(tempdub,rep(NA,24)),start=start(tempdub),freq=frequency(tempdub))
har.=harmonic(tempdub,1)
m5.tempdub=arima(tempdub,order=c(0,0,0),xreg = har.)
newhar.=harmonic(ts(rep(1,24),start = c(1976,1),frequency = 12),1)
plot(m5.tempdub,n.ahead=24,n1=c(1972,1),newxreg=newhar.,type = 'b',ylab = 'Temperature',xlab='Year')

