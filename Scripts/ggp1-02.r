#FW891 Advanced Topics in R
#Carly Andrews
#homework wk 2

#A) Create a script file names ggp1-02.r in your RStudio Project's scripts folder

#B) Looking at the GGPlot cheat sheet (or the GGPlot functions page) from 
#section 4, answer the following in comments in ggp1-02.r:

#What component (function) would be used to create a text plot?
  #   e + geom_text

#what component would you use to change the breaks on the x-axis if the values 
#were in date format?
  #   e + scale_x_date

#C) Create a scatterplot in GGPlot in the ggp-1-02.r script:

#Create a scatterplot of stnPressure vs windSpeed using the data from Lansing2016NOAA.csv
weatherData <- read.csv(file="data/Lansing2016NOAA.csv")

plot1 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=stnPressure, y=windSpeed) );
plot(plot1)

#Add a title and labels the axes appropriately
plot1 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=stnPressure, y=windSpeed) ) +
  labs( title="Pressure vs Wind Speed",
        subtitle="Lansing, MI -- 2016",
        x = "Stn Pressure",
        y = "Wind Speed") +
plot(plot1)

#Change the plot theme to one of your choice
plot1 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=stnPressure, y=windSpeed) ) +
  labs( title="Pressure vs Wind Speed",
        subtitle="Lansing, MI -- 2016",
        x = "Stn Pressure",
        y = "Wind Speed") +
  theme_bw() +
  plot(plot1)

#Change the angle of the stnPressure axis labels to 45 degrees
plot1 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=stnPressure, y=windSpeed) ) +
  labs( title="Pressure vs Wind Speed",
        subtitle="Lansing, MI -- 2016",
        x = "Stn Pressure",
        y = "Wind Speed") +
  theme_bw() +
  guides(x = guide_axis(angle = 45)) 
  plot(plot1)

#Change the stnPressure breaks to go up by 0.1
  plot1 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=stnPressure, y=windSpeed) ) +
    labs( title="Pressure vs Wind Speed",
          subtitle="Lansing, MI -- 2016",
          x = "Stn Pressure",
          y = "Wind Speed") +
    theme_bw() +
    guides(x = guide_axis(angle = 45)) +
    scale_y_continuous( breaks = seq(from=28, to=30, by=0.1), 
                        limits = c(28.5,29.5))
  plot(plot1)
  
#Have the wind-speed axis only display three values: 3, 12, 21
  plot1 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=stnPressure, y=windSpeed) ) +
    labs( title="Pressure vs Wind Speed",
          subtitle="Lansing, MI -- 2016",
          x = "Stn Pressure",
          y = "Wind Speed") +
    theme_bw() +
    guides(x = guide_axis(angle = 45)) +
    scale_y_continuous( breaks = seq(from=28, to=30, by=0.1), 
                        limits = c(28.5,29.5)) +
    scale_x_continuous(breaks = c(3,12,21), 
                       limits = c(0,21))
  plot(plot1)
  
#Challenge: Use the limits argument in scale_x_continuous and scale_y_continuous 
  #to remove the top and right parts of the plot where there are only a couple points.
#limits is set equal to a vector with two values -- so limits = c(0,100) would mean the axis would go from 0 to 100