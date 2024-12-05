install.packages("GGally")
install.packages("NHANES")

library(tidyverse)
library(GGally)
library(readr)
library(NHANES)

# load NHANES data
data("NHANES")

View(NHANES)

# create a sub-table that only has BMI, Age, Gender and Cholesterol

health_data <- NHANES %>% select(BMI,Age,Gender,TotChol)

# create a histogram of BMI using ggplot

ggplot(health_data, aes(x = BMI)) +
  geom_histogram(binwidth = 1, fill = "magenta", colour = "black")
labs(title = "Mean height in Wales is higher than European Average") +
  theme_minimal()

# create a correlation plot

val_cor <- health_data %>% select(BMI,Age,TotChol) %>% 
  cor(health_data, use = "complete.obs")

ggcorr(val_cor, label = TRUE, label_alpha = TRUE)

