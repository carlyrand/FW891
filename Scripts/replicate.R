#FW891 R Topics
#Homework Due Feb 15: Replicate the plot 
#Carly Andrews

#notes: only thing I couldn't replicate was the shape. My shape_scale_manual line
#wont change the shapes Not sure why. 

#setup---------------------------------------------------------------
rm(list=ls());                         # clear Environment tab
options(show.error.locations = TRUE);  # show line numbers on error
library(package=ggplot2);              # get the GGPlot package

# read in CSV file and save the content to weatherData
weatherData = read.csv(file="data/Lansing2016NOAA.csv", 
                       stringsAsFactors = FALSE);  # for people still using R v3


#Replicate the plot---------------------------------------------------------------

WindDirOrdered = factor(weatherData$windDir,
                       levels=c("North", "East", "South", "West"));

scatter1 = ggplot( data=weatherData) +
  geom_point(mapping=aes(x=relHum, y=avgTemp, color=windSpeed,  
                         shape = WindDirOrdered)) +
  theme_minimal() +
  labs(title = "Humidity vs. Tempurature",
       subtitle = "Lansing, Michigan: 2016",
       x = "Humidity (%)",  
       y = "Temp (F)") +
  scale_shape_manual(values=c(1,2,3,4)) +
  #values=c("~","%","@","*") cant get this line to work, even with simple shapes
  scale_color_gradientn(colors=c("green", "yellow", "purple"),
                        values=c(0,0.25,0.5,1)) +
  theme(legend.position = "bottom",
        axis.line = element_line(size = 1.5, color="blue"),
        panel.background = element_rect(fill="black", color="black"),
        panel.grid.minor = element_line(color="light grey", linetype=4),
        panel.grid.major = element_line(color="light grey"),
        plot.background = element_rect(fill = "light yellow"),
        plot.title = element_text(hjust=0.5, face = "bold", color = "Dark green"),
        plot.subtitle = element_text(hjust=0.5, face = "italic", size = 8))

plot(scatter1)
