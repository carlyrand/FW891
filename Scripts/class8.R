# Exercise 1 

rm(list=ls());                         # clear Environment tab
options(show.error.locations = TRUE);  # show line numbers on error
library(package=ggplot2);              # get the GGPlot package
library(package=ggforce);              # for geom_circle, geom_ellipse

# read in CSV file and save the content to weatherData
weatherData = read.csv(file="data/Lansing2016NOAA.csv");
janTemps = read.csv(file="data/LansingJanTemps.csv");  # second data frame

plotA1 = ggplot(data=weatherData) +  
  theme_bw() +
  geom_curve(x = 37, y = 50, xend = 20, yend = 48, 
             curvature = -.5, arrow = arrow(length = unit(0.3, "inches"))) +
  annotate(geom_curve(x = 55, y = 85, xend = 83, yend = 82, curvature = -.5)) +
  geom_point(mapping=aes(x=avgTemp, y=relHum)) +
  geom_smooth(mapping=aes(x=avgTemp, y=relHum),
              method = "lm",
              fill = "red");
plot(plotA1)

#annotate curve isnt working

#Exercise Two:

plotA2 = ggplot(data=weatherData) +  
  theme_bw() +
  geom_abline(slope = 0.7, intercept = 32.5) +
  geom_abline(slope = -0.7, intercept = 101) +
  geom_point(mapping=aes(x=avgTemp, y=relHum)) +
  geom_smooth(mapping=aes(x=avgTemp, y=relHum),
              method = "lm",
              fill = "red")
plot(plotA2)





