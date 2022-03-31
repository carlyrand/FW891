# FW891  March 15 2022
### Week 9 Homework
### Carly Andrews 


#Setup-----------------------------------------------------------------
rm(list=ls());                         # clear Environment tab
options(show.error.locations = TRUE);  # show line numbers on error
library(package=ggplot2);              # get the GGPlot package
library(package=gridExtra);            # for multipaneling

weatherData = read.csv(file="data/Lansing2016NOAA.csv", 
                       stringsAsFactors = FALSE);

#Histograms-----------------------------------------------------------------

snowyDays = grep(weatherData$weatherType, pattern="SN");   # any day with snow
breezyDays = grep(weatherData$weatherType, pattern="BR");   # any day with snow
rainyDays = grep(weatherData$weatherType, pattern="RA");   # any day with snow

snowyAndbreezyDays = intersect(snowyDays, breezyDays)
snowyORbreezyDays = union(snowyDays, breezyDays)

plot1 = ggplot(data=weatherData[snowyDays,]) +
  geom_histogram(mapping=aes(x=tempDept)) +
  theme_classic() +
  labs(title = "Tempurature Difference from Historic Average",
       subtitle = "on snowy days") +
  geom_vline(aes(xintercept = mean(weatherData[snowyDays,5])),
             col='red',size=1)+
  annotate(geom="text",   # type of annotation
           x=-8,         # x coordinate of annotation
           y=7.5,         # y coordinate of annotation
           label= round(mean(weatherData[snowyDays,5]), 
                        digits = 2),   # the annotation
           color="red"); # can add style subcomponents
plot(plot1)

plot2 = ggplot(data=weatherData[breezyDays,]) +
  geom_histogram(mapping=aes(x=tempDept)) +
  theme_classic() +
  labs(title = "Tempurature Difference from Historic Average",
       subtitle = "on breezy days") +
  geom_vline(aes(xintercept = mean(weatherData[breezyDays,5])),
             col='red',size=1) +
  annotate(geom="text",   # type of annotation
           x=-2,         # x coordinate of annotation
           y=20,         # y coordinate of annotation
           label= round(mean(weatherData[breezyDays,5]), 
           digits = 2),   # the annotation
           color="red"); # can add style subcomponents
plot(plot2)

plot3 = ggplot(data=weatherData[rainyDays,]) +
  geom_histogram(mapping=aes(x=tempDept)) +
  theme_classic() +
  labs(title = "Tempurature Difference from Historic Average",
       subtitle = "on rainy days")+
  geom_vline(aes(xintercept = mean(weatherData[rainyDays,5])),
             col='red',size=1) +
  annotate(geom="text",   # type of annotation
           x=-1,         # x coordinate of annotation
           y=15,         # y coordinate of annotation
           label= round(mean(weatherData[rainyDays,5]), 
                        digits = 2),   # the annotation
           color="red"); # can add style subcomponents
plot(plot3)

plot4 = ggplot(data=weatherData[snowyAndbreezyDays,]) +
  geom_histogram(mapping=aes(x=tempDept)) +
  theme_classic() +
  labs(title = "Tempurature Difference from Historic Average",
       subtitle = "on snowy and breezy days") +
  geom_vline(aes(xintercept = mean(weatherData[snowyAndbreezyDays,5])),
             col='red',size=1) +
  annotate(geom="text",   # type of annotation
           x=-8,         # x coordinate of annotation
           y=5,         # y coordinate of annotation
           label= round(mean(weatherData[snowyAndbreezyDays,5]), 
                        digits = 2),   # the annotation
           color="red"); # can add style subcomponents
plot(plot4)

plot5 = ggplot(data=weatherData[snowyORbreezyDays,]) +
  geom_histogram(mapping=aes(x=tempDept)) +
  theme_classic() +
  labs(title = "Tempurature Difference from Historic Average",
       subtitle = "on snowy or breezy days") +
  geom_vline(aes(xintercept = mean(weatherData[snowyORbreezyDays,5])),
             col='red',size=1)+
  annotate(geom="text",   # type of annotation
           x=-3,         # x coordinate of annotation
           y=20,         # y coordinate of annotation
           label= round(mean(weatherData[snowyORbreezyDays,5]), 
                        digits = 2),   # the annotation
           color="red"); # can add style subcomponents
plot(plot5)

#Multi-Histograms -------------------------------------------------

multi1=arrangeGrob(plot1, plot2, plot3, plot4, plot5, nrow=2);
plot(multi1)

multi2=arrangeGrob(plot1, plot3, plot5,
                   layout_matrix = rbind(c(1,3,5),   
                                         c(1,NA,5)),
                   top="this", 
                   bottom="that");
plot(multi2)

#Questions

#What was your level of comfort with the lesson/application?
#I was pretty comfortable with this content. 

#What areas of the lesson/application confused or still confuses you?
#Can I add mean = x to the label? Couldn't figure out how to add text before 
# the calculation 

#What is a way you can apply the material in this lesson towards your research or area of study?
#I like this way of adding multiple plots better than facet_wrap; I will use this
# method better. 

#What are some things you would like to learn related to, but not covered in, this lesson?
# Can I add one big title to the top of the canvas? 


