#### This script extracts information from DwC-A zipped files.
#### Outputs: number of species at high, mid and low tide; number of quadrats per stratum
#### Enrique Montes
#### October 22, 2019

# Library
library(finch)

setwd("G:/My Drive/MBON/GLOBAL_MBON/P2P/P2P_Project/papers/manuscripts/network_sampling_optimization")

archive <- finch::dwca_read("dwca-brazil_reef_biodiversity_ilter_coastal_habitats_es-v1.2.zip", read = TRUE)
event <- archive$data$event.txt
occurrence <- archive$data$occurrence.txt
mof <- archive$data$extendedmeasurementorfact.txt