## Pupil Population For 2022 Academic Session

# load the packages

pacman::p_load("rio",
               "tidyverse",
               "janitor",
               "lubridate",
               "here")

# load population data
# import data sheets and assign results as school_list_

library(readxl)
library(lubridate)
library(ggplot2)

school_list_creche <- read_excel("school_list.xlsx", sheet = 2, skip = 7)
school_list_playgrp <- read_excel("school_list.xlsx", sheet = 3, skip = 7)
school_list_prep <- read_excel("school_list.xlsx", sheet = 4, skip = 7)
school_list_nursery_1 <- read_excel("school_list.xlsx", sheet = 5, skip = 7)
school_list_nursery_2 <- read_excel("school_list.xlsx", sheet = 6, skip = 7)
school_list_primary_1 <- read_excel("school_list.xlsx", sheet = 7, skip = 7)

class_arm_list <- openxlsx::getSheetNames("school_list.xlsx")

class_arm_creche <- class_arm_list[2]
class_arm_playgrp <- class_arm_list[3]
class_arm_prep <- class_arm_list[4]
class_arm_nursery_1 <- class_arm_list[5]
class_arm_nursery_2 <- class_arm_list[6]
class_arm_primary_1 <- class_arm_list[7]

## Cleaning Pipe

# clean school_list_creche

creche_list <- school_list_creche %>%
  janitor::clean_names() %>%
  
  select(!"s_n") %>%
  
  mutate(class_arm = class_arm_creche) %>%
  
  mutate(birthday_date = as.Date(birthday_date, origin = "1970-01-01")) %>%

  filter(!name == "NA") %>%

  distinct()
  
# clean school_list_playgrp

playgrp_list <- school_list_playgrp %>%
  janitor::clean_names() %>%

  select(!"s_n") %>%
  
  mutate(class_arm = class_arm_playgrp) %>%

  mutate(birthday_date = as.Date(birthday_date, origin = "1970-01-01")) %>%
  
  filter(!name == "NA") %>%
  
  distinct()

# clean school_list_prep

prep_list <- school_list_prep %>%
  janitor::clean_names() %>%
  
  select(!"s_n") %>%
  
  mutate(class_arm = class_arm_prep) %>%
  
  mutate(birthday_date = as.Date(birthday_date, origin = "1970-01-01")) %>%
  
  filter(!name == "NA") %>%
  
  distinct()

# clean school_list_nursery_1

nursery_1_list <- school_list_nursery_1 %>%
  janitor::clean_names() %>%
  
  select(!"s_n") %>%
  
  mutate(class_arm = class_arm_nursery_1) %>%
  
  mutate(birthday_date = as.Date(birthday_date, origin = "1970-01-01")) %>%
  
  filter(!name == "NA") %>%
  
  distinct()

# clean school_list_nursery_2

nursery_2_list <- school_list_nursery_2 %>%
  janitor::clean_names() %>%
  
  select(!"s_n") %>%
  
  mutate(class_arm = class_arm_nursery_2) %>%
  
  mutate(birthday_date = as.Date(birthday_date, origin = "1970-01-01")) %>%
  
  filter(!name == "NA") %>%
  
  distinct()

# clean school_list_primary_1

primary_1_list <- school_list_primary_1 %>%
  janitor::clean_names() %>%

  select(!"s_n") %>%
  
  mutate(class_arm = class_arm_primary_1) %>%
  
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

school_list_cleaned %>%
  
  ggplot(aes(x=class_arm)) +
  
  theme_bw() +
  
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.border = element_blank(), 
        axis.line = element_line()) +
  
  geom_bar(aes(fill = gender)) +
  
  facet_grid(rows = vars(status))

