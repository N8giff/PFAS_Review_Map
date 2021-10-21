#Load libraries
library(ggmap)
library(ggplot2)
library(rstudioapi)
library(sp)

#Register Google API
register_google(key = '')

#Load Data frame
data <- read.csv("~/Desktop/R Projects/PFAS Review/Location_Data.csv")

#View Data
head(data)

#Create a map 
locations <- ggmap(get_googlemap(center = c(lon = 18.553428, lat = 34.020786),
                                    zoom = 1, 
                                    
                                    scale = 2,
                                    maptype = 'roadmap', 
                                    style = 'administrative|element:labels|visibility:off',
                                    color = 'bw')) +
           
  #Adjust map scale  
  scale_x_continuous(limits=c(-87, 167)) +
  
  #Add data and color by site 
  geom_point(data = data, aes(x = Longitude, y = Latitude, 
                              color = Year, 
                              shape = Class), 
                              size = 3,
                              show.legend = TRUE) +
  #Change colors for Year
  scale_color_manual(values=c("#648FFF", "#DC267F", "#FFB000"))+
    
  #Delete axis info
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.y = element_blank(),
        axis.title.x = element_blank()) +
  
  #Adjust size and position of title text (use labs to add title)
  theme(
        plot.title = element_text(size = 15, hjust = 0.5 ), 
        plot.subtitle = element_text(size = 10, hjust = 0.5 )) +
  
  #Adjust size/position of legend text
  theme(legend.title = element_text(size = 14), 
        legend.text = element_text(size = 12),
        legend.position = 'bottom',
        legend.box = 'horizontal') +


#Print map!!
print(locations)
