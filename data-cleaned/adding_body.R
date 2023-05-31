

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
asians_can_raw <- asians_can_2020_raw%>%
    select(body)
asians_can_raw$ID <- as.numeric(rownames(asians_can_raw))

asian_can_coded_final <- asian_can_coded %>%
    left_join(asians_can_raw, by="ID")
asian_can_coded_final$body <- as.character(asian_can_coded_final$body.y)
asian_can_coded_final <- asian_can_coded_final %>%
    select(ID, URL, Title, body, Country, Group, Protest, Protest_Type, Discrim, Discrim_Type)
write.csv(asian_can_coded_final, file = "UTA_asians_can_2020_cleaned_final.csv")

#UTA Blacks Canada

blacks_can_coded <- read.csv("UTA_blacks_can_2020_cleaned.csv")

#UTA Blacks GBR
library(dplyr)
library(tidyverse)
blacks_gbr_coded <- read.csv("UTA_blacks_gbr_2020_cleaned.csv")
black_raw <- UK_black_2020_raw%>%
    select(body)
black_raw$ID <- as.numeric(rownames(black_raw))

blacks_gbr_coded_final <- blacks_gbr_coded %>%
    left_join(black_raw, by="ID")
blacks_gbr_coded_final$body <- as.character(blacks_gbr_coded_final$body.y)
blacks_gbr_coded_final <- blacks_gbr_coded_final %>%
    select(ID, URL, Title, body, Country, Group, Protest, Protest_Typ, Discrim, Discrim_Type)%>%
    rename("Protest_Type" = "Protest_Typ")


write.csv(blacks_gbr_coded_final, file = "UTA_blacks_gbr_2020_cleaned_final.csv")

#UTA Chinese AUS
chinese_aus_coded <- read.csv("UTA_chinese_aus_2020_cleaned.csv")
chinese_raw <- Australia_Chinese_2020_raw%>%
    select(body)
chinese_raw$ID <- as.numeric(rownames(chinese_raw))

chinese_aus_coded_final <- chinese_aus_coded %>%
    left_join(chinese_raw, by="ID")
chinese_aus_coded_final$body <- as.character(chinese_aus_coded_final$body.y)
chinese_aus_coded_final <- chinese_aus_coded_final %>%
    select(ID, URL, Title, body, Country, Group, Protest, Protest_Typ, Discrim, Discrim_Type)%>%
    rename("Protest_Type" = "Protest_Typ")


write.csv(chinese_aus_coded_final, file = "UTA_chinese_aus_2020_cleaned_final.csv")

#UTA czech czech
czech_cze_coded <- read.csv("UTA_czechs_cze_2020_cleaned.csv")
czech_raw <- czech_2020%>%
    select(body)
czech_raw$ID <- as.numeric(rownames(czech_raw))

czech_cze_coded_final <- czech_cze_coded %>%
    left_join(czech_raw, by="ID")
czech_cze_coded_final$body <- as.character(czech_cze_coded_final$body.y)
czech_cze_coded_final <- czech_cze_coded_final %>%
    select(ID, URL, Title, body, Country, Group, Protest, Protest_Type, Discrim, Discrim_Type)

##UTA filipino


filipino_aus_coded <- read.csv("UTA_filipino_aus_2020_cleaned.csv")
filipino_raw <- Australia_Filipino_2020_raw%>%
    select(body)
filipino_raw$ID <- as.numeric(rownames(filipino_raw))

filipino_aus_coded_final <- filipino_aus_coded %>%
    left_join(filipino_raw, by="ID")
filipino_aus_coded_final$body <- as.character(filipino_aus_coded_final$body.y)
filipino_aus_coded_final <- filipino_aus_coded_final %>%
    select(ID, URL, Title, body, Country, Group, Protest, Protest_Typ, Discrim, Discrim_Type)%>%
    rename("Protest_Type" = "Protest_Typ")


write.csv(filipino_aus_coded_final, file = "UTA_filipino_aus_2020_cleaned_final.csv")

#UTA aus vietnamese

vietnamese_aus_coded <- read.csv("UTA_vietnamese_aus_2020_cleaned.csv")
vietnamese_raw <- Australia_Vietnamese_2020_raw%>%
    select(body)
vietnamese_raw$ID <- as.numeric(rownames(vietnamese_raw))

vietnamese_aus_coded_final <- vietnamese_aus_coded %>%
    left_join(vietnamese_raw, by="ID")
vietnamese_aus_coded_final$body <- as.character(vietnamese_aus_coded_final$body.y)
vietnamese_aus_coded_final <- vietnamese_aus_coded_final %>%
    select(ID, URL, Title, body, Country, Group, Protest, Protest_Typ, Discrim, Discrim_Type)%>%
    rename("Protest_Type" = "Protest_Typ")


write.csv(vietnamese_aus_coded_final, file = "UTA_vietnamese_aus_2020_cleaned_final.csv")

#UTA can quebecois

quebecois_can_coded <- read.csv("UTA_quebecois_can_2020_cleaned.csv")
quebecois_raw <- Australia_Vietnamese_2020_raw%>%
    select(body)
vietnamese_raw$ID <- as.numeric(rownames(vietnamese_raw))

vietnamese_aus_coded_final <- vietnamese_aus_coded %>%
    left_join(vietnamese_raw, by="ID")
vietnamese_aus_coded_final$body <- as.character(vietnamese_aus_coded_final$body.y)
vietnamese_aus_coded_final <- vietnamese_aus_coded_final %>%
    select(ID, URL, Title, body, Country, Group, Protest, Protest_Typ, Discrim, Discrim_Type)%>%
    rename("Protest_Type" = "Protest_Typ")


#UTA Bulgarians Bulgaria
bulgarians_bul_coded <- read.csv("UTA_bulgarians_bul_2020_cleaned.csv")
bulgarians_raw <- bulg_2020%>%
    select(body)
bulgarians_raw$ID <- as.numeric(rownames(bulgarians_raw))

bulgarians_bul_coded_final <- bulgarians_bul_coded %>%
    left_join(bulgarians_raw, by="ID")
bulgarians_bul_coded_final$body <- as.character(bulgarians_bul_coded_final$body.y)
bulgarians_bul_coded_final <- bulgarians_bul_coded_final %>%
    select(ID, URL, Title, body, Country, Group, Protest, Protest_Typ, Discrim, Discrim_Type)%>%
    rename("Protest_Type" = "Protest_Typ")










