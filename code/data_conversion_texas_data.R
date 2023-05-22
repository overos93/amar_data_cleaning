## Converting Texas coded data into separate data frame for BERT model
### Written by Henry Overos
### May 2023

# Packages
rm(list = ls())
pacman::p_load(tidyverse, rio, here)
dir <- here()
setwd(dir)

# Loading the data
testUsAfam <- import(here("data-raw", "test_usafam.csv"))
testUsProtest <- import(here("data-raw", "test_usprotest.csv"))
testIndDalit <- import(here("data-raw", "test_dalits_india.csv"))

#has the body of the text already attached
us_aapi <- import(here("data-raw", "us_aapi.xlsx")) %>% rename(., Country = Relevant)
protest <- import(here("data-raw", "protest_articles_test.xlsx"))

#does not have the body of the text already attached
us_protest <- import(here("data-raw", "usProtestCodedTest.xlsx"))
us_afam <- import(here("data-raw", "us_afam.xlsx")) %>% rename(., Country = Relevant)
ind_dalits <- readRDS("~/Dropbox/10-19 Research Projects/11_amar_research_note/data-raw/dalits_test_complete.rds")

# Fixing afam data
testUsAfam <- testUsAfam %>%
  mutate(ID = as.numeric(row_id))

us_afam <- us_afam %>%
  left_join(., testUsAfam, by = "ID")

us_afam <- us_afam %>%
  select(ID, Title, body, Protest = Protest.x, Protest_Type, Discrimination = Discrimination.x,
         Discrim_Type)

us_afam <- us_afam %>%
  mutate(Protest = as.factor(Protest)) %>%
  mutate(Protest_Type = as.factor(Protest_Type)) %>% 
  mutate(Discrimination = as.factor(Discrimination)) %>% 
  mutate(Discrim_Type = as.factor(Discrim_Type))

#### Cleaning US Protest Annotation Data ####
testUsProtest <- testUsProtest[-1, 1:8]

testUsProtest$V1 <- as.numeric(testUsProtest$V1)

colnames(testUsProtest) <- c("ID", "URL", "Title", "body", "Protest", "Protest_Type", "Discrimination", "Discrim_Type")

us_protest <- us_protest %>% left_join(., testUsProtest, by = "ID")

us_protest <- us_protest %>%
  select(ID, Title = Title.x, body, Protest = Protest.x, Protest_Type = Protest_Type.x,
         Discrimination = Discrimination.x,
         Discrim_Type = Discrim_Type.x)

us_protest <- us_protest %>%
  mutate(Protest = as.factor(Protest)) %>%
  mutate(Protest_Type = as.factor(Protest_Type)) %>% 
  mutate(Discrimination = as.factor(Discrimination)) %>% 
  mutate(Discrim_Type = as.factor(Discrim_Type))

#### Cleaning India Dalit Annotation Data ####
testIndDalit <- testIndDalit[-1, 1:4]

testIndDalit$V1 <- as.numeric(testIndDalit$V1)

colnames(testIndDalit) <- c("ID", "URL", "Title", "body")

ind_dalits <- ind_dalits %>% left_join(., testIndDalit, by = "ID")

ind_dalits <- ind_dalits %>%
  select(ID, Title = Title.x, body, Protest, Protest_Type,
         Discrimination = Discrim,
         Discrim_Type)

ind_dalits <- ind_dalits %>%
  mutate(Protest = as.factor(Protest)) %>%
  mutate(Protest_Type = as.factor(Protest_Type)) %>% 
  mutate(Discrimination = as.factor(Discrimination)) %>% 
  mutate(Discrim_Type = as.factor(Discrim_Type))

dfs <- list("dalits" = ind_dalits,
            "protest" = protest, 
            "aapi" = us_aapi, 
            "afam" = us_afam,
            "us_protest" = us_protest)

for (i in 1:length(dfs)) {
  dfs[[i]] <- dfs[[i]] %>% select(ID, Title, body, Protest, Protest_Type, Discrimination, Discrim_Type)
}

data <- dfs[[1]]

for (i in 2:length(dfs)) {
  data <- rbind(data, dfs[[i]])
}

data <- data %>% mutate(Protest_Type = if_else(Protest == "0", "0", Protest_Type),
                        Discrim_Type = if_else(Discrimination == "0", "0", Discrim_Type)) %>%
  filter(body != "")

export(data, here("data", "texas_coded_data.csv"))
