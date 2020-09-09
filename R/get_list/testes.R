##########################################
## Get records from Species Link
## Author: Tainá Rocha
##########################################

# Read de species list
list_sps_teste <- read.csv("./results/sp_list/amazon_list_brflora2020.csv")

## Names
spnames <- as.character(unique(list_sps_teste$scientificName))

#Get records

get_records <-  rspeciesLink(
  dir = "./results/spp_records/ ",
  filename = "speciesLink_amazon_records",
  save = TRUE,
  basisOfRecord = "PreservedSpecimen",
  species = spnames,
  collectionCode = NULL,
  country = NULL,
  stateProvince = NULL,
  county = NULL,
  Coordinates = NULL,
  CoordinatesQuality = NULL,
  Scope = "plants",
  Synonyms = "flora2020",
  Typus = FALSE,
  Images = NULL,
  RedList = TRUE,
  MaxRecords = NULL
)


#### Other vector tranformation in
sp_0 <- paste(list_sps_teste$names_wo_author,sep="")

vector_sps <- as.vector(sp_0)

sp <- apply(list_sps_teste$names_wo_author, 1, paste, collapse="")

sp_2 <- paste(letters, numbers, squigs, blargs, sep)



