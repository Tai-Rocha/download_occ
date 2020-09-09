
#
# Amazon munici shapefile downloaded from  http://terrabrasilis.dpi.inpe.br/downloads/

# Library
library(rgdal)
library(rocc)
library(tools)


# 1. loading shapefile w/ municipalities of the Amazon ####
amazon_muni <- readOGR("./data/municipalities_legal_amazon/municipalities_legal_amazon.shp", encoding = "UTF-8")

amazon_muni$uf

##
nomes_muni <- data.frame(muni = toTitleCase(as.character(amazon_muni$nm_municip)),
                         uf = toTitleCase(as.character(amazon_muni$uf)))

# converting again to character :P
nomes_muni$muni <- as.character(nomes_muni$muni)
nomes_muni$uf <- as.character(nomes_muni$uf)

# creating names to print in files' name
## removing ' from Pingo D'Agua
nomes_muni$muni <- gsub("'", " ", nomes_muni$muni)

## creating vector for filename
nomes_muni$muni2 <- gsub("'", "_", nomes_muni$muni)

# 2. using rspeciesLink function ####
sp_muni <- list()

for (i in 1:nrow(nomes_muni)) {
  sp_muni[[i]] <- rspeciesLink(dir = "./results/raw_speciesLink/",
                               filename = paste(nomes_muni$muni2[i],
                                                nomes_muni$uf[i],
                                                sep = "_"),
                               save = TRUE,
                               basisOfRecord = "PreservedSpecimen",
                               #species =,
                               collectionCode = NULL,
                               country = NULL,
                               stateProvince = nomes_muni$uf[i],
                               county = nomes_muni$muni[i],
                               Coordinates = NULL,
                               CoordinatesQuality = NULL,
                               Scope = "plants",
                               Synonyms = "flora2020",
                               Typus = FALSE,
                               Images = NULL,
                               RedList = TRUE,
                               MaxRecords = NULL)
}

# alguns vazios e vem indet

