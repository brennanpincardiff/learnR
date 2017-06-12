# script for drawBarChart
# inport the data
fileName <- "Namibia_region_urbanRural.csv"
path <- "/Users/paulbrennan/Documents/learnR/data/"
data <- read.csv(file = paste0(path,fileName))

data <- read.csv(file.choose())  # interesting function.
str(data)

library("ggplot2")

# grammer of graphics
# three parts

ggplot(data = data[data$region=="Namibia",],
       aes( x = Date, 
            y = Value,
            fill = residence)) +
  geom_bar(stat = "identity")

# R is treating these dates as a integer
str(data$Date)



# convert data to a factor
ggplot(data = data[data$region=="Namibia",],
       aes( x = as.factor(Date), 
            y = Value,
            fill = residence)) +
  geom_bar(stat = "identity")



# subset the data to exclude whole country
data_regions <- data[!data$region=="Namibia",]
# focus on 2011 data
ggplot(data = data_regions[data_regions$Date == 2011,],
       aes(x = region,
           y = Value, 
           fill = residence)) +
  geom_bar(stat = "identity")
# zoom to see the y-labels more clearly


# put our plots in an object
p <- ggplot(data = data_regions[data_regions$Date == 2011,],
            aes(x = region,
                y = Value, 
                fill = residence)) +
  geom_bar(stat = "identity")

# show object with a different theme
p + theme_bw()

# add the theme to the object
p <- p + theme_bw()


# add titles
p <- p + labs(x = "Regions of Namibia",         # label x-axis
              y = "Residence Type \n (% of pop)",  # label y-axis
              title = "Rural & Urban Residences - Namibia (2011)",
              subtitle = "source: http://namibia.opendataforafrica.org")

p  # show the object


# customise the format of the text
# first change the angle of the text on the x axis
p <- p + theme(axis.text.x=element_text(size=8,  
                                        angle=45,
                                        hjust=1)) 
p  # show the object


p <- p + theme(plot.title=element_text(size=12,
                                       hjust=0.5,
                                       face="bold",
                                       colour="red",
                                       vjust=-1))
p  # show the object


p <- p + theme(plot.subtitle=element_text(size=6, 
                                          hjust=0.5, 
                                          face="italic", 
                                          color="black"))
p # show the plot


## Export and saving your plot

p + ggsave("Namibia_Regions_Residences_2011.pdf")



## Re-using your plot with new data.

p1991 <- p %+% data_regions[data_regions$Date == 1991,]

# change the title
p1991 <- p1991 + ggtitle("Rural & Urban Residences - Namibia (1991)")
p1991 # show the object
# it's removed the subtitle - please try to put it back...


## Using faceting to show multiple plots.
# all three years worth of data...
f <- ggplot(data = data_regions,
            aes(x = region,
                y = Value, 
                fill = residence)) +
  geom_bar(stat = "identity")
f # show the object

# use facet_wrap to separate them again
f + facet_wrap(~Date) +
  theme(axis.text.x=element_text(size=8,  
                                 angle=45,
                                 hjust=1)) 
# remember this will just display the object 

# Practice: change axis on this plot...

# changing colours
p + scale_fill_brewer(palette = 10)
