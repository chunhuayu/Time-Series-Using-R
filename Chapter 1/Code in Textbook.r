# To create a data vec- tor named Dat containing, say, 31, 4, 15, and 93
Dat=c(31,4,15,93)

# A time series is a vector with additional information on the epoch of the first datum and the number of data per a basic unit of time interval. 
# For example, suppose we have quarterly data starting from the sec- ond quarter of 2006: 12, 31, 22, 24, 30. 
# This time series can be created as follows:
> Dat2=ts(c(12,31,22,24,30), start=c(2006,2), frequency=4)
> Dat2
     Qtr1 Qtr2 Qtr3 Qtr4
2006        12   31   22
2007   24   30
