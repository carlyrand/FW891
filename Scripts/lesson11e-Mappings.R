{ 
  rm(list=ls());  options(show.error.locations = TRUE);

  # sp needs to be installed before sf package but you will still
  # get an error about sp not being installed -- this can be ignored
  library(package = "sp");       #old Simple Features (but still needed)
  library(package = "rgeos");    # getting/converting crs
  library(package = "rgdal");    # getting/converting crs
  library(package = "ggplot2");
  library(package = "dplyr");
  library(package = "sf");       # Simple Features
  library(package = "rnaturalearth");     # for getting coord data
  library(package = "rnaturalearthdata"); # for getting coord data
  
  museums = st_read(dsn="data/museum.csv");
  museums_SF = st_as_sf(museums, 
                        coords = c("lng", "lat"),
                        crs = 4326);

  lakeMichigan = st_read(dsn="data/Lake_Michigan_shoreline.kml");
  lakeMI_SF = st_as_sf(lakeMichigan); 
  
  lakes = st_read(dsn="data/lakes/ne_10m_lakes.shp");  
  lakes_SF = st_as_sf(lakes); 
  
  states = ne_states(country = "United States of America");
  states_SF = st_as_sf(states);

 
  plot1 = ggplot() +
    geom_sf(data = states_SF,
            mapping = aes(geometry = geometry, fill=region, linetype=type),
            color = "black") +
    geom_sf_text(data = states_SF,
                  mapping = aes(geometry=geometry, label=postal),
                  color="yellow") + 
    geom_sf(data = lakes_SF,
            mapping = aes(geometry = geometry, color=scalerank),
            fill = "lightblue") +
    geom_sf(data = museums_SF,
            mapping = aes(geometry = geometry, shape=Presidential.Library),      
            color = "red", 
            size = 2) +
    geom_sf(data = lakeMI_SF,
            mapping = aes(geometry = geometry),
            color = "blue",
            fill = "blue");
  
  plot2 = plot1 +
    coord_sf(crs = 4326,    
             xlim = c(-120, -70),  
             ylim = c(20, 60),
             expand = TRUE);
  plot(plot2);
  
  plot3 = plot1 +
    coord_sf(crs = 26917,   # UTM 17N
        xlim = c(-3000000, 2000000), 
        ylim = c(3000000, 7000000),
        expand = TRUE);
  plot(plot3);

  #### Application #####
  #   Customize every mapping in the plot (i.e., choose your own colors,
  #      gradients, point shapes, and line shapes)
  
  
  plot4 = ggplot() +
    geom_sf(data = states_SF,
            mapping = aes(geometry = geometry, fill=region, linetype=type),
            color = "black") +
    scale_fill_manual(values=c("green", "red", "yellow", "blue")) +
    geom_sf_text(data = states_SF,
                 mapping = aes(geometry=geometry, label=postal),
                 color="yellow") + 
    geom_sf(data = lakes_SF,
            mapping = aes(geometry = geometry, color=scalerank),
            fill = "lightblue") +
 #   scale_color_gradient(colors=c("gray", "green", "yellow", "blue"),
#                          values=c(0,2.5,5,9))+
    geom_sf(data = museums_SF,
            mapping = aes(geometry = geometry, shape=Presidential.Library),      
            color = "red", 
            size = 2) +
    scale_shape_manual(values = c(11, 12)) +
    geom_sf(data = lakeMI_SF,
            mapping = aes(geometry = geometry),
            color = "blue",
            fill = "blue") +
    coord_sf(crs = 4326,    
             xlim = c(-120, -70),  
             ylim = c(20, 60),
             expand = TRUE);
  plot(plot4)
 #for some reason the scale_color_gradient is throwing an error 
}