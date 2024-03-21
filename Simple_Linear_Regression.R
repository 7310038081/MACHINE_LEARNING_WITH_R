#         SIMPLE LINEAR REGRESSION         #


dataset = read.csv('Salary_Data.csv')

library('caTools')
set.seed(123)

split = sample.split(dataset$Salary, SplitRatio = 2/3)

training_set = subset(dataset , split == TRUE)
test_set = subset(dataset, split == FALSE)

regressor = lm(formula = Salary ~ YearsExperience , data = training_set)
y_pred = predict(regressor , new_data = test_set)

library('ggplot2')

#TRAINING SET

ggplot() +
  geom_point(aes(x= training_set$YearsExperience , y = training_set$Salary , 
                 color = 'red')) +
  geom_line(aes(x = training_set$YearsExperience , y = predict(regressor
                                                               ,new_data = training_set)), color = 'blue') +
  ggtitle('Salary vs Experience') +
  xlab('Experience')+
  ylab('Salary')

#TEST SET

ggplot() +
  geom_point(aes(x= test_set$YearsExperience , y = test_set$Salary , 
                 color = 'red')) +
  geom_line(aes(x = training_set$YearsExperience , y = predict(regressor
                                                               ,new_data = training_set)), color = 'blue') +
  ggtitle('Salary vs Experience') +
  xlab('Experience')+
  ylab('Salary')









