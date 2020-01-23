#### This script creates a list of unique taxa from DwC-A files: occurrence core.
#### Output: taxa list
#### Enrique Montes
#### January 21, 2020

rm(list=ls()) ## clear variables

setwd("~/DwC-extract/data")

Occurrence <- read.csv("ECUADOR-GALAPAGOS-ALL_ipt_occurrence.csv", header = TRUE)

sppList <- unique(select(Occurrence, scientificName))

write.csv(sppList, file = "~/DwC-extract/spp_lists/ECUADOR-GALAPAGOS-ALL_spp_list.csv", row.names = FALSE)

## Write the names to a text file
# writeLines(con="COLOMBIA-ISLA GORGONA_sppList.txt", sppList)
# print(sppList)

