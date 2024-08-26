# load the packages needed
library("mgcv")
library("withr")

# create a data set
my_data <- with_seed(123, gamSim())

# create a model
my_gam <- gam(y ~ x0 + s(x1) + s(x2) + s(x3), data = my_data, method = "REML")
