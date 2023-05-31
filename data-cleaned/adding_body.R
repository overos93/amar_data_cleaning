

Australia_Aboriginal_2020_raw$body<- as.character(Australia_Aboriginal_2020_raw$body)


Australia_Aboriginal_2020_raw$ID <- rownames(Australia_Aboriginal_2020_raw)

library(tidyverse)
library(dplyr)

#Australia aboriginal
Australia_Aboriginal_2020 <- Australia_Aboriginal_2020_raw %>%
    select(ID, body)
Australia_Aboriginal_2020$ID <- as.numeric(Australia_Aboriginal_2020$ID)

australia_coded <- read.csv("UTA_aboriginal_aus_2020_cleaned.csv")
getwd()

for_body <- australia_coded%>%
    left_join(Australia_Aboriginal_2020, by="ID")

for_body$body <- for_body$body.y

australia_aborigin_final <- for_body %>%
    select(ID, URL, Title, body, Country, Group, Protest, Protest_Typ, Discrim, Discrim_Type)

write.csv(australia_aborigin_final, file = "UTA_aboriginal_aus_2020_cleaned_final.csv")

#UTA_dalits

dalits_coded <- read.csv("UTA_dalits_ind_2020_cleaned.csv")
dalits_body <- dalits_india%>%
    select(body)
dalits_body$ID <- rownames(dalits_body)
dalits_body$ID <- as.numeric(dalits_body$ID)

dalits_coded_final <- dalits_coded %>%
    left_join(dalits_body, by="ID")
dalits_coded_final$body <- dalits_coded_final$body.y
dalits_coded_final$body <- as.character(dalits_coded_final$body)
dalits_coded_final <- dalits_coded_final %>%
    select(ID, URL, Title, body, Country, Group, Protest, Protest_Type, Discrim, Discrim_Type)

write.csv(dalits_coded_final, file = "UTA_dalits_ind_2020_cleaned_final.csv")

#UTA Arabs great britain
arabs_gbr_coded <- read.csv("UTA_arabs_gbr_2020_cleaned.csv")
arab_raw <- UK_arab_2020_raw%>%
    select(body)
arab_raw$ID <- as.numeric(rownames(arab_raw))

arabs_gbr_coded_final <- arabs_gbr_coded %>%
    left_join(arab_raw, by="ID")
arabs_gbr_coded_final$body <- as.character(arabs_gbr_coded_final$body.y)
arabs_gbr_coded_final <- arabs_gbr_coded_final %>%
    select(ID, URL, Title, body, Country, Group, Protest, Protest_Typ, Discrim, Discrim_Type)%>%
    rename("Protest_Type" = "Protest_Typ")

write.csv(arabs_gbr_coded_final, file = "UTA_arabs_gbr_2020_cleaned_final.csv")


#UTA Asians Canada

asian_can_coded <- read.csv("UTA_asians_can_2020_clean.csv")







