#### This script creates a list of unique taxa from DwC-A files: occurrence core.
#### Output: taxa list
#### Enrique Montes
#### January 21, 2020

library(tidyverse)

rm(list=ls()) ## clear variables

setwd("~/DwC-extract/data")

Occurrence <- read.csv("COLOMBIA-ISLA GORGONA_ipt_occurrence.csv", header = TRUE)

sppList <- unique(select(Occurrence, scientificName))


## Write the names to a text file
# writeLines(con="COLOMBIA-ISLA GORGONA_sppList.txt", sppList)
# print(sppList)

