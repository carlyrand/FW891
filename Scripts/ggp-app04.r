# FW891  January 21 2022
### Week 4 Homework
### Carly Andrews 


#setup---------------------------------------------------------------------
rm(list=ls());                         # clear Environment tab
options(show.error.locations = TRUE);  # show line numbers on error
library(package=ggplot2);              # get the GGPlot package

# read in CSV file and save the content to weatherData
weatherData = read.csv(file="data/Lansing2016NOAA.csv", 
                       stringsAsFactors = FALSE);  # for people still using R v3

#plots--------------------------------------------------------------------

#line plots

#had to do this to get legend to show up?
colors <- c("Sunrise" = "Yellow", "Sunset" = "red")


line1 = ggplot(data=weatherData) +
  geom_line(mapping=aes(x=1:nrow(weatherData), y=sunrise,),
            linetype=3,
            color=rgb(red=1.0, green=1.0, blue=0.0),
            size=1.5
            ) +
  geom_line(mapping=aes(x=1:nrow(weatherData), y=sunset), 
            linetype=3,
            color=rgb(red=1.0, green=0.0, blue=0.0),
            size=1.5) + 
  theme_bw() +
  labs(title = "Annual Sunrise and Sunset times",
       subtitle = "Lansing, Michigan: 2016",
       x = "Day (row) number",
       y = "Time of Day") +
  scale_color_manual(values = colors) +
  theme(axis.ticks = element_line(color="black", size=1),
        axis.title.x=element_text(size=10, color="darkblue"),
        axis.title.y=element_text(size=10, color="darkblue"),
        panel.background = element_rect(fill="lightblue", color="blue"),
        panel.grid.minor = element_line(color="white", linetype=4),
        panel.grid.major = element_line(color="white"))

plot(line1)

line2 = ggplot(data=weatherData) +
  geom_line(mapping=aes(x=1:nrow(weatherData), y=sunrise,),
            linetype=5,
            color=rgb(red=1.0, green=1.0, blue=0.3),
            size=1
  ) +
  geom_line(mapping=aes(x=1:nrow(weatherData), y=sunset), 
            linetype=5,
            color=rgb(red=1.0, green=0.0, blue=0.3),
            size=1) + 
  theme_bw() +
  labs(title = "Annual Sunrise and Sunset times",
       subtitle = "Lansing, Michigan: 2016",
       x = "Day (row) number",
       y = "Time of Day") +
  scale_color_manual(values = colors) +
  theme(axis.ticks = element_line(color="red", size=1), 
        axis.title.x=element_text(size=11, color="lightgrey"),
        axis.title.y=element_text(size=11, color="lightgrey"),
        legend.text=element_text(size=10, color = "lightgrey"),
        legend.title=element_text(size=10, color = "lightgrey"),
        panel.background = element_rect(fill="lightgrey", color="blue"),
        panel.grid.minor = element_line(color="black", linetype=4),
        panel.grid.major = element_line(color="black"));

plot(line2);


#scatter plots

scatter1 = ggplot( data=weatherData) +
  geom_point( mapping=aes(x=avgTemp, y=windSpeed),
              color="darkgreen",
              size=2,
              shape="\u25B2",
              alpha = 0.8 ) +
  theme_bw() +
  labs(title = "Average Tempurature vs. Windspeed",
       subtitle = "Lansing, Michigan: 2016",
       x = "Average Tempurature",
       y = "Windspeed") +
  
  theme(plot.title=element_text(size=18, face="bold", color ="darkblue"),
        plot.subtitle=element_text(size=10, face="bold.italic",
                                   color ="brown", family="serif"),
        axis.title.x=element_text(size=12, color="orange"),
        axis.title.y=element_text(size=12, color="orange"),
        axis.text.x=element_text(size=8, color = "orange"),
        axis.text.y=element_text(size=8, color = "orange"),
        panel.background = element_rect(fill="lightyellow", color="blue"),
        panel.grid.minor = element_line(color="darkgrey", linetype=4),
        panel.grid.major = element_line(color="darkgrey"));

plot(scatter1)


scatter2 = ggplot( data=weatherData) +
  geom_point( mapping=aes(x=avgTemp, y=windSpeed),
              color="darkgreen",
              size=3,
              shape="\u25BC",
              alpha = 0.5 ) +
  theme_bw() +
  labs(title = "Average Tempurature vs. Windspeed",
       subtitle = "Lansing, Michigan: 2016",
       x = "Average Tempurature",
       y = "Windspeed") +
  theme(plot.title=element_text(size=18, face="bold",
                                color ="darkblue"),
        plot.subtitle=element_text(size=10, face="bold.italic",
                                   color ="brown", family="serif"),
        axis.title.x=element_text(size=13, color="black"),
        axis.title.y=element_text(size=13, color="black"),
        panel.background = element_rect(fill="darkgrey", color="blue"),
    #    panel.boarder = element_rect (color = "darkblue"),  
        panel.grid.minor = element_line(color="lightgrey", linetype=4),
        panel.grid.major = element_line(color="lightgrey"));

plot(scatter2)

scatter3 = ggplot( data=weatherData) +
  geom_point( mapping=aes(x=avgTemp, y=windSpeed),
              color="darkgreen",
              size=2,
              shape="\u25EF",
              alpha = 0.8 )
plot(scatter3)

scatter4 = ggplot( data=weatherData) +
  geom_point( mapping=aes(x=avgTemp, y=windSpeed),
              color="darkgreen",
              size=2,
              shape="\u25FC",
              alpha = 0.8 )
plot(scatter4)

#greyscale plot
scatter5 = ggplot( data=weatherData) +
  geom_point( mapping=aes(x=avgTemp, y=windSpeed),
              color="grey20",
              size=2,
              shape="\u25B2",
              alpha = 0.8 ) +
  labs(title = "Average Tempurature vs. Windspeed",
       subtitle = "Lansing, Michigan: 2016",
       x = "Average Tempurature",
       y = "Windspeed") +
   theme( panel.background = element_rect(fill="grey80", color="grey80"),
          panel.grid.minor = element_line(color="grey60", linetype=4),
          panel.grid.major = element_line(color="grey60"))
plot(scatter5)
  


#Report--------------------------------------------------------------
#In comments at the end of your script, copy the above and explain how each 
# was used. 

#6 modifications to plot points using at least 3 unique properties (color, size...)
    #two scatter plots, each with differing values for: color, size, and shape 

#6 modifications to plot lines using at least 3 unique properties (linetype, color...)
    #two line plots, each with differing values for: color, linetype, and size 

#Modifications to 8 unique element_text() subcomponent
    #each plot (4) has two unique element_text() subcomponents
  #notes added 2/3:
    #8 unique element_text():
    #axis.title.x=element_text()   (allplots)
    #axis.title.y=element_text()   (allplots)
    #plot.title=element_text()     (scatter1&2)
    #plot.subtitle=element_text()  (scatter1&2)
    #axis.text.x=element_text()    (scatter1)
    #axis.text.y=element_text()    (scatter1)
    #legend.text=element_text()    (line1)     #cant get a legend to show up 
    #legend.title=element_text()   (line1)    # #cant get a legend to show up 
  #end notes added 2/3

#Modifications to 4 unique element_line() subcomponent
    #each plot (4) has three unique element_line() subcomponents

#Modifications to 4 unique element_rect() subcomponent
    #each plot (4) has one unique element_rect() subcomponents
  #notes added 2/3
    #4 unique element_rect()
    #
    #panel.background = element_rect ()   (scatter 2)
    #panel.boarder = element_rect ()      (scatter 2)
    #legend.background = element_rect () #couldn't get a legend to
    #legend.key = element_rect ()        #show up, so couldn't use these     

#5 uses of Unicode 
    #five scatter plots, with five different codes

#4 uses of rgb() colors
    #two line plots, each with two uses of rgb color

#1 use of alpha
    #Used in scatter plots

#2 uses of greyscale
    #Three uses in final plot (scatter 5)



#Questions

#What was your level of comfort with the lesson/application?
    #I was pretty comfortable with this content. 

#What areas of the lesson/application confused or still confuses you?
    #I got tripped up with the Unicode, and struggled a bit with coding the theme
    #sub component
    #also couldnt get a legend to show up

#What is a way you can apply the material in this lesson towards your research or area of study?
    #making useful and informative figures which are also reproducible/easily updated
    #will save me alot of time.

#What are some things you would like to learn related to, but not covered in, this lesson?
    #multifaceted figures, adjusting the size of the facet tiles


