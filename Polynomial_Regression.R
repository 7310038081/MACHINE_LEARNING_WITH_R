 # POLYNOMIAL REGRESSION 
dataset = read.csv('Position_Salaries.csv')
View(dataset)

dataset = dataset[2:3]

dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
 
regressor = lm(formula = Salary~. , data = dataset)


# VISUALISATION THE POLYNOMIAL REGRESSION RESULTS
library(ggplot2)

ggplot() +
  geom_point(aes( x= dataset$Level , y = dataset$Salary), color = 'red')+
  geom_line(aes(x = dataset$Level , y = predict(regressor , newdata = dataset)) , color = 'blue')+
  ggtitle('truth or bluff')+
  xlab('Level')+
  ylab('Salary')

# Predicting a new result with polynomial regression 

y_predict = predict(regressor , data.frame(Level=6.5,
                                           Level2 = 6.5^2,
                                           Level3 = 6.5^3,
                                           Level4 = 6.5^4))
