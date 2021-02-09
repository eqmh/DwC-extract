#### This script maps number of eDNA samples per site in the FKNMS 
#### #### from: https://www.r-graph-gallery.com/19-map-leafletr.html
#### Enrique Montes
#### February 8, 2021

# Library
library(leaflet)

rm(list=ls()) ## clear variables

setwd("~/DwC-extract")

data <- read.csv("MBON_eDNA_Sampling_Table_08FEB2021.csv", header = TRUE)

long <- data$longitude
lat <- data$latitude

# Create a color palette with handmade bins.
# for number of records
mybins <- seq(0, 130, by=25)
mypalette <- colorBin( palette="YlOrBr", domain=data$number.samples, na.color="transparent", bins=mybins)

# Prepare the text for the tooltip:
mytext <- paste(
  "Station: ", data$station, "<br/>",
  "Number of samples: ", data$number.samples, sep="") %>%
  lapply(htmltools::HTML)

# Final Map
m <- leaflet(data) %>%
  addTiles()  %>%
  setView( lat=26, lng=-82 , zoom=7) %>%
  addProviderTiles("Esri.WorldImagery") %>%
  addCircleMarkers(~long, ~lat,
                   fillColor = ~mypalette(number.samples), fillOpacity = 0.7, color="white", radius=7, stroke=FALSE,
                   label = mytext,
                   labelOptions = labelOptions( style = list("font-weight" = "normal", padding = "3px 8px"), textsize = "13px", direction = "auto")
  ) %>%
  addLegend( pal=mypalette, values=~number.samples, opacity=0.9, title = "Number of samples", position = "bottomright" )

m
