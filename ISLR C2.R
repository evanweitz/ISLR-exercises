# Chapter 2 answers 
# Conceptual

# 1 
# a: When the number of samples is high and the number of predictors is low, a more flexible method
# will have a low risk of overfitting.
# b: When the number of predictors is large and the sample is small, a less flexible method is better
# so as to not overfit.
# c: When the relationship between predictors and response is highly nonlinear, a more flexible method
# will follow the data better.
# d: If the variance of the error term is very high, a an inflexbile method is better so that it isn't
# following/fitting to the error. 

# 2 
# a: Regression. We seek to predict one number with the others. n = 500, p = 3.
# b: Classification. n = 20, p = 13.
# c: Regression. n = 52, p = 3.

# 4
# a: Classification. Inference: classify students into groups, e.g. promising, average, needs help based on 
# HW scores, test scores, and discipline records. Predition: predict whether a component will need to be
# replaced/fixed or not for the entire coming year, based on age, maintenance logs, etc.
# b: Regression. Inference: GDP of a country based on geographical and demographical factors. Prediction: 
# number of points scored by an NBA player based on height, age, etc.
# c: Clustering. All inferential. Ex: measure genetic distance between different viral samples to determine 
# the number of strains. Ex2: mesure the purchases of each customer (purchased product = 1, didn't = 0),
# then with n products we have an n dimensional vector for each customer. See if they cluster into different
# types.

# 5
# A very flexible approach may be better when the relationship is nonlinear (esp higher deg polynomial). 
# It may be worse when the flexibility is too great and causes overfitting. It may also require measuring
# more predictors than we really want to or are able to. It is also harder to interpret.

# 6 
# For a parametric approach, we must only estimate the parameters and then use this to describe the distrib-
# ution. This makes a parametric analysis useful for recommendations. A nonparametric approach might require
# more data but can make more accurate predictions, especially when the form of the true distribution is 
# difficult to ascertain. 

# 7 
# a
seven_a = c(3,2,sqrt(10),sqrt(5),sqrt(2),sqrt(3))
# b Green because it's closed to obs. 5
# c Red because obs 6 and 2 are the next closest and are both Red.
# d Small, more neighbors makes the boundary less flexible since it uses more of the data points.

# 8 
install.packages("ISLR")
library(ISLR)
library(tidyverse)
college <- as.data.frame(College)
college <- as_tibble(college) # I like this better
pairs(college[,1:10])
ggplot(college, aes(x=Private, y = Outstate)) + geom_boxplot()
college <- college %>% mutate(Elite = Top10perc>50) #tidyverse version
ggplot(college, aes(x=Elite, y = Outstate)) + geom_boxplot()
ggplot(college, aes(x = Outstate)) + geom_histogram(binwidth = 1000)
ggplot(college, aes(x = PhD)) + geom_histogram(binwidth = 5)

# 9 
auto <- as_tibble(Auto)
# cylinders, origin, and name are qualitative
summary(auto) #tells all ranges
summary(auto[-(10:85),])
ggplot(auto, aes(x = weight, y = mpg)) + geom_point() #etc

#10 
library(MASS)
boston <- as_tibble(Boston)
pairs(boston) #shows crim: age, dis, rad, tax, ptratio
ggplot(boston, aes(x = age, y = crim)) + geom_point() #among them
summary(boston) #tells us the basics
ggplot(boston, aes(x = ptratio)) + geom_histogram(binwidth = 1) #for example
boston %>% filter(chas == 1) %>% count()
median(boston$ptratio)
boston %>% filter(medv == min(medv)) #or
subset(boston, medv == min(boston$medv))
# can see that the indicators are not the worst but not very good
boston %>% filter(rm>7) %>% count() #or
count(subset(boston, rm>7))
subset(boston, rm>8)
# high medv, low lstat, low indus