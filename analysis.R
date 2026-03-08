# Load packages
library(readxl)
library(dplyr)

# Load data
database <- read_excel("Assignment2_data.xlsx")

# Filter by birthday (user birthday = 29)
mydata <- database[which(database$birthday29 == "1"),]

# Linear Probability Model (Hypotheses 1-3)

model1 <- lm(accepted ~ profile_race + rep_state +
               profile_race:rep_state +
               gender + factor(education) ,
             data = mydata)

summary(model1)

# Subset for accepted = 1 for num_messages DV
accepted_data <- mydata %>% filter(accepted == "1")
# OLS model (Hypotheses 4-5)
model2 <- lm(num_messages ~ profile_race + rep_state +
               profile_race:rep_state +
               gender + factor(education),
             data = accepted_data)

summary(model2)
