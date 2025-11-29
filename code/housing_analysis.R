getwd()
setwd("C:/R/MN3515_HOUSING/data")
Housing <- read.csv("Housing.csv")
Housing
summary(Housing)
str(Housing)
library(dplyr)
houses_below_3_mil <- Housing %>%
  filter(price > 3000000)
View(houses_below_3_mil)
mean(Housing$price)
median(Housing$price)
Housing %>%
  summarise(across(where(is.numeric), mean, na.rm = TRUE))
Housing %>%
  summarise(across(where(is.numeric), \(x) mean(x, na.rm = TRUE)))
library(ggplot2)
ggplot(Housing, aes(x = price)) +
  geom_histogram(binwidth = 100000, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Histogram of House Prices",
       x = "price",
       y = "frequency") +
  theme_minimal()
pivot_bedrooms <- Housing %>%
  group_by(bedrooms) %>%
  summarise(avg_price = mean(price, na.rm = TRUE))
pivot_bedrooms
pivot_furnishing <- Housing %>%
  group_by(furnishingstatus) %>%
  summarise(avg_price = mean(price, na.rm = TRUE))
pivot_furnishing
sd(Housing$price, na.rm = TRUE)
var(Housing$price, na.rm = TRUE)
sapply(Housing, class)


sapply(Housing, class)
categorical_vars <- names(Housing)[sapply(Housing, function(col) is.character(col) || is.factor(col))]
print(categorical_vars)

install.packages("scales")
library(scales)

library(ggplot2)
ggplot(Housing, aes(x = furnishingstatus, y = price)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Price by Furnishing Status",
       x = "Furnishing Status", y = "Price") +
  scale_y_continuous(labels = comma) +
  theme_minimal()

ggplot(Housing, aes(x = airconditioning, y = price)) +
  geom_boxplot(fill = "lightgreen", color = "black") +
  labs(title = "Price by Air Conditioning", 
       x = "Air Conditioning", y = "Price") +
  scale_y_continuous(labels = comma) +
  theme_minimal()


ggplot(Housing, aes(x = prefarea, y = price)) +
  geom_boxplot(fill = "lightcoral", color = "black") +
  labs(title = "Price by Preferred Area",
       x = "Preferred Area", y = "Price") +
  scale_y_continuous(labels = comma) +
  theme_minimal()


install.packages("scales")
library(scales)
library(ggplot2)
ggplot(Housing, aes(x = prefarea, y = price)) +
  geom_boxplot(fill = "lightcoral", color = "black") +
  labs(title = "Price by Preferred Area",
       x = "Preferred Area", y = "Price") +
  scale_y_continuous(labels = comma) +
  theme_minimal()


library(dplyr)
library(ggplot2)


average_price_by_bedroom <- Housing %>% 
  group_by(bedrooms) %>%
  summarise(average_price = mean(price, na.rm = TRUE))

ggplot(average_price_by_bedroom, aes(x = factor(bedrooms), y = average_price)) +
  geom_bar(stat = "identity", fill = "steelblue") + 
  labs(x = "Number of Bedrooms", y = "Average Price", title = "Average Price by Number of Bedrooms") +
  scale_y_continuous(labels = comma) +
  theme_minimal()


average_price_by_stories <- Housing %>% 
  group_by(stories) %>%
  summarise(average_price = mean(price, na.rm = TRUE))

ggplot(average_price_by_stories, aes(x = factor(stories), y = average_price)) +
  geom_bar(stat = "identity", fill = "orange") +
  labs(x = "Number of Stories", y = "Average Price", title = "Average Price by Number of Stories") + 
  scale_y_continuous(labels = comma) +
  theme_minimal()


colSums(is.na(Housing))
sum(duplicated(Housing))

Housing$furnishingstatus <- as.factor(Housing$furnishingstatus)
Housing$airconditioning <- as.factor(Housing$airconditioning)
Housing$prefarea <- as.factor(Housing$prefarea)


model <- lm(price ~ bedrooms + bathrooms + stories + mainroad + guestroom + basement + hotwaterheating + airconditioning + parking + prefarea + furnishingstatus, data = Housing)
summary(model)

par(mfrow = c(2, 2))
plot(model)

options(scipen = 999)

par(mfrow = c(2, 2))
plot(model)


model_log <- lm(log(price) ~ bedrooms + bathrooms + stories + mainroad + guestroom + basement + hotwaterheating + airconditioning + parking + prefarea + furnishingstatus, data = Housing)
summary(model_log)

library(MASS)
step(model_log, direction = "both")

par(mfrow = c(2, 2))
plot(model_log)


predicted_log_prices <- predict(model_log)
predicted_prices <- exp(predicted_log_prices)

set.seed(123)
split <- sample(1:nrow(Housing), 0.7 * nrow(Housing))
train <- Housing[split, ]
test <- Housing[ -split, ]

model_train <- lm(log(price) ~ bedrooms + bathrooms + stories + mainroad + guestroom + basement +
                    hotwaterheating + airconditioning + parking + prefarea + furnishingstatus, 
                  data = train)
pred_log <- predict(model_train, newdata = test)
pred_price <- exp(pred_log)

actual_price <- test$price
mean(abs(pred_price - actual_price)) / mean(actual_price)
