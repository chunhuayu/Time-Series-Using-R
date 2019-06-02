# 3.6 a 
library('TSA')
data(beersales)
plot(beersales,ylab='Monthly Sales',type='o')

# 3.6 b
plot(beersales,ylab='Monthly Sales',type='l')
points(y=beersales,x=time(beersales),pch=as.vector(season(beersales)))

# 3.6 c
month.=season(beersales)
Bsales.lm=lm(beersales~month.)
summary(Bsales.lm)

# 3.6 d
plot(y=rstudent(Bsales.lm),x=as.vector(time(beersales)),type = 'l',xlab='Time',ylab = 'Standardized Residuals')
points(y=rstudent(Bsales.lm),x=as.vector(time(beersales)),pch=as.vector(season(beersales)))

# 3.6 e
Bsales.lm2=lm(beersales~month.+time(beersales)+I(time(beersales)^2))
summary(Bsales.lm2)


# 3.6 f
plot(y=rstudent(Bsales.lm2),x=as.vector(time(beersales)),type = 'l',xlab='Time',ylab = 'Standardized Residuals')
points(y=rstudent(Bsales.lm2),x=as.vector(time(beersales)),pch=as.vector(season(beersales)))

# 3.12 a
Bsales.lm2=lm(beersales~month.+time(beersales)+I(time(beersales)^2))
resid.lm2=rstudent(Bsales.lm2)
round(resid.lm2,3)       # round residuals up to three decimal places

# 3.12 b
runs(resid.lm2)     # resid.lm2=rstudent(Bsales.lm2)

# 3.12 c
acf(resid.lm2)

# 3.12 d
qqnorm(resid.lm2)             # resid.lm2=rstudent(Bsales.lm2)    
qqline(resid.lm2)
hist(resid.lm2,xlab = 'Standardized Residuals')     # resid.lm2=rstudent(Bsales.lm2)
shapiro.test(resid.lm2)
