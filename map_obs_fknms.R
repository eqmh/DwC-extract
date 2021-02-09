#### This script maps number of records per locality and site 
#### #### from: https://www.r-graph-gallery.com/19-map-leafletr.html
#### Enrique Montes
#### October 22, 2019

# Library
library(leaflet)

rm(list=ls()) ## clear variables

setwd("~/DwC-extract/data")


### DATA
data <- read.csv("fknms_stations_list.csv", header = TRUE)
# data <- read.csv("ReceiverUTMkeys.csv", header = TRUE)


### USE THIS FOR "stations_list.csv"
sancsound <- subset.data.frame(data[data$Program == "SanctSound", ])
mbon <- subset.data.frame(data[data$Program == "SFP-MBON", ])
GOMECC_3 <- subset.data.frame(data[data$Program == "GOMECC-3", ])
Iconic_Reefs <- subset.data.frame(data[data$Program == "Iconic Reefs", ])
Cheeca_Rocks <- subset.data.frame(data[data$Program == "AOAT", ])
fwc <- subset.data.frame(data[data$Program == "FWC", ])
um <- subset.data.frame(data[data$Program == "UM", ])

long1 <- Iconic_Reefs$Long
lat1 <- Iconic_Reefs$Lat

long2 <- sancsound$Long
lat2 <- sancsound$Lat

long3 <- mbon$Long
lat3 <- mbon$Lat

long4 <- GOMECC_3$Long
lat4 <- GOMECC_3$Lat

long5 <- Cheeca_Rocks$Long
lat5 <- Cheeca_Rocks$Lat

long6 <- fwc$Long
lat6 <- fwc$Lat

long7 <- um$Long
lat7 <- um$Lat

# # Prepare the text for the tooltip:
mytext1 <- paste(
  "Program: ", Iconic_Reefs$Program, "<br/>",
  "Site: ", Iconic_Reefs$Site_ID, sep="") %>%
  lapply(htmltools::HTML)

mytext2 <- paste(
  "Program: ", sancsound$Program, "<br/>",
  "Site: ", sancsound$Site_ID, sep="") %>%
  lapply(htmltools::HTML)

mytext3 <- paste(
  "Program: ", mbon$Program, "<br/>",
  "Site: ", mbon$Site_ID, sep="") %>%
  lapply(htmltools::HTML)

mytext4 <- paste(
  "Program: ", GOMECC_3$Program, "<br/>",
  "Site: ", GOMECC_3$Site_ID, sep="") %>%
  lapply(htmltools::HTML)

mytext5 <- paste(
  "Program: ", Cheeca_Rocks$Program, "<br/>",
  "Site: ", Cheeca_Rocks$Site_ID, sep="") %>%
  lapply(htmltools::HTML)

mytext6 <- paste(
  "Program: ", fwc$Program, "<br/>",
  "Site: ", fwc$Site_ID, sep="") %>%
  lapply(htmltools::HTML)

mytext7 <- paste(
  "Program: ", um$Program, "<br/>",
  "Site: ", um$Site_ID, sep="") %>%
  lapply(htmltools::HTML)

# Create a maps factor
m <- leaflet(data) %>% addTiles() %>%
  setView( lat=25, lng=-81 , zoom=8) %>%
  addProviderTiles("Esri.WorldImagery") %>%
  addCircleMarkers(
    lat=lat1, lng=long1,
    color= "red", radius=10, fillOpacity = 1, label = mytext1,
    labelOptions = labelOptions( style = list("font-weight" = "normal", padding = "3px 8px"), textsize = "13px", direction = "auto")
  ) %>%
  addCircleMarkers(
    lat=lat2, lng=long2,
    color= "white", radius=7, fillOpacity = 0.7, label = mytext2,
    labelOptions = labelOptions( style = list("font-weight" = "normal", padding = "3px 8px"), textsize = "13px", direction = "auto")
  )  %>%
  addCircleMarkers(
    lat=lat3, lng=long3,
    color= "orange", radius=4, fillOpacity = 1, label = mytext3,
    labelOptions = labelOptions( style = list("font-weight" = "normal", padding = "3px 8px"), textsize = "13px", direction = "auto")
  ) %>%
  addCircleMarkers(
    lat=lat4, lng=long4,
    color= "violet", radius=3, fillOpacity = 0, label = mytext4,
    labelOptions = labelOptions( style = list("font-weight" = "normal", padding = "3px 8px"), textsize = "13px", direction = "auto")
  ) %>%
  addCircleMarkers(
    lat=lat5, lng=long5,
    color= "green", radius=5, fillOpacity = 1, label = mytext5,
    labelOptions = labelOptions( style = list("font-weight" = "normal", padding = "3px 8px"), textsize = "13px", direction = "auto")
  ) %>%
  addCircleMarkers(
    lat=lat6, lng=long6,
    color= "white", radius=7, fillOpacity = 1, label = mytext6,
    labelOptions = labelOptions( style = list("font-weight" = "normal", padding = "3px 8px"), textsize = "13px", direction = "auto")
  ) %>%
  addCircleMarkers(
    lat=lat7, lng=long7,
    color= "white", radius=7, fillOpacity = 1, label = mytext7,
    labelOptions = labelOptions( style = list("font-weight" = "normal", padding = "3px 8px"), textsize = "13px", direction = "auto")
)    
m


#####################################################################################################################

# ### USE THIS FOR "ReceiverUTMkeys.csv"
# 
# # # Create a color palette with handmade bins.
# # # for number of records
# mybins <- seq(10, 160, by=20)
# mypalette <- colorBin( palette="YlOrBr", domain=data$depth, na.color="transparent", bins=mybins)
# 
# # # # Prepare the text for the tooltip:
# mytext <- paste(
#   "Station: ", data$station, "<br/>",
#   "Depth ", data$depth, sep="") %>%
#   lapply(htmltools::HTML)
# 
# # Final Map
# m <- leaflet(data) %>%
#   addTiles()  %>%
#   setView( lat=25, lng=-82 , zoom=8) %>%
#   addProviderTiles("Esri.WorldImagery") %>%
#   addCircleMarkers(~long, ~lat,
#                    fillColor = ~mypalette(depth), fillOpacity = 0.7, color="white", radius=12, stroke=FALSE,
#                    label = mytext,
#                    labelOptions = labelOptions( style = list("font-weight" = "normal", padding = "3px 8px"), textsize = "13px", direction = "auto")
#   ) %>%
#   addLegend( pal=mypalette, values=~depth, opacity=0.9, title = "Depth", position = "bottomright" )
# 
# m
# 
# 
# ## Generates a bubble plot on a map showing species richness and number of records per locality.
# library(ggplot2)
# library(maps)
# library(ggthemes)
# theme_set(theme_bw())
# library(sf)
# 
# americas <- ggplot() +
#   borders("world", colour = "gray85", fill = "gray80", xlim = c(-140, -20), ylim = c(-70, 70)) +
#   geom_sf() +
#   coord_sf(xlim = c(-140, -20), ylim = c(-70, 70), expand = F) +
#   labs(x = "Longitude", y = "Latitude")
#   coord_quickmap() +
#   theme_map()
# 
# 
# (ssp_map <- americas +
#   geom_point(aes(x = long, y = lat, size = total.spp),
#              data = data,
#              colour = 'purple', alpha = .3) +
#   scale_size_continuous(range = c(1, 12),
#                         breaks = c(10, 20, 30, 40, 50)) +
#   labs(size = 'Number of species'))
# 
# 
# (records_map <- americas +
#   geom_point(aes(x = long, y = lat, size = total.records),
#              data = data,
#              colour = 'blue', alpha = .3) +
#   scale_size_continuous(range = c(1, 12),
#                         breaks = c(20, 50, 100, 150, 200)) +
#   labs(size = 'Number of records'))
# 
#   ## Plot species richness (observed and extrapolated maximum versus latitude
# 
#   extrapol <- read.csv("spp_rich_lat.csv", header = TRUE)
#   lat2 <- extrapol$latitude
#   qD <- extrapol$qD_max
#   obs <- extrapol$obs_max
#   df <- data.frame(lat2, qD, obs)
# 
#   ## exclude a site
#   extrapol2 <- extrapol[-c(4,10),]
#   lat3 <- extrapol2$latitude
#   qD2 <- extrapol2$qD_max
#   obs2 <- extrapol2$obs_max
#   df2 <- data.frame(lat3, qD2, obs2)
# 
#   (spp_lat <- ggplot(data = extrapol, aes(x = lat2)) +
#       geom_line(aes(y = qD, colour = "Extrapolated"), size = 2) +
#       geom_line(aes(y = obs, colour = "Observed average"), size = 2) +
#       geom_point(data = data, aes(x = lat, y = total.spp), color="black", size=2) +
#       geom_line(data = extrapol2, aes(x = lat3, y = qD2, colour = "Extrapolated"), size = 2, linetype = 3) +
#       geom_line(data = extrapol2, aes(x = lat3, y = obs2, colour = "Observed average"), size = 2, linetype = 3) +
#     labs(x = 'Latitude', y = 'Species richness') +
#     theme_bw(base_size=16) +
#       scale_y_continuous(breaks=seq(0, 60, 10)) +
#       scale_x_continuous(breaks=seq(-70, 60, 10)))



  



