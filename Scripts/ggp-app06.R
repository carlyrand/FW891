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

#plots----------------------------------------------------------------

#order wind speed and add it to the dataset
ordered_wind_sp <- factor(weatherData$windSpeedLevel,
                          levels = c("High","Medium","Low"))
weatherData$ordered_wind_sp = ordered_wind_sp

#order wind direction and add it to the dataset
ordered_wind_dir <- factor(weatherData$windDir,
                           levels = c("North","South","East","West"))
weatherData$ordered_wind_dir = ordered_wind_dir

# Question #1) Temperature vs. Humidity
plot1 <- ggplot(data = weatherData) +
  geom_point(mapping = aes(x= relHum, y= avgTemp)) +
  theme_minimal()+
  facet_grid( rows = vars(ordered_wind_sp),
              cols = vars(ordered_wind_dir))+
  labs(title = "Temperature vs. Humidity",
       subtitle = "faceted by wind speed",
       x = "Humidity (%)",
       y = "Temperature (F)")
plot(plot1)

#Question 2: Average temp vs season
#order season and add it to the dataset
ordered_season = factor(weatherData$season,
                        levels=c("Spring", "Summer", "Fall", "Winter"))
weatherData$ordered_season = ordered_season

# add to plot2
plot2 = ggplot( data=weatherData ) +
  geom_histogram( mapping=aes(x= avgTemp, fill= ordered_season),
                  binwidth = 5,         #previous bin ~ 2.5, new bin= 5
                  color="black") + 
  theme_bw() +
  scale_fill_manual(values = c("green","red","orange","purple")) +
  theme(strip.background = element_rect(fill = "darkorchid3"),
        strip.text = element_text(size = 14,
                                  color = 'white',
                                  family = "serif")) + 
  scale_x_continuous(breaks = seq(from = 5, to = 85, by= 10),
                     limits = c(0,100)) +
  facet_grid(rows = vars(ordered_season)) +
  labs(title = "Temperature (\u00B0F)",
       subtitle = "Lansing, Michigan: 2016",
       x = "Temperature (\u00B0F)")
plot(plot2)

#Question 3) 

#order wind speed and add it to the dataset
neworder_wind_sp <- factor(weatherData$windSpeedLevel,
                           levels = c("Low","Medium","High"))
weatherData$neworder_wind_sp = neworder_wind_sp

# Color Vector
boxcolors <- c("blue","yellow2","blue","yellow2",
               "blue","yellow2","blue","yellow2",
               "blue","yellow2","blue","yellow2")

#make plot

boxColors = c(rep("brown", 8),
              rep("blue", 3),
              "brown");

plot3 = ggplot(data=weatherData) +
  geom_boxplot(mapping=aes(x=ordered_wind_dir, y=changeMaxTemp),
               na.rm = TRUE,
               color = boxColors,
               fill = "grey",
               outlier.colour = rgb(red= 0.9, green= 0.7, blue= 0), 
               outlier.shape = "\uff06",
               outlier.size = 3) +
  theme_bw() +
  facet_grid( cols=vars(neworder_wind_sp)) +
  labs(title = "Change in Temperature vs. Wind Direction",
       subtitle = "Lansing, Michigan: 2016",
       x = "Wind Direction",
       y = "Degrees (F)");
plot(plot3)

#Question 4) How would you hide the outliers?

# There are many possible ways;

# (outlier) alpha = 0 (makes outliers transparent)
# Change the y scale using scale_y_continuous to hide outliers
# outlier.shape = NA
# outlier.color = (set to same color as background of plot)

#Reflections:

#What was your level of comfort with the lesson/application?
#     This lesson was a bit more challenging for me than usual.  

#Approximately how long did you work on this lesson?
#     I worked on this lesson for about 2 hours.

#What areas of the lesson/application confused or still confuses you?
#     I am sometimes uncertain about where components of the ggplot should go

#What are some things you would like to know more about that is related to, but not covered in, this lesson?
#     Not sure at this point, but excited to get into making maps



