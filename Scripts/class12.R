{ 
  rm(list=ls());  options(show.error.locations = TRUE);

  #### Alternative way to install a package: only need to do once per computer
  #    devtools::install_github("ropensci/rnaturalearthhires");
  
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
  
  # The simple features (SF) museums is the museums data frame 
  # with these differences: 
  #   - SF has meta data (bounding box, CRS, geometry) 
  #   - SF combines the coordinates from the data frame into geometry
  # Otherwise, they are the same (i.e., the columns in the data frames are the same)
  museums_SF1 = st_as_sf(museums, 
                         coords = c("lng", "lat"),
                         crs = 4326);
  
  # Change the crs before plotting 
  museums_SF2 = st_transform(museums_SF1, crs = 3593);

  # Look at metadata for the CRS
  print(museums_SF1);
  print(museums_SF2);
  
  #### Finding meta data for large shapefiles is hard so...
  # Look at the bounding boxes for both of the simple features:
  boundBox1 = st_bbox(museums_SF1);
  boundBox2 = st_bbox(museums_SF2);
  
  # Look at the CRS for both SF
  crs1 = st_crs(museums_SF1);
  crs2 = st_crs(museums_SF2);
  
  # Look at the geometry for both SF
  geometery1 = st_geometry(museums_SF1);
  geometery2 = st_geometry(museums_SF2);
  
  
  #### Application #####
  #   Add three new points to the data frame 
  #   - use only one SF
  #   - make each point a different color, size, and shape
  #   - make sure the bounding box does not change because of the new points

  plot5 = ggplot() +
    geom_sf(data = museums_SF2,
            mapping = aes(geometry = geometry),
            color = "red") +
    annotate(geom="point",    # adding two text annotations
             x = c(10000000, 11000000,12000000), # 2 northings
             y = c(-1000000, -1500000,-1500000), # 2 eastings
             color = "blue", # both get same color +
             geom_sf(data = myDF_SF,
                          mapping=aes(geometry=geometry),
                          color = "blue")
    );
  plot(plot5);
  
  ## Create a data frame with the text and the coordinates
  myDF = data.frame(label = c("a", "b", "c")
                    long = c(36, 32, 40),
                    lat = c(95, 90, 85));
  
  ## Convert the data frame to an SF and include the CRS
  myDF_SF = st_as_sf(myDF,
                       coords = c("lat", "long"),  # yes, this is opposite of lon,lat
                       crs = 3593); # this number is the original CRS
  #create plot
  plot5 = ggplot() +
    geom_sf(data = museums_SF2,
            mapping = aes(geometry = geometry),
            color = "red") +
    geom_sf(data = myDF_SF,
            mapping=aes(geometry=geometry),
            color = "blue") +
    geom_sf_label(data = myDF_SF,
                  mapping = aes(geometry=geometry, label=substr(myDF,1,2)),
                  color="purple",
                  fill = "yellow",
                  nudge_x = 10) + 
    coord_sf(crs = 26917) 
  
  plot(plot5)

  
  #App two: save a shapefile as kml
  
  #App three:
  # the data frame museums
  museums = st_read(dsn="data/museum.csv");
  museums_SF = st_as_sf(museums, 
                        coords = c("lng", "lat"),
                        crs = 4326);
  
  # Lake MI is a KML file downloaded for the MI arcgis website
  lakeMichigan = st_read(dsn="data/Lake_Michigan_shoreline.kml");
  lakeMI_SF = st_as_sf(lakeMichigan); 
  
  # Lakes are a shapefile downloaded from the natural earth website
  lakes = st_read(dsn="data/lakes/ne_10m_lakes.shp");  
  lakes_SF = st_as_sf(lakes); 
  
  # You can also use the rnaturalearth package to get spatial files
  states = ne_states(country = "United States of America");
  states_SF = st_as_sf(states);
  
  #### Note: last component with a CRS determines the CRS for the whole plot ####
  
  # Remember that later component layer on top of earlier components
  plot1 = ggplot() +
    geom_sf(data = states_SF,
            mapping = aes(geometry = geometry),
            color = "black",
            fill = "grey") +
    geom_sf(data = lakes_SF,
            mapping = aes(geometry = geometry),
            color = "lightblue",
            fill = "lightblue") +
    geom_sf_label(data = museums_SF,
                  mapping = aes(geometry=geometry, label=substr(museum,
                                                                start=1,
                                                                stop=3)),
                  color="purple",
                  fill = "yellow") + 
    ### Note: Lake MI will cover up the labels...
    geom_sf(data = lakeMI_SF,
            mapping = aes(geometry = geometry),
            color = "blue",
            fill = "blue");
  
  plot2 = plot1 +
    # 4326 will default to Mercator projection...
    coord_sf(crs = 4326,    
             xlim = c(-120, -70),  # in degrees...
             ylim = c(20, 60),
             expand = TRUE);
  plot(plot2);  
  
  ### Often need to click Zoom button in Plot window to see full map
  plot3 = plot1 +
    coord_sf(crs = 26917,   # UTM 17N
             xlim = c(-3000000, 2000000),  
             ylim = c(3000000, 7000000),
             expand = TRUE);
  plot(plot3); 
  
  #### Nudging text -- and how it relates to CRS ####
  # Same plot as above with nudged text
  # Remember that later component layer on top of earlier components
  plot1b = ggplot() +
    geom_sf(data = states_SF,
            mapping = aes(geometry = geometry),
            color = "black",
            fill = "grey") +
    geom_sf(data = lakes_SF,
            mapping = aes(geometry = geometry),
            color = "lightblue",
            fill = "lightblue") +
    geom_sf_label(data = museums_SF,
                  mapping = aes(geometry=geometry, label=substr(museum,
                                                                start=1,
                                                                stop=3)),
                  color="purple",
                  fill = "yellow",
                  nudge_x = -5,     # nudge the label by -5 units in x dir
                  mudge_y = 5) +    # nudge the label by 5 units in y dir
    geom_sf(data = lakeMI_SF,
            mapping = aes(geometry = geometry),
            color = "blue",
            fill = "blue");
  
  plot2b = plot1b +
    coord_sf(crs = 4326,    
             xlim = c(-120, -70),  
             ylim = c(20, 60),
             expand = TRUE);
  plot(plot2b);     # nudging seems to work for this plot
  
  plot3b = plot1b +
    coord_sf(crs = 26917,  
             xlim = c(-3000000, 2000000),  
             ylim = c(3000000, 7000000),
             expand = TRUE);
  plot(plot3b);
  
  #### Application #####
  #   Add a color mapping that distinguishes presidential library from 
  #     non-presidential libraries (it's a column in the data frame...)
  #   Change the default mapped colors using style_* component 
  
  
  plot4 = plot3b +
    scale_color_manual(values=c("Summer" = "red",
                                "Spring" = "green", 
                                "Fall" = "yellow", 
                                "Winter" = "blue")
    
    
  
  