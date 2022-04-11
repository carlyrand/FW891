#### Application #####
#   Create a new type of shapefile from your own data file
#     - in R, create a SF from your data
#     - in R, save the SF in a different format (KML, geoJSON, SHP)
#   Open the new shapefile in R and plot it

waterloo <- st_read(dsn = "data/Wat_A_DepLocs.csv")
waterloo_SF = st_as_sf(waterloo, 
                       coords = c("Long", "Lat"),
                       crs = 4326)

if(!file.exists("shapefiles/Waterloo_RecArea.kml"))
{
  st_write(waterloo_SF, dsn = "data/Wat_A_DepLocs.kml", 
           driver = "kml")
}

waterloo_kml <- st_read(dsn = "data/Wat_A_DepLocs.kml")
plot(waterloo_kml)
