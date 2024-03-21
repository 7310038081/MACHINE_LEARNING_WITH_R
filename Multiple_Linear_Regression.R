# MULTIPLE LINEAR REGRESSION #
dataset = read.csv('50_Startups.csv')
View(dataset)

#Categorical data
dataset$State =  factor(dataset$State , levels = c('New York','California','Florida')
                        , labels = c(1,2,3)),
library(caTools)
set.seed(123)

split = sample.split(dataset$Profit , SplitRatio = 0.8 )
training_set = subset(dataset , split == TRUE)
test_set = subset(dataset , split == FALSE)

# Applying multiple linear regression in training set

regressor = lm(formula = Profit~. , data = training_set)
summary(regressor)

# Predict the test set results 

y_pred = predict(regressor, newdata = test_set )


#Building the optimal model using Backward elimination
regressor = lm(formula = Profit~ R.D.Spend + Administration + 
                 Marketing.Spend + State, data = training_set)
summary(regressor)

regressor = lm(formula = Profit~ R.D.Spend + Administration + 
                 Marketing.Spend , data = training_set)
summary(regressor)


regressor = lm(formula = Profit~ R.D.Spend + Administration , data = training_set)
summary(regressor)


regressor = lm(formula = Profit~ R.D.Spend  , data = training_set)
summary(regressor)