# Install from github the datarium package: https://rdrr.io/github/kassambara/datarium/
#   Load the marketing data set in R by: data("marketing", package = "datarium")
#  Find the best linear regression model to predict sales by using 10-fold CV
# and LOOCV. Estimate in addition to the MSE its standard error.

# For a cohort of people we know that 13 of them did get a flu shot at the beginning
# of the winter and 28 did not. Of the 13 who had a flu shot, 3 got the flu during
# the winter. Of the 28 who did not get a flu shot, 15 got the flu.
# 
# Estimate the p-value using the hypothesis test.
# Estimate the p-value directly by using the sampling distribution.


install.packages("tidyverse")
library(tidyverse)
install.packages("caret")
library(caret)
install.packages("ISLR")
library(ISLR)
install.packages("boot")
library(boot)

install.packages("remotes")
remotes::install_github("kassambara/datarium")

set.seed(123)
data("marketing", package = "datarium")
marketing



table <- matrix(c(3, 10, 15, 13), nrow = 2)
colnames(table) <- c("Got Flu Shot", "Did not get Flu Shot")
rownames(table) <- c("Got the Flu", "Did not get the Flu")
table

# Perform the two-sample proportion test
prop.test(table)

#Estimate the p-value directly by using the sampling distribution
pooled_prop <- (3 + 15) / (13 + 28)
pooled_prop

#question3
#question3
library(tidyverse)
library(caret)
set.seed(123)

data("marketing", package = "datarium")
marketing

r_sample <- createDataPartition(marketing $ sales,p = 0.8, list = FALSE)

train_data <- marketing[r_sample, ]

test_data <- marketing[-random_sample, ]

model <- lm(sales ~., data = train_data)

predictions <- predict(model, test_data)

#using 10-fold CV
train_control <- trainControl(method = "cv",number = 10)

model <- train(sales ~., data = marketing, method = "lm", trControl = train_control)

print(model)

mse <- model$results$RMSE^2
mse_se <- sd(model$resample$RMSE^2) / sqrt(10)

# using Leave One Out Cross Validation
train_control <- trainControl(method = "LOOCV")

model <- train(sales ~., data = marketing, method = "lm", trControl = train_control)

print(model)

mse <- model$results$RMSE^2
mse_se <- sd(model$resample$RMSE^2) / sqrt(nrow(marketing))

