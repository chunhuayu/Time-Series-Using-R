# To create a data vec- tor named Dat containing, say, 31, 4, 15, and 93
Dat=c(31,4,15,93)

# A time series is a vector with additional information on the epoch of the first datum and the number of data per a basic 
# unit of time interval. suppose we have quarterly data starting from the sec- ond quarter of 2006: 12, 31, 22, 24, 30. 
# This time series can be created as follows:
> Dat2=ts(c(12,31,22,24,30), start=c(2006,2), frequency=4)
> Dat2
     Qtr1 Qtr2 Qtr3 Qtr4
2006        12   31   22
2007   24   30

> log(Dat2)
Qtr1     Qtr2     Qtr3     Qtr4
     2.484907 3.433987 3.091042
2006
2007 3.178054 3.401197

# Furthermore, vectors and time series can be manipulated algebraically with the usual addition (+), subtraction (-), 
# multiplication (*), division (/), or power (^ or **) carried out element by element. 
# applying the transformation y = 2x^3 􏰋 x + 7 to Dat2 and saving the transformed data to a new time series named new.
# Dat2 can be easily carried out by the command
> new.Dat2= 2*Dat2^3-Dat2+7

# Exhibit 1.1 on page 2. 
library(TSA)
win.graph(width=4.875,height=2.5,pointsize=8)
data(larain)
# This loads the time series larain into the R session and makes it available for further analysis such as
plot(larain,ylab='Inches',xlab='Year',type='o')

# Exhibit 1.2 on page 2. 
win.graph(width=3,height=3,pointsize=8) 
plot(y=larain,x=zlag(larain),ylab='Inches',xlab='Previous Year Inches')

# Exhibit 1.3 on page 3.
data(color)
plot(color,ylab='Color Property',xlab='Batch',type='o')
plot(color, color, ylab='Color Property', xlab='Batch',type='o')
as.vector(color)
plot(as.vector(color), color, ylab='Color Property', xlab='Batch',type='o')


# Exhibit 1.4 on page 4. 
plot(y=color,x=zlag(color),ylab='Color Property',
xlab='Previous Batch Color Property')
# The zlag function outputs an ordinary vector; that is, zlag(color) is the lag 1 of color, 
but with its time series attribute stripped. 


# Exhibit 1.9 on page 7.
plot(oilfilters,type='l',ylab='Sales')
# creates a vector named Month that contains 12 elements that represent the 12 months of the year beginning with July.
Month=c('J','A','S','O','N','D','J','F','M','A','M','J') 
# Points is a low-level graphics function that draws on top of an existing graph. Since oilfilters is a time series, 
# points plots oilfilters against time order, but the argument pch=Month instructs the points function to plot the data points 
# using the successive values of the Month vector as plotting symbols. 
# So, the first point plotted is plotted as a J, the second as an A, and so forth. 
# When the values of Month are used up, they are recycled; think of Month being replicated as Month, Month, Month,􏰇, 
# to make up any deficiency. So, the 13th data point is plotted as a J and the 14th as an A. 
# What letter is used for the 30th data point?
# Alternatively, the exhibit can be reproduced by the following commands
points(oilfilters,pch=Month)
plot(oilfilters,type='l',ylab='Sales') points(y=oilfilters,x=time(oilfilters),
   pch=as.vector(season(oilfilters)))

