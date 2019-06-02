We show some R code to simulate your own random walk with, say, 60 independent standard normal errors.
# Exhibit 2.1 on page 14.
n=60  # This assigns the value of 60 to the object named n.


# This initializes the random number generator so that the simulation is reproducible if needed.
set.seed(12345) 


# The expression rnorm(n) generates n independent values from the standard normal distribution. 
# The function cumsum then computes the vector of cumulative sums of the normally distributed sample, resulting in a random walk realization. 
# The random walk realization is then given the attribute of a time series and saved into the object named sim.random.walk.
sim.random.walk=ts(cumsum(rnorm(n)),freq=1,start=1) 


# plots the simulated random walk.
plot(sim.random.walk,type='o',ylab='Another Random Walk')

