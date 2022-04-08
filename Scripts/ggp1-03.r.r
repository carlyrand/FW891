# FW891  January 21 2022
### Mapping and Aesthetics Homework 
### Carly Andrews 

#setup-------------------------------------------------------------------
rm(list=ls());                         # clear environment 
options(show.error.locations = TRUE);  # show line numbers on error

library(package=ggplot2);

# read in data
weatherData = read.csv(file="Data/Lansing2016NOAA.csv")



#APPLICATION 10--------------------------------------------------------------

# A) The code color=season is a mapping component that assigns colors based on 
#      the season of data collection. 

# B)
Plot1 <- ggplot(data = weatherData) +
  geom_jitter(mapping= aes(x= tempDept, y = windSpeed, 
                           size= precip2, color= windDir)) +
  labs(title ="Wind Speed vs.Temperature",
       subtitle= "Precipitation and wind direction",
       Y = "Wind Speed",
       x = "Temperature (F)",
       size = "Precipitation",
       color = "Wind Direction") +
  theme_bw()                 +
  theme(legend.position = c(.99, .99),       ## pulled from help page
        legend.justification = c("right", "top"),
        legend.box.just = "right",               
        legend.margin = margin(5, 5, 5, 5))

plot(Plot1)

# The plot shows that the direction of the wind has a greater effect on 
# the chance of precipitation than the temperature does. Westerly winds show the 
# greatest chance of precipitation. 


# C)
plot2 <- ggplot(data = weatherData) +
  geom_jitter(mapping= aes(x= relHum, y = avgTemp, size= stnPressure, color= windDir,
                           shape = season)) +
  labs(title ="Humidity vs.Temperature",
       subtitle= "Seasonal pressure and wind variation",
       Y = "Wind Speed",
       x = "Relative Humidity",
       size = "Pressure (mb)",
       color = "Wind Direction",
       shape = "Season") +
  theme_gray()   
plot(plot2)


#Questions to Answer 

# 1 
# I was pretty comfortable with the content in this homework. 

# 2
# I worked on this lesson for about half an hour. 
