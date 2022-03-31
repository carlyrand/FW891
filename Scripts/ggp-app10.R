# 3/24: Class participation
# AND
# Homework 10


#False northing/easting:-----------------------------------------------
# I really couldnt find a lot of info about this online.

#based on what I did find, and our use of a false easting in this assignment, 
# id guess that they function to allow up to plot objects which technically fall
# outside of the bounds of a given projection (we used a negative easting to 
# plot objects that fell outside of the western boundary of zone 17N).

#setup----------------------------------------------------------------
rm(list=ls());  options(show.error.locations = TRUE);

# sp needs to be installed before sf package but you will still
# get an error about sp not being installed -- this can be ignored
library(package = "sp");       # old Simple Features (but still needed)
library(package = "rgeos");    # getting/converting crs
library(package = "rgdal");    # getting/converting crs
library(package = "ggplot2");
library(package = "sf");       # Simple Features
library(package = "rnaturalearth");     # for getting coord data
library(package = "rnaturalearthdata"); # for getting coord data

#Group One Assignment: ------------------------------------------------

#read in data

cities = st_read(dsn="data/CityCords.csv")
## When you convert a CSV to a simple feature, you need to
#   supply the longitude and latitude columns (in that order)
cities_SF1 = st_as_sf(cities, coords = c("Longitude", "Latitude"), crs = 26914)
# 

museums = st_read(dsn="data/museum.csv");
## When you convert a CSV to a simple feature, you need to
#   supply the longitude and latitude columns (in that order)
museums_SF2 = st_as_sf(museums, 
                       coords = c("lng", "lat"),
                       crs = 4326);  # it's a guess since no crs info was given

lakeMichigan = st_read(dsn="data/Lake_Michigan_shoreline.kml");
# KML files have the lat, long, and crs built in  -- you (usually) do not need to declare it
lakeMI_SF = st_as_sf(lakeMichigan)

lakes = st_read(dsn="data/lakes/ne_10m_lakes.shp");  
lakes_SF = st_as_sf(lakes); 

### Getting data from a database (in this case, from naturalearth.com)
#    The database sends a data file -- which types depends on the database
# get the state borders from naturalearth
states = ne_states(country = "United States of America");
states_SF = st_as_sf(states)



#Group Two assignment-----------------------------------------------


canada = ne_states(country = "Canada");
canada_SF = st_as_sf(canada)

lakeErie = st_read(dsn="data/Lake_Erie_Shoreline.kml");
lakeER_SF = st_as_sf(lakeErie)


plot1 = ggplot() +
  geom_sf(data = states_SF,
          mapping = aes(geometry = geometry),
          color = "black",
          fill = "lightgrey") +
  geom_sf(data = canada_SF,
          mapping = aes(geometry = geometry),
          color = "black",
          fill = "grey") +
  geom_sf(data = lakes_SF,
          mapping = aes(geometry = geometry),
          color = "lightblue",
          fill = "lightblue") +
  geom_sf(data = lakeMI_SF,
          mapping = aes(geometry = geometry),
          color = "blue",
          fill = "blue") +
  geom_sf(data = lakeER_SF,
          mapping = aes(geometry = geometry),
          color = "blue",
          fill = "darkblue") +
  geom_sf(data = cities_SF1,
          mapping = aes(geometry = geometry),      
          color = "red", 
          fill = "red") +
  geom_sf_label(data = cities_SF1,
                mapping = aes(geometry=geometry, label=cities$Abrev),
                color="purple",
                fill = "yellow",
                nudge_x = 10) +
  coord_sf(crs = 26917,   # UTM 17N
           xlim = c(-770000, 1100000),  # note the negative number (false easting)
           ylim = c(4500000, 5600000),
          expand = TRUE);
plot(plot1)

#for some reason, I cant get my cities to show up on the map
#above, even though they plot below. Cant get labels to work either. 
plot(cities_SF1)

# My map: ------------------------------------------------------------------

WaterlooSRA <- st_read(dsn = 'data/Waterloo_RecArea.shp')
WaterlooSRA <- st_as_sf(WaterlooSRA)

plot2 = ggplot() +
  geom_sf(data = states_SF,
          mapping = aes(geometry = geometry),
          color = "black",
          fill = "lightgrey") +
  geom_sf(data = WaterlooSRA,
          mapping = aes(geometry = geometry),
          color = "black",
          fill = "brown") +
  coord_sf(crs = 26917,   # UTM 17N
           xlim = c(5000, 400000),  # note the negative number (false easting)
           ylim = c(4600000, 5100000),
           expand = TRUE)
plot(plot2)  

#Questions:--------------------------------------------------------------
#   •	What was your level of comfort with the lesson/application? 
# I have made maps in R vefore, so I felt somewaht comfortable, but the errors/issues
# i ran into were frusterating. 
#   •	Approximately how long did you work on this lesson?
# Four Hours :(
#   •	What areas of the lesson/application confused or still confuses you?
# I am not sure why I got the above errors
#   •	What are some things you would like to know more about that is related to, 
#     but not covered in, this lesson?
# Can you mix mapping panels with ggplot graphs in a single figure?


  

  







