#### Preamble ####
# Purpose: Test the Data Cleaning and Analysis for COVID-19 Toronto Data
# Author: Saumya Bakshi
# Data: 9 February 2021
# Contact: saumya.bakshi@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours
# Any other information needed?


#### Workspace setup ####
# Use R Projects, not setwd().
library(opendatatoronto)
library(dplyr)
library(janitor)
library(ggplot2)
library(knitr)
library(kableExtra)
library(gridExtra)
library(grid)
# Read in the raw data. 
neighbourhoods <- 
  list_package_resources("https://open.toronto.ca/dataset/neighbourhoods/") %>% get_resource()
covid_dataset <- 
  list_package_resources("https://open.toronto.ca/dataset/covid-19-cases-in-toronto/") %>% 
  get_resource()

# Just keep some variables that may be of interest (change 
# this depending on your interests)
covid_mini = subset(covid_dataset, select=c("_id", "Age Group", "Classification", "Outcome"))
covid_mini <- clean_names(covid_mini)
covid_mini <- na.omit(covid_mini) 
covid_mini <- filter(covid_mini, covid_mini$classification == "CONFIRMED")

head_ = head(covid_mini)

kable(head_, caption = "COVID-19 Data Subset", booktabs = T) %>%
  kable_styling(full_width = T)
         

#### What's next? ####


### Pivot Table Creation ###

pivot_age_group = covid_mini %>%
  select(age_group, id, outcome) %>%
  group_by(age_group) %>%
  summarize(total_cases = length(!is.na(id)), total_deaths = length(outcome[outcome=="FATAL"]), 
            mortality_rate = total_deaths/total_cases)

kable(pivot_age_group, caption = "COVID 19 Cases by Age Group", booktabs = T) %>%
  kable_styling(full_width = T)

### Plot figures ###

plot1 <- 
  ggplot(pivot_age_group) +
  aes(x = age_group, y = total_cases) +
  geom_point(colour = "#0c4c8a") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
plot2 <- 
  ggplot(pivot_age_group) +
  aes(x = age_group, y = total_deaths) +
  geom_point(colour = "#FF0000") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

grid.arrange(plot1, plot2, ncol=2)


         