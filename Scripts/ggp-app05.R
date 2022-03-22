#FW891 R Topics
#Homework Due Feb 15
#Carly Andrews

#setup---------------------------------------------------------------
rm(list=ls());                         # clear Environment tab
options(show.error.locations = TRUE);  # show line numbers on error
library(package=ggplot2);              # get the GGPlot package

# read in CSV file and save the content to weatherData
weatherData = read.csv(file="data/Lansing2016NOAA.csv", 
                       stringsAsFactors = FALSE);  # for people still using R v3


#plots---------------------------------------------------------------

#Plot One: Humidity vs. Average Tempurature
seasonOrdered = factor(weatherData$season,
                       levels=c("Spring", "Summer", "Fall", "Winter"));

scatter1 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=relHum, y=avgTemp, color=seasonOrdered),
              shape = seasonOrdered) +
  theme_bw() +
  labs(title = "Humidity vs. Average Tempurature",
     subtitle = "Lansing, Michigan: 2016",
     x = "Average Tempurature (\u00B0F)",  
     y = "Humidity (\u0025)") +
  geom_smooth(mapping = aes(x=relHum, y=avgTemp),
              method = lm)

#plot(scatter1)

scatter2 <- scatter1 +
  scale_shape_manual(values=c(21,22,23,24)) +
  scale_color_manual(values=c("Summer" = "red",
                              "Spring" = "green", 
                              "Fall" = "yellow", 
                              "Winter" = "blue")) 

plot(scatter2)

#getting this error on the trend lines:
#`geom_smooth()` using formula 'y ~ x'
#Error: stat_smooth requires the following missing aesthetics: x and y
#Run `rlang::last_error()` to see where the error occurred.


#Plot Two: Histogram of Wind Level
windSpeedLevelordered <- factor(weatherData$windSpeedLevel, 
                                levels = c("Low", "Medium", "High"))

hist1 = ggplot( data=weatherData ) +
  geom_histogram( mapping=aes(x=relHum, 
  color = windSpeedLevelordered)) +  
  theme_bw() +
  scale_color_manual(values=c("green", "yellow", 
                             "red")) +
  labs(title = "Wind Speeds",
       subtitle = "Lansing, Michigan: 2016",
       x = "Wind Speed", 
       y = "Count",
       color = "Wind Speed");     
#plot(hist1)

hist2 = hist1 +
  theme(
   panel.background = element_rect(fill="black", color="black"),
   panel.grid.minor = element_line(color="lightgrey", linetype=4),
   panel.grid.major = element_line(color="lightgrey"))

plot(hist2)


#Plot Three: Humidity vs. Average Temperature

scatter3 = ggplot( data=weatherData ) +
  geom_point(mapping=aes(x=relHum, y=avgTemp, color=stnPressure),
                         size = 2,
                         alpha =0.5) +
  theme_bw() +
  labs(title = "Relative Humdidity vs. Average Tempurature",
       subtitle = "Lansing, Michigan: 2016",
       x = "Average Tempurature (\u00B0F)",  
       y = "Relative Humidity (\u0025)") +
  scale_color_gradientn(colors=c("green", "yellow", "red"),
                        values=c(0.3,0.6,1)); 

plot(scatter3)

#Questions------------------------------------------------------

#What was your level of comfort with the lesson/application?
#     I felt pretty confident with this content. 

#Approximately how long did you work on this lesson?
#     I worked on this lesson for about 1.5 hours.

#What areas of the lesson/application confused or still confuses you?
#     Not sure why I wasn't able to get the geom_smooth to work for my
#     first scatter plot. 

#What are some things you would like to know more about that is related to, but not covered in, this lesson?
#     Facet_wrap, especially adjusting panel sizes



