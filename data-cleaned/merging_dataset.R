

###Merging all the cleaned documents

library(tidyverse)
library(dplyr)

us_protest <- read.csv("protest_articles_test_cleaned.csv")
bulgarians <- read.csv("bulgarians_bulgaria_2020_coded_final.csv")
bulgarians <- bulgarians %>%
    select("ID", "URL", "Title", "body", "Country", "Group", "Protest", "Protest_Typ", "Discrim", "Discrim_Type") %>%
    rename("Protest_Type"="Protest_Typ")
vietnamese_aus <- read.csv("UTA_vietnamese_aus_2020_cleaned_final.csv")
vietnamese_aus <- vietnamese_aus %>%
    select("ID", "URL", "Title", "body", "Country", "Group", "Protest", "Protest_Type", "Discrim", "Discrim_Type")
  
filipino_aus <- read.csv("UTA_filipino_aus_2020_cleaned_final.csv")
filipino_aus <- filipino_aus %>%
    select("ID", "URL", "Title", "body", "Country", "Group", "Protest", "Protest_Type", "Discrim", "Discrim_Type")
dalits_india <- read.csv("UTA_dalits_ind_2020_cleaned_final.csv")
dalits_india <- dalits_india %>%
    select("ID", "URL", "Title", "body", "Country", "Group", "Protest", "Protest_Type", "Discrim", "Discrim_Type")

chinese_aus <- read.csv("UTA_chinese_aus_2020_cleaned_final.csv")
chinese_aus <- chinese_aus %>%
    select("ID", "URL", "Title", "body", "Country", "Group", "Protest", "Protest_Type", "Discrim", "Discrim_Type")

blacks_gbr <- read.csv("UTA_blacks_gbr_2020_cleaned_final.csv")
blacks_gbr <- blacks_gbr %>%
    select("ID", "URL", "Title", "body", "Country", "Group", "Protest", "Protest_Type", "Discrim", "Discrim_Type")

asians_can <- read.csv("UTA_asians_can_2020_cleaned_final.csv")
asians_can <- asians_can %>%
    select("ID", "URL", "Title", "body", "Country", "Group", "Protest", "Protest_Type", "Discrim", "Discrim_Type")
    
arabs_gbr <- read.csv("UTA_arabs_gbr_2020_cleaned_final.csv")
arabs_gbr <- arabs_gbr %>%
    select("ID", "URL", "Title", "body", "Country", "Group", "Protest", "Protest_Type", "Discrim", "Discrim_Type")

aborigin_aus <- read.csv("UTA_aboriginal_aus_2020_cleaned_final.csv")    
aborigin_aus <- aborigin_aus %>%
    select("ID", "URL", "Title", "body", "Country", "Group", "Protest", "Protest_Type", "Discrim", "Discrim_Type")
    
us_protest <- us_protest %>%
    rename("Discrim"="Discrimination")
merged_master_dataset <- rbind.data.frame(us_protest, dalits_india, bulgarians, arabs_gbr, blacks_gbr, aborigin_aus, vietnamese_aus, filipino_aus, chinese_aus, asians_can)
save(merged_master_dataset, file = "merged_dataset_coded.RData")

