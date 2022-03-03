# FW891  February 22 2022
### Week 6 Homework
### Carly Andrews 


#setup---------------------------------------------------------------------
rm(list=ls());                         # clear Environment tab
options(show.error.locations = TRUE);  # show line numbers on error
library(package=ggplot2);              # get the GGPlot package

# read in CSV file and save the content to weatherData
weatherData = read.csv(file="data/Lansing2016NOAA.csv", 
                       stringsAsFactors = FALSE);  # for people still using R v3

#### Part A: How to include data from a data frame ##### -------------------

## 1st way: data in ggplot (what I have used throughout class)
##  good: most intuitive (to me), works well with facets
##  bad: Can be problematic with manual additions or with multiple data frames


Ordered_windDir = factor(weatherData$windDir,
                        levels=c("North", "East", "South", "West"))
vec_x <- c(2,2,2)
vec_y<- c(-23,20,25)
vec_size <- c(4,3,3)
vec_fill <- c("green","blue","red")


plot1A = ggplot(data=weatherData) +
  geom_boxplot(mapping=aes(x=Ordered_windDir, y=changeMaxTemp),
               na.rm = TRUE) +
  theme_minimal() +
  labs(title = "Change in Temperature vs. Wind Direction",
       subtitle = "Lansing, Michigan: 2016",
       x = "Wind Direction",
       y = "Change in Temperature (\u00B0F)") +
  annotate(geom= "point",
           x = vec_x,
           y = vec_y,
           size = vec_size,
           color = "black",
           fill = vec_fill,
           shape = c(21,22,23)) +
  annotate(geom= "text",                #add text lables
           x= c(1.5, 1.5, 1.5),        
           y= c(-23,20,25),  
           label= c("-23","20","25"),     
           color=vec_fill) +
  annotate(geom= "segment",             # add lines
           x= c(1.6,1.6,1.6),              # starts after first box
           xend= c(1.9,1.9,1.9),           # ends just before the second box
           y= c(25,20,-23),           
           yend= c(25,20,-23)) +
  annotate(geom= "rect",                #add boxes
           xmin = c(1.35,1.35,1.35),       # starting x
           xmax = c(1.6,1.6,1.6),          # ending x point
           ymin = c(23,18,-25),            # starting y point
           ymax = c(27,22,-21),            # ending y point
           alpha = 0.2,
           linetype=1,
           color = "black")      
plot(plot1A)

## 2nd way: data and mapping in ggplot (not preferred but often used)
## This is only a good idea if every plot component uses the same mapping

plot1B = ggplot(data=weatherData,
                mapping=aes(x=Ordered_windDir, y=changeMaxTemp)) +
  geom_boxplot(na.rm = TRUE) +
  theme_minimal() +
  labs(title = "Change in Temperature vs. Wind Direction",
       subtitle = "Lansing, Michigan: 2016",
       x = "Wind Direction",
       y = "Change in Temperature (\u00B0F)") +
  annotate(geom= "point",
           x = vec_x,
           y = vec_y,
           size = vec_size,
           color = "black",
           fill = vec_fill,
           shape = c(21,22,23)) +
  annotate(geom= "text",                #add text lables
           x= c(1.5, 1.5, 1.5),        
           y= c(-23,20,25),  
           label= c("-23","20","25"),     
           color=vec_fill) +
  annotate(geom= "segment",             # add lines
           x= c(1.6,1.6,1.6),              # starts after first box
           xend= c(1.9,1.9,1.9),           # ends just before the second box
           y= c(25,20,-23),           
           yend= c(25,20,-23)) +
  annotate(geom= "rect",                #add boxes
           xmin = c(1.35,1.35,1.35),       # starting x
           xmax = c(1.6,1.6,1.6),          # ending x point
           ymin = c(23,18,-25),            # starting y point
           ymax = c(27,22,-21),            # ending y point
           alpha = 0.2,
           linetype=1,
           color = "black")      
plot(plot1B)

## 3rd way: data and mapping in plot components (often used)
##  good: can use multiple data frames, additions are easier
##  bad: Problematic when you use facets

plot1C = ggplot() +
   geom_boxplot(data=weatherData,mapping=aes(x=Ordered_windDir, 
       y=changeMaxTemp),
               na.rm = TRUE) +
  theme_minimal() +
  labs(title = "Change in Temperature vs. Wind Direction",
       subtitle = "Lansing, Michigan: 2016",
       x = "Wind Direction",
       y = "Change in Temperature (\u00B0F)") +
  annotate(geom= "point",
           x = vec_x,
           y = vec_y,
           size = vec_size,
           color = "black",
           fill = vec_fill,
           shape = c(21,22,23)) +
  annotate(geom= "text",                #add text lables
           x= c(1.5, 1.5, 1.5),        
           y= c(-23,20,25),  
           label= c("-23","20","25"),     
           color=vec_fill) +
  annotate(geom= "segment",             # add lines
           x= c(1.6,1.6,1.6),              # starts after first box
           xend= c(1.9,1.9,1.9),           # ends just before the second box
           y= c(25,20,-23),           
           yend= c(25,20,-23)) +
  annotate(geom= "rect",                #add boxes
           xmin = c(1.35,1.35,1.35),       # starting x
           xmax = c(1.6,1.6,1.6),          # ending x point
           ymin = c(23,18,-25),            # starting y point
           ymax = c(27,22,-21),            # ending y point
           alpha = 0.2,
           linetype=1,
           color = "black")      
plot(plot1C)

## 4th way: explicit mapping in plot components (not often used)
##   This is essentially treated as an annotate
##   bad: does not work with facets

plot1D = ggplot() +
  geom_boxplot(mapping=aes(x=Ordered_windDir, y=changeMaxTemp), 
               na.rm = TRUE) +
  theme_minimal() +
  labs(title = "Change in Temperature vs. Wind Direction",
       subtitle = "Lansing, Michigan: 2016",
       x = "Wind Direction",
       y = "Change in Temperature (\u00B0F)") +
  annotate(geom= "point",
           x = vec_x,
           y = vec_y,
           size = vec_size,
           color = "black",
           fill = vec_fill,
           shape = c(21,22,23)) +
  annotate(geom= "
           
           text",                #add text lables
           x= c(1.5, 1.5, 1.5),        
           y= c(-23,20,25),  
           label= c("-23","20","25"),     
           color=vec_fill) +
  annotate(geom= "segment",             # add lines
           x= c(1.6,1.6,1.6),              # starts after first box
           xend= c(1.9,1.9,1.9),           # ends just before the second box
           y= c(25,20,-23),           
           yend= c(25,20,-23)) +
  annotate(geom= "rect",                #add boxes
           xmin = c(1.35,1.35,1.35),       # starting x
           xmax = c(1.6,1.6,1.6),          # ending x point
           ymin = c(23,18,-25),            # starting y point
           ymax = c(27,22,-21),            # ending y point
           alpha = 0.2,
           linetype=1,
           color = "black")      
plot(plot1D)

#### Part B: Using Facet Wrap ##### -------------------

#- create a scatterplot of pressure vs humidity
# - facet_wrap two other variables to create between 9 and 30 plots
#    - hint: https://ggplot2.tidyverse.org/reference/vars.html
#    - change either the number of rows or columns in the facet_wrap
#    - hint: https://ggplot2.tidyverse.org/reference/facet_wrap.html
#    - modify one other argument (aside from rows and columns) in facet_wrap 
#    - explain what the other argument does in comments
# - facet_grid the same two variable for the same scatterplot

plot2A <- ggplot(data = weatherData) +
  geom_point(mapping = aes(x= stnPressure, y= relHum)) +
  theme_bw()+
  facet_wrap(facets = vars(windSpeedLevel, windDir), 
             nrow = 4, ncol = 3, 
             as.table = FALSE)+   # If true, facets are laid out like a table with 
                                  # highest value on bottom right. 
                                  # If false, facets laid out like a plot with 
                                  # highest values to the top right. 
  labs(title = "Temperature vs. Humidity",
       subtitle = "Faceted by wind speed and wind direction",
       x = "Pressure",
       y = "Relative humidity")
plot(plot2A)


plot2B <- ggplot(data = weatherData) +
  geom_point(mapping = aes(x= stnPressure, y= relHum)) +
  theme_bw()+
  facet_grid( rows = vars(windSpeedLevel),
              cols = vars(windDir))+
  labs(title = "Temperature vs. Humidity",
       subtitle = "faceted by wind speed",
       x = "Humidity (%)",
       y = "Temperature (F)")
plot(plot2B)


#didnt get to part C

