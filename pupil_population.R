## Pupil Population For 2022 Academic Session

# load the packages

pacman::p_load("rio",
               "tidyverse",
               "janitor",
               "lubridate",
               "here")

# load population data
# import data sheets and assign results as school_list_

school_list_raw <- openxlsx::getSheetNames("school_list.xlsx")

library(readxl)
library(lubridate)

school_list_creche <- read_excel("school_list.xlsx", sheet = 2, skip = 7)
school_list_playgrp <- read_excel("school_list.xlsx", sheet = 3, skip = 7)
school_list_prep <- read_excel("school_list.xlsx", sheet = 4, skip = 7)
school_list_nursery_1 <- read_excel("school_list.xlsx", sheet = 5, skip = 7)
school_list_nursery_2 <- read_excel("school_list.xlsx", sheet = 6, skip = 7)
school_list_primary_1 <- read_excel("school_list.xlsx", sheet = 7, skip = 7)

## Cleaning Pipe

# clean school_list_creche

creche_list <- school_list_creche %>%
  janitor::clean_names() %>%
  
  select(!"s_n") %>%
  
  mutate(birthday_date = as.Date(birthday_date, origin = "1970-01-01")) %>%

  filter(!name == "NA") %>%

  distinct()
  
# clean school_list_playgrp

playgrp_list <- school_list_playgrp %>%
  janitor::clean_names() %>%

select(!"s_n") %>%

  mutate(birthday_date = as.Date(birthday_date, origin = "1970-01-01")) %>%
  
  filter(!name == "NA") %>%
  
  distinct()

# clean school_list_prep

prep_list <- school_list_prep %>%
  janitor::clean_names() %>%
  
  select(!"s_n") %>%
  
  mutate(birthday_date = as.Date(birthday_date, origin = "1970-01-01")) %>%
  
  filter(!name == "NA") %>%
  
  distinct()

# clean school_list_nursery_1

nursery_1_list <- school_list_nursery_1 %>%
  janitor::clean_names() %>%
  
  select(!"s_n") %>%
  
  mutate(birthday_date = as.Date(birthday_date, origin = "1970-01-01")) %>%
  
  filter(!name == "NA") %>%
  
  distinct()

# clean school_list_nursery_2

nursery_2_list <- school_list_nursery_2 %>%
  janitor::clean_names() %>%
  
  select(!"s_n") %>%
  
  mutate(birthday_date = as.Date(birthday_date, origin = "1970-01-01")) %>%
  
  filter(!name == "NA") %>%
  
  distinct()

# clean school_list_primary_1

primary_1_list <- school_list_primary_1 %>%
  janitor::clean_names() %>%

select(!"s_n") %>%
  
  mutate(birthday_date = as.Date(birthday_date, origin = "1970-01-01")) %>%
  
  filter(!name == "NA") %>%
  
  distinct()

## Organizing class lists into cleaned school list

# define clean school list

school_list_cleaned <- bind_rows(creche_list, 
                            playgrp_list, 
                            prep_list, 
                            nursery_1_list, 
                            nursery_2_list, 
                            primary_1_list)

