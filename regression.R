whistler_data <- read.csv("whistler_data.csv",header=TRUE)
#assume exchange rates do not change
whistler_data[93, 8] <- whistler_data[92, 8]
whistler_data[93,9] <- whistler_data[92,9]

#commented out code to exclude exchange rates
#cols <- c(1:7, 10)
training_data <- whistler_data[1:92,]
test_data <- whistler_data[93,]

lm.fit <- lm(actual_demand~., data = training_data[,-1])
pred <- predict.lm(lm.fit, test_data[,-1])
mu <- unname(pred)
print(pred)
summary(lm.fit)

library(Metrics)
sigma <- rmse(training_data$actual_demand, lm.fit$fitted.values)