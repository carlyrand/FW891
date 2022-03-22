# FW891  February 22 2022
### Week 6 Homework
### Carly Andrews 


#setup---------------------------------------------------------------------
rm(list=ls());                         # clear Environment tab
options(show.error.locations = TRUE);  # show line numbers on error
library(package=ggplot2);              # get the GGPlot package
library(ggforce)

# read in CSV file and save the content to weatherData
weatherData = read.csv(file="data/Lansing2016NOAA.csv", 
                       stringsAsFactors = FALSE);  # for people still using R v3

#plots--------------------------------------------------------------------



###   Question 1:   ###

Ordered_windDir = factor(weatherData$windDir,
                        levels=c("North", "East", "South", "West"))


plot1 = ggplot(data=weatherData) +
  geom_boxplot(mapping=aes(x=Ordered_windDir, y=changeMaxTemp),
               na.rm = TRUE) +
  theme_minimal() +
  labs(title = "Change in Temperature vs. Wind Direction",
       subtitle = "Lansing, Michigan: 2016",
       x = "Wind Direction",
       y = "Change in Temperature (\u00B0F)");
plot(plot1)

#create vectors for added points
vec_x <- c(2,2,2)
vec_y<- c(-23,20,25)
vec_size <- c(4,3,3)
vec_fill <- c("green","blue","red")

# add points to plot
Plot2 <- plot1 +
  annotate(geom= "point",
           x = vec_x,
           y = vec_y,
           size = vec_size,
           color = "black",
           fill = vec_fill,
           shape = c(21,22,23))
plot(Plot2)

## Add text labels, lines, and boxes
plot3 <- Plot2 +
  annotate(geom= "rect",                #add boxes
           xmin = c(1.3,1.3,1.3),       # starting x
           xmax = c(1.7,1.7,1.7),          # ending x point
           ymin = c(23,18,-25),            # starting y point
           ymax = c(27,22,-21),            # ending y point
           alpha = 1,
           linetype=1,
           color = "black",
           fill = "black") +
annotate(geom= "text",                #add text lables
           x= c(1.5, 1.5, 1.5),        
           y= c(-23,20,25),  
           label= c("-23","20","25"),     
           color=vec_fill) +
  annotate(geom= "segment",             # add lines
           x= c(1.6,1.6,1.6),              # starts after first box
           xend= c(1.9,1.9,1.9),           # ends just before the second box
           y= c(25,20,-23),           
           yend= c(25,20,-23))
     
plot(plot3)




###     Question 2:    ###

#calculate medians for the data range
med_temp <- median(weatherData$avgTemp[1:101]) #32
med_hum<- median(weatherData$relHum[1:101]) #73

# first we create a blank canvas by adding a ggplot without any data/plotting
plot4 <- ggplot() + 
  theme_bw() +
  annotate(geom="point",                   # here we actually add in the relevant data
           x = weatherData$avgTemp[1:101],  #subset by the first 100 points
           y = weatherData$relHum[1:101],  
           color = "blue",
           fill = "red",
           size = 3,
           shape = 21) + 
  geom_vline(mapping=aes(xintercept = med_temp),   #add median line for relative humidity
             color = "yellow3",
             size= 1) +
  geom_hline(mapping=aes(yintercept = med_hum),    #add median line for temperature
             color="darkorchid2",
             size=1) +
  annotate(geom="polygon",                         #add polygon
             x = c(23.5,23.5,11,3,18),
             y = c(78,56,60,70,90),
             color = "black",
             fill = "yellow",
             linetype = 1,
             alpha = 0.2) +
  geom_ellipse(mapping=aes(x0 = 42, y0 = 90, 
                  a = 14.2, b= 8, angle=150),      #add ellipse
             alpha=0.2,   
             color = "black",        
             fill = "green",
             size=1,
             linetype=1) +
  labs(title="Annotate: Building a scatterplot",   #add axis labels
             x = "Temperature (average)",
             y = "Relative Humidity") +
plot(plot4)



###      Question 3:     ###

# Use seq() to generate values for plotting 
x_data <- seq(from=1, to=1000, by=1)
y_data <- sqrt(seq(1:1000))

#plot it!
plot5 <- ggplot()+
  theme_minimal() +
  annotate(geom= "point",       #add points
           x= x_data,
           y= y_data,
           color="black",
           fill="salmon",
           size=1,
           shape=1) +
  annotate(geom = "segment",    #add line segment 
           x= 950,              
           xend= 1000,
           y= 30,         
           yend= sqrt(1000),
           color= "black",
           linetype= 1,
           size= 1,
           arrow = arrow()) +
  labs(title = "Plotting: Y = sqrt(x)",
       x = "X",
       y = "Y")
plot(plot5)

#Questions

#What was your level of comfort with the lesson/application?
    #I was pretty comfortable with this content. 

#What areas of the lesson/application confused or still confuses you?
    #I got tripped up with fine tuning the segments on the plots. 

#What is a way you can apply the material in this lesson towards your research or area of study?
    #Making graphs that demonstrate various trends we could see in the data:
    #for example making a figure displaying possible (trail use level - wildlife impact)
    #relationships

#What are some things you would like to learn related to, but not covered in, this lesson?
    #Can you use similar ggploting to add lines and boxes to maps?


