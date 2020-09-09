######################################################################################
## Get a species list from List of Species of the Brazilian Flora 2020 database
## Author : Tainá Rocha
######################################################################################

# Library
library(rocc)

# Get a list using search_flora funtion

list_sps_teste <- search_flora(
  domain = "Amazônia",
  stateProvince = NULL,
  endemism = NULL,
  lifeform = NULL,
  habitat = NULL,
  force_update = FALSE
)

# Write a list

write.csv(list_sps_teste, "./results/sp_list/amazon_list_brflora2020.csv", sep = ",")
